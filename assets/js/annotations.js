(function () {
  'use strict';

  var root = document.querySelector('[data-annotation-root]');
  var article = root && root.querySelector('article');
  if (!root || !article) return;

  var toolbar = document.querySelector('[data-annotation-toolbar]');
  var openButton = document.querySelector('[data-annotation-open]');
  var composer = document.querySelector('[data-annotation-composer]');
  var form = document.querySelector('[data-annotation-form]');
  var quoteBox = document.querySelector('[data-annotation-quote]');
  var list = document.querySelector('[data-annotation-list]');
  var status = document.querySelector('[data-annotation-status]');
  var count = document.querySelector('[data-annotation-count]');
  var errorBox = document.querySelector('[data-annotation-error]');
  var popover = document.querySelector('[data-annotation-popover]');
  var popoverAuthor = document.querySelector('[data-annotation-popover-author]');
  var popoverTime = document.querySelector('[data-annotation-popover-time]');
  var popoverQuote = document.querySelector('[data-annotation-popover-quote]');
  var popoverBody = document.querySelector('[data-annotation-popover-body]');
  var pending = null;
  var comments = [];
  var renderedRanges = [];
  var pagePath = window.location.pathname || '/';
  var userStorageKey = 'learningjournal:user';
  var tokenStorageKey = 'learningjournal:comment-owner-tokens';
  var user = loadUser();
  var ownerTokens = loadOwnerTokens();

  function loadUser() {
    var saved = null;
    try {
      saved = JSON.parse(window.localStorage.getItem(userStorageKey) || 'null');
    } catch (error) {
      saved = null;
    }
    if (!saved || typeof saved !== 'object' || typeof saved.id !== 'string' || !saved.id) {
      saved = { id: createClientId(), name: '' };
      saveUser(saved);
    }
    return { id: saved.id, name: typeof saved.name === 'string' ? saved.name : '' };
  }

  function saveUser(value) {
    try {
      window.localStorage.setItem(userStorageKey, JSON.stringify(value));
    } catch (error) {
      // Private browsing or a full storage quota should not block commenting.
    }
  }

  function createClientId() {
    if (window.crypto && typeof window.crypto.randomUUID === 'function') {
      return window.crypto.randomUUID();
    }
    return 'browser-' + Date.now().toString(36) + '-' + Math.random().toString(36).slice(2);
  }

  function loadOwnerTokens() {
    try {
      var saved = JSON.parse(window.localStorage.getItem(tokenStorageKey) || '{}');
      return saved && typeof saved === 'object' ? saved : {};
    } catch (error) {
      return {};
    }
  }

  function saveOwnerTokens() {
    try {
      window.localStorage.setItem(tokenStorageKey, JSON.stringify(ownerTokens));
    } catch (error) {
      // The server still stores the comment if this browser cannot persist tokens.
    }
  }

  function rememberOwnerToken(id, token) {
    if (!id || !token) return;
    ownerTokens[String(id)] = token;
    saveOwnerTokens();
  }

  function forgetOwnerToken(id) {
    delete ownerTokens[String(id)];
    saveOwnerTokens();
  }

  function textNodes() {
    var walker = document.createTreeWalker(article, NodeFilter.SHOW_TEXT, {
      acceptNode: function (node) {
        var parent = node.parentElement;
        if (!parent || /^(SCRIPT|STYLE|NOSCRIPT)$/.test(parent.tagName)) {
          return NodeFilter.FILTER_REJECT;
        }
        return node.nodeValue ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT;
      }
    });
    var nodes = [];
    var current;
    while ((current = walker.nextNode())) nodes.push(current);
    return nodes;
  }

  function pointOffset(container, offset) {
    var range = document.createRange();
    range.selectNodeContents(article);
    try {
      range.setEnd(container, offset);
    } catch (error) {
      return 0;
    }
    return range.toString().length;
  }

  function selectionData(selectionRange) {
    var articleText = article.textContent;
    var start = pointOffset(selectionRange.startContainer, selectionRange.startOffset);
    var end = pointOffset(selectionRange.endContainer, selectionRange.endOffset);
    if (end < start) {
      var swap = start;
      start = end;
      end = swap;
    }
    var selected = articleText.slice(start, end);
    if (!selected.trim()) return null;
    return {
      start: start,
      end: end,
      selectedText: selected,
      quote: selected.replace(/\s+/g, ' ').trim(),
      prefix: articleText.slice(Math.max(0, start - 120), start),
      suffix: articleText.slice(end, Math.min(articleText.length, end + 120))
    };
  }

  function insideArticle(range) {
    var node = range.commonAncestorContainer;
    return node === article || article.contains(node);
  }

  function showToolbar(range) {
    var rect = range.getBoundingClientRect();
    var left = Math.min(window.innerWidth - 12, Math.max(12, rect.left + rect.width / 2));
    var top = Math.max(8, rect.top - 48);
    toolbar.style.left = left + 'px';
    toolbar.style.top = top + 'px';
    toolbar.hidden = false;
  }

  function hideToolbar() {
    toolbar.hidden = true;
  }

  function captureSelection() {
    var selection = window.getSelection();
    if (!selection || selection.rangeCount === 0 || selection.isCollapsed) return;
    var range = selection.getRangeAt(0);
    if (!insideArticle(range)) return;
    var data = selectionData(range);
    if (!data || data.quote.length < 3) return;
    pending = { range: range.cloneRange(), anchor: data };
    showToolbar(range);
  }

  function openComposer() {
    if (!pending) return;
    quoteBox.textContent = pending.anchor.quote;
    errorBox.textContent = '';
    form.elements.author_name.value = user.name;
    composer.hidden = false;
    hideToolbar();
    var body = form.elements.body;
    if (body) body.focus();
  }

  function closeComposer() {
    composer.hidden = true;
    pending = null;
    if (window.getSelection) window.getSelection().removeAllRanges();
  }

  function setStatus(message, isError) {
    status.textContent = message || '';
    status.classList.toggle('is-error', Boolean(isError));
  }

  function formattedDate(value) {
    try {
      return value ? new Date(value).toLocaleString() : '';
    } catch (error) {
      return value || '';
    }
  }

  function commentById(id) {
    return comments.find(function (comment) { return String(comment.id) === String(id); });
  }

  function hidePopover() {
    popover.hidden = true;
    document.querySelectorAll('.annotation-marker[aria-expanded="true"]').forEach(function (marker) {
      marker.setAttribute('aria-expanded', 'false');
    });
  }

  function showPopover(comment, source) {
    if (!comment) return;
    popoverAuthor.textContent = comment.author_name || 'Anonymous';
    popoverTime.textContent = formattedDate(comment.created_at);
    popoverQuote.textContent = comment.selected_text || '';
    popoverBody.textContent = comment.body || '';
    popover.hidden = false;
    if (source && source.classList.contains('annotation-marker')) {
      source.setAttribute('aria-expanded', 'true');
    }
    var rect = source ? source.getBoundingClientRect() : { left: 16, top: 16, right: 16, bottom: 16 };
    var left = Math.min(window.innerWidth - popover.offsetWidth - 12, Math.max(12, rect.left));
    var top = rect.bottom + 10;
    if (top + popover.offsetHeight > window.innerHeight - 12) {
      top = rect.top - popover.offsetHeight - 10;
    }
    popover.style.left = Math.max(12, left) + 'px';
    popover.style.top = Math.max(12, top) + 'px';
  }

  function focusComment(id, source) {
    var comment = commentById(id);
    var card = document.querySelector('[data-comment-card="' + id + '"]');
    if (!card) return;
    card.classList.add('is-focused');
    if (!source) card.scrollIntoView({ behavior: 'smooth', block: 'center' });
    showPopover(comment, source || card);
    window.setTimeout(function () { card.classList.remove('is-focused'); }, 1600);
  }

  function addText(parent, value) {
    parent.appendChild(document.createTextNode(value || ''));
  }

  function renderList() {
    list.textContent = '';
    count.textContent = comments.length + (comments.length === 1 ? ' comment' : ' comments');
    if (!comments.length) {
      var empty = document.createElement('p');
      empty.className = 'annotation-empty';
      empty.textContent = 'No comments yet. Select a passage to start the discussion.';
      list.appendChild(empty);
      return;
    }
    comments.forEach(function (comment) {
      var card = document.createElement('article');
      card.className = 'annotation-card';
      card.dataset.commentCard = String(comment.id);
      card.tabIndex = 0;
      card.setAttribute('role', 'button');
      card.setAttribute('aria-label', 'Show comment on selected passage');
      var meta = document.createElement('div');
      meta.className = 'annotation-card-meta';
      var author = document.createElement('span');
      author.className = 'annotation-card-author';
      addText(author, comment.author_name || 'Anonymous');
      var date = document.createElement('time');
      date.dateTime = comment.created_at || '';
      addText(date, formattedDate(comment.created_at));
      meta.appendChild(author);
      meta.appendChild(date);
      var quote = document.createElement('blockquote');
      addText(quote, comment.selected_text);
      var body = document.createElement('p');
      body.className = 'annotation-card-body';
      addText(body, comment.body);
      card.appendChild(meta);
      card.appendChild(quote);
      card.appendChild(body);
      if (ownerTokens[String(comment.id)]) {
        var actions = document.createElement('div');
        actions.className = 'annotation-card-actions';
        var deleteButton = document.createElement('button');
        deleteButton.type = 'button';
        deleteButton.className = 'annotation-delete';
        deleteButton.textContent = 'Delete your comment';
        deleteButton.addEventListener('click', function (event) {
          event.stopPropagation();
          deleteOwnComment(comment.id, deleteButton);
        });
        actions.appendChild(deleteButton);
        card.appendChild(actions);
      }
      card.addEventListener('click', function () {
        var mark = article.querySelector('[data-comment-id="' + comment.id + '"]');
        if (mark) mark.scrollIntoView({ behavior: 'smooth', block: 'center' });
        focusComment(comment.id, mark || card);
      });
      card.addEventListener('keydown', function (event) {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          focusComment(comment.id, card);
        }
      });
      list.appendChild(card);
    });
  }

  function deleteOwnComment(id, button) {
    if (!ownerTokens[String(id)]) return;
    if (!window.confirm('Delete your comment?')) return;
    button.disabled = true;
    setStatus('Deleting comment…');
    fetch('/api/comments/' + encodeURIComponent(id), {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
      body: JSON.stringify({ client_id: user.id, owner_token: ownerTokens[String(id)] })
    })
      .then(function (response) {
        return response.json().catch(function () { return {}; }).then(function (data) {
          if (!response.ok) throw new Error(data.detail || 'Could not delete comment');
          return data;
        });
      })
      .then(function () {
        forgetOwnerToken(id);
        setStatus('Comment deleted.');
        loadComments();
      })
      .catch(function (error) {
        button.disabled = false;
        setStatus(error.message, true);
      });
  }

  function hasOverlap(start, end) {
    return renderedRanges.some(function (range) {
      return start < range.end && end > range.start;
    });
  }

  function highlightOffsets(start, end, id) {
    if (!(end > start) || hasOverlap(start, end)) return;
    var nodes = textNodes();
    var cursor = 0;
    var lastMark = null;
    nodes.forEach(function (node) {
      var nodeStart = cursor;
      var nodeEnd = cursor + node.nodeValue.length;
      cursor = nodeEnd;
      if (nodeEnd <= start || nodeStart >= end) return;
      if (node.parentElement && node.parentElement.closest('mark.annotation-highlight')) return;
      var localStart = Math.max(0, start - nodeStart);
      var localEnd = Math.min(node.nodeValue.length, end - nodeStart);
      var target = node;
      if (localEnd < node.nodeValue.length) node.splitText(localEnd);
      if (localStart > 0) target = node.splitText(localStart);
      var mark = document.createElement('mark');
      mark.className = 'annotation-highlight';
      mark.dataset.commentId = String(id);
      mark.tabIndex = 0;
      mark.title = 'Show comment';
      mark.addEventListener('click', function (event) {
        event.stopPropagation();
        focusComment(id, mark);
      });
      target.parentNode.insertBefore(mark, target);
      mark.appendChild(target);
      lastMark = mark;
    });
    if (lastMark) {
      var marker = document.createElement('button');
      marker.type = 'button';
      marker.className = 'annotation-marker';
      marker.dataset.commentId = String(id);
      marker.setAttribute('aria-label', 'Show comment on this passage');
      marker.setAttribute('aria-expanded', 'false');
      marker.title = 'Show comment';
      marker.addEventListener('click', function (event) {
        event.stopPropagation();
        focusComment(id, marker);
      });
      lastMark.parentNode.insertBefore(marker, lastMark.nextSibling);
    }
    renderedRanges.push({ start: start, end: end });
  }

  function clearHighlights() {
    article.querySelectorAll('.annotation-marker').forEach(function (marker) { marker.remove(); });
    article.querySelectorAll('mark.annotation-highlight').forEach(function (mark) {
      var parent = mark.parentNode;
      while (mark.firstChild) parent.insertBefore(mark.firstChild, mark);
      mark.remove();
    });
  }

  function applyHighlights() {
    renderedRanges = [];
    var length = article.textContent.length;
    comments.forEach(function (comment) {
      var anchor = comment.anchor || {};
      var start = Number(anchor.start);
      var end = Number(anchor.end);
      if (!Number.isFinite(start) || !Number.isFinite(end) || start < 0 || end > length || end <= start) return;
      var current = article.textContent.slice(start, end);
      if (current !== (anchor.selected_text || comment.selected_text)) return;
      highlightOffsets(start, end, comment.id);
    });
  }

  function loadComments() {
    setStatus('Loading comments…');
    fetch('/api/comments?path=' + encodeURIComponent(pagePath), { headers: { Accept: 'application/json' } })
      .then(function (response) {
        if (!response.ok) throw new Error('Could not load comments');
        return response.json();
      })
      .then(function (data) {
        comments = Array.isArray(data.comments) ? data.comments : [];
        renderList();
        clearHighlights();
        try {
          applyHighlights();
        } catch (error) {
          console.error('Could not apply comment markers', error);
        }
        setStatus('');
      })
      .catch(function (error) {
        console.error('Could not load comments', error);
        comments = [];
        renderList();
        setStatus('Comments are temporarily unavailable. You can still read the page.', true);
      });
  }

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    if (!pending) return;
    var submit = form.querySelector('button[type="submit"]');
    var body = form.elements.body.value.trim();
    if (!body) return;
    errorBox.textContent = '';
    submit.disabled = true;
    var payload = {
      page_path: pagePath,
      selected_text: pending.anchor.quote,
      anchor: {
        start: pending.anchor.start,
        end: pending.anchor.end,
        selected_text: pending.anchor.selectedText,
        prefix: pending.anchor.prefix,
        suffix: pending.anchor.suffix
      },
      client_id: user.id,
      author_name: form.elements.author_name.value.trim(),
      body: body,
      website: form.elements.website.value
    };
    fetch('/api/comments', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
      body: JSON.stringify(payload)
    })
      .then(function (response) {
        return response.json().catch(function () { return {}; }).then(function (data) {
          if (!response.ok) throw new Error(data.detail || 'Could not post comment');
          return data;
        });
      })
      .then(function (data) {
        user.name = form.elements.author_name.value.trim();
        saveUser(user);
        if (data.owner_token && data.comment) rememberOwnerToken(data.comment.id, data.owner_token);
        form.reset();
        closeComposer();
        setStatus('Comment posted.');
        loadComments();
      })
      .catch(function (error) {
        errorBox.textContent = error.message;
      })
      .finally(function () {
        submit.disabled = false;
      });
  });

  openButton.addEventListener('click', openComposer);
  document.querySelector('[data-annotation-popover-close]').addEventListener('click', hidePopover);
  document.querySelectorAll('[data-annotation-cancel]').forEach(function (button) {
    button.addEventListener('click', closeComposer);
  });
  document.addEventListener('mouseup', function () { window.setTimeout(captureSelection, 0); });
  document.addEventListener('touchend', function () { window.setTimeout(captureSelection, 0); }, { passive: true });
  document.addEventListener('mousedown', function (event) {
    if (!toolbar.contains(event.target) && !composer.contains(event.target)) hideToolbar();
    if (!popover.contains(event.target) && !event.target.closest('.annotation-highlight, .annotation-marker, .annotation-card')) hidePopover();
  });
  document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') hidePopover();
  });

  loadComments();
}());
