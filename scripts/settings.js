document.addEventListener('DOMContentLoaded', function () {
  document.addEventListener('click', function (ev) {
    if (ev.target == document.getElementById('save')) {
      const format = document.getElementById('format').value;
      const linkify = document.getElementById('linkify').checked;
      storageSet({ format: format, linkify: linkify }).then(function () {
        alert('Format saved successfully.');
      });
    }
  });

  storageGet(['format', 'linkify']).then(function (data) {
    if (data.format) {
      document.getElementById('format').value = data.format;
    }
    if (data.linkify) {
      document.getElementById('linkify').checked = data.linkify;
    }
  });
});