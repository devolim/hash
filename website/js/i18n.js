/**
 * Hash — Language Picker
 * Auto-detects current language from URL path and builds a dropdown
 * that redirects to the same page in the selected language.
 */
(function() {
  'use strict';

  var LANGS = [
    { code: 'fr', name: 'Français', flag: '🇫🇷' },
    { code: 'en', name: 'English', flag: '🇬🇧' },
    { code: 'es', name: 'Español', flag: '🇪🇸' },
    { code: 'de', name: 'Deutsch', flag: '🇩🇪' },
    { code: 'pt', name: 'Português', flag: '🇵🇹' },
    { code: 'it', name: 'Italiano', flag: '🇮🇹' },
    { code: 'ar', name: 'العربية', flag: '🇸🇦' },
    { code: 'zh', name: '中文', flag: '🇨🇳' },
    { code: 'ja', name: '日本語', flag: '🇯🇵' },
    { code: 'ru', name: 'Русский', flag: '🇷🇺' },
    { code: 'ko', name: '한국어', flag: '🇰🇷' },
    { code: 'tr', name: 'Türkçe', flag: '🇹🇷' }
  ];

  var LANG_CODES = LANGS.map(function(l) { return l.code; });

  // Detect current language and page from URL
  function detectContext() {
    var path = window.location.pathname;
    var parts = path.split('/').filter(Boolean);
    var lang = 'fr';
    var page = 'index.html';

    // Check if a language code is in the path
    for (var i = 0; i < parts.length; i++) {
      if (LANG_CODES.indexOf(parts[i]) !== -1 && parts[i] !== 'fr') {
        lang = parts[i];
        page = parts[i + 1] || 'index.html';
        break;
      }
    }

    if (lang === 'fr') {
      page = parts[parts.length - 1] || 'index.html';
    }

    if (page === '' || page.indexOf('.') === -1) page = 'index.html';

    return { lang: lang, page: page };
  }

  // Build URL for a given language
  function buildUrl(targetLang, currentPage, currentLang) {
    // Determine the base path (path to website root)
    var base = '';
    if (currentLang !== 'fr') {
      base = '../';
    }

    if (targetLang === 'fr') {
      return base + currentPage;
    } else {
      return base + targetLang + '/' + currentPage;
    }
  }

  function buildPickers() {
    var ctx = detectContext();

    document.querySelectorAll('.lang-picker').forEach(function(container) {
      container.innerHTML = '';

      var currentInfo = LANGS.find(function(l) { return l.code === ctx.lang; }) || LANGS[0];

      var btn = document.createElement('button');
      btn.className = 'lang-picker__btn';
      btn.setAttribute('aria-label', 'Language');
      btn.innerHTML = '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg><span class="lang-picker__current">' + ctx.lang.toUpperCase() + '</span>';

      var dropdown = document.createElement('div');
      dropdown.className = 'lang-picker__dropdown';

      LANGS.forEach(function(lang) {
        var a = document.createElement('a');
        a.href = buildUrl(lang.code, ctx.page, ctx.lang);
        a.className = 'lang-picker__item' + (lang.code === ctx.lang ? ' active' : '');
        a.innerHTML = '<span class="lang-picker__flag">' + lang.flag + '</span> ' + lang.name;
        dropdown.appendChild(a);
      });

      btn.onclick = function(e) {
        e.stopPropagation();
        var isOpen = dropdown.classList.contains('open');
        document.querySelectorAll('.lang-picker__dropdown').forEach(function(d) { d.classList.remove('open'); });
        if (!isOpen) dropdown.classList.add('open');
      };

      container.appendChild(btn);
      container.appendChild(dropdown);
    });
  }

  document.addEventListener('click', function() {
    document.querySelectorAll('.lang-picker__dropdown').forEach(function(d) { d.classList.remove('open'); });
  });

  // Auto-detect browser language and redirect on first visit
  function autoDetect() {
    var ctx = detectContext();
    // Only redirect if user is on the French (default) version
    if (ctx.lang !== 'fr') return;
    // Don't redirect if user already chose a language
    if (sessionStorage.getItem('hash_lang_chosen')) return;

    var browserLang = (navigator.language || navigator.userLanguage || 'fr').toLowerCase().split('-')[0];
    if (browserLang === 'fr') return;
    if (LANG_CODES.indexOf(browserLang) === -1) return;

    sessionStorage.setItem('hash_lang_chosen', '1');
    window.location.href = buildUrl(browserLang, ctx.page, ctx.lang);
  }

  function init() {
    autoDetect();
    buildPickers();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
