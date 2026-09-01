(function () {
  'use strict';

  document.querySelectorAll('[data-annotation-guide]').forEach(function (guide) {
    var closeButton = guide.querySelector('[data-annotation-guide-close]');
    if (!closeButton) return;

    closeButton.addEventListener('click', function () {
      // Do not persist this choice: the guide should return on the next page entry.
      guide.hidden = true;
    });
  });
}());
