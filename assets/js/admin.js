(function () {
  'use strict';

  var loginPanel = document.querySelector('[data-admin-login]');
  var dashboard = document.querySelector('[data-admin-dashboard]');
  var loginForm = document.querySelector('[data-admin-login-form]');
  var loginError = document.querySelector('[data-admin-login-error]');
  var logoutButton = document.querySelector('[data-admin-logout]');
  var list = document.querySelector('[data-admin-list]');
  var count = document.querySelector('[data-admin-count]');
  var status = document.querySelector('[data-admin-status]');
  var comments = [];

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

  function showLogin() {
    loginPanel.hidden = false;
    dashboard.hidden = true;
  }

  function showDashboard() {
    loginPanel.hidden = true;
    dashboard.hidden = false;
    loadComments();
  }

  function addText(parent, value) {
    parent.appendChild(document.createTextNode(value || ''));
  }

  function renderComments() {
    list.textContent = '';
    count.textContent = comments.length + (comments.length === 1 ? ' comment' : ' comments');
    if (!comments.length) {
      var empty = document.createElement('p');
      empty.className = 'admin-muted';
      empty.textContent = 'No comments have been posted.';
      list.appendChild(empty);
      return;
    }
    comments.forEach(function (comment) {
      var item = document.createElement('article');
      item.className = 'admin-comment';
      item.dataset.commentId = String(comment.id);

      var header = document.createElement('div');
      header.className = 'admin-comment-header';
      var author = document.createElement('strong');
      author.className = 'admin-comment-author';
      addText(author, comment.author_name || 'Anonymous');
      var date = document.createElement('time');
      date.className = 'admin-comment-date';
      date.dateTime = comment.created_at || '';
      addText(date, formattedDate(comment.created_at));
      header.appendChild(author);
      header.appendChild(date);

      var page = document.createElement('div');
      page.className = 'admin-comment-page';
      addText(page, comment.page_path || '/');

      var quote = document.createElement('blockquote');
      addText(quote, comment.selected_text);
      var body = document.createElement('p');
      body.className = 'admin-comment-body';
      addText(body, comment.body);

      var footer = document.createElement('div');
      footer.className = 'admin-comment-footer';
      var id = document.createElement('span');
      id.className = 'admin-comment-id';
      addText(id, 'Comment #' + comment.id);
      var deleteButton = document.createElement('button');
      deleteButton.type = 'button';
      deleteButton.className = 'admin-delete';
      deleteButton.textContent = 'Delete comment';
      deleteButton.addEventListener('click', function () {
        deleteComment(comment.id, deleteButton);
      });
      footer.appendChild(id);
      footer.appendChild(deleteButton);

      item.appendChild(header);
      item.appendChild(page);
      item.appendChild(quote);
      item.appendChild(body);
      item.appendChild(footer);
      list.appendChild(item);
    });
  }

  function loadComments() {
    setStatus('Loading comments…');
    fetch('/api/admin/comments', { headers: { Accept: 'application/json' } })
      .then(function (response) {
        if (response.status === 401) {
          showLogin();
          throw new Error('Administrator login required');
        }
        if (!response.ok) throw new Error('Could not load comments');
        return response.json();
      })
      .then(function (data) {
        comments = Array.isArray(data.comments) ? data.comments : [];
        renderComments();
        setStatus('');
      })
      .catch(function (error) {
        if (error.message !== 'Administrator login required') setStatus(error.message, true);
      });
  }

  function deleteComment(id, button) {
    if (!window.confirm('Permanently delete comment #' + id + '?')) return;
    button.disabled = true;
    setStatus('Deleting comment…');
    fetch('/api/admin/comments/' + encodeURIComponent(id) + '/delete', {
      method: 'POST',
      headers: { Accept: 'application/json', 'Content-Type': 'application/json' },
      body: '{}'
    })
      .then(function (response) {
        return response.json().catch(function () { return {}; }).then(function (data) {
          if (!response.ok) throw new Error(data.detail || 'Could not delete comment');
          return data;
        });
      })
      .then(function () {
        setStatus('Comment deleted.');
        loadComments();
      })
      .catch(function (error) {
        button.disabled = false;
        setStatus(error.message, true);
      });
  }

  loginForm.addEventListener('submit', function (event) {
    event.preventDefault();
    loginError.textContent = '';
    var submit = loginForm.querySelector('button[type="submit"]');
    submit.disabled = true;
    fetch('/api/admin/session', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
      body: JSON.stringify({ password: loginForm.elements.password.value })
    })
      .then(function (response) {
        return response.json().catch(function () { return {}; }).then(function (data) {
          if (!response.ok) throw new Error(data.detail || 'Could not sign in');
          return data;
        });
      })
      .then(function () {
        loginForm.reset();
        showDashboard();
      })
      .catch(function (error) {
        loginError.textContent = error.message;
      })
      .finally(function () {
        submit.disabled = false;
      });
  });

  logoutButton.addEventListener('click', function () {
    fetch('/api/admin/session', { method: 'DELETE', headers: { Accept: 'application/json' } })
      .finally(showLogin);
  });

  fetch('/api/admin/session', { headers: { Accept: 'application/json' } })
    .then(function (response) { return response.json(); })
    .then(function (data) {
      if (data.authenticated) showDashboard();
      else showLogin();
    })
    .catch(showLogin);
}());
