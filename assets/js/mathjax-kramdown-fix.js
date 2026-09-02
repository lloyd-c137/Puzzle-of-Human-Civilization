(function () {
  'use strict';

  var root = document.querySelector('[data-annotation-root]');
  var article = root && root.querySelector('article');
  if (!article) return;

  // Kramdown treats escaped \(, \), \[, and \] as Markdown escapes when they
  // are written directly in a paragraph. Restore those delimiters in the
  // rendered text without changing the learner's original Markdown record.
  var latexSignal = /\\(?:frac|text|times|circ|boxed|quad|sqrt|mathrm|approx|Rightarrow|rightarrow|displaystyle)/;
  var walker = document.createTreeWalker(article, NodeFilter.SHOW_TEXT);
  var node;
  while ((node = walker.nextNode())) {
    if (!node.nodeValue || (node.parentElement && node.parentElement.closest('.math-display'))) {
      continue;
    }

    var value = node.nodeValue;
    if (!latexSignal.test(value)) continue;

    // Keep newlines inside display formulas. Kramdown preserves them when a
    // multi-line formula is emitted as ordinary paragraph text.
    value = value.replace(/(?<!\\)\[\s*([^\]]*\\(?:frac|text|times|circ|boxed|quad|sqrt|mathrm|approx|Rightarrow|rightarrow|displaystyle)[^\]]*)\s*\]/g, '\\[$1\\]');
    value = value.replace(/(?<!\\)\(([^()\n]*\\(?:frac|text|times|circ|boxed|quad|sqrt|mathrm|approx|Rightarrow|rightarrow|displaystyle)[^()\n]*)\)/g, '\\($1\\)');
    node.nodeValue = value;
  }
}());
