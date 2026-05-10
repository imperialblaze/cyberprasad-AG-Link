/* ═══════════════════════════════════════════════
   PRASAD SAWANT — PORTFOLIO
   Shared JavaScript
   ═══════════════════════════════════════════════ */

document.addEventListener('DOMContentLoaded', () => {

  /* ─── CUSTOM CURSOR ─── */
  const cur  = document.getElementById('cur');
  const curR = document.getElementById('cur-r');

  if (cur && curR) {
    let mx = 0, my = 0, rx = 0, ry = 0;

    document.addEventListener('mousemove', e => {
      mx = e.clientX; my = e.clientY;
      cur.style.transform = `translate(${mx - 4}px, ${my - 4}px)`;
    });

    (function animRing() {
      rx += (mx - rx - 15) * 0.13;
      ry += (my - ry - 15) * 0.13;
      curR.style.transform = `translate(${rx}px, ${ry}px)`;
      requestAnimationFrame(animRing);
    })();

    const hoverEls = document.querySelectorAll('a, button, .work-item, .blog-card, .training-type, .blog-mini, .blog-feature');
    hoverEls.forEach(el => {
      el.addEventListener('mouseenter', () => curR.classList.add('expand'));
      el.addEventListener('mouseleave', () => curR.classList.remove('expand'));
    });
  }

  /* ─── NAV SCROLL STATE ─── */
  const navEl = document.querySelector('nav');
  if (navEl) {
    window.addEventListener('scroll', () => {
      navEl.classList.toggle('scrolled', window.scrollY > 40);
    }, { passive: true });
  }

  /* ─── ACTIVE NAV LINKS ─── */
  const sections  = document.querySelectorAll('section[id], div#threat');
  const navLinks  = document.querySelectorAll('.nav-links a');

  function setActiveLink() {
    if (sections.length === 0) return; // Only process on pages with sections
    let current = '';
    sections.forEach(sec => {
      if (window.scrollY >= sec.offsetTop - 100) current = sec.id;
    });
    navLinks.forEach(a => {
      let href = a.getAttribute('href');
      if (current === 'threat' && href.includes('phishing-simulations.html')) {
        a.classList.add('active');
      } else if (current && href.includes('#' + current)) {
        a.classList.add('active');
      } else if (href.includes('#') || href.includes('phishing-simulations.html')) {
        a.classList.remove('active');
      }
    });
  }
  window.addEventListener('scroll', setActiveLink, { passive: true });
  setActiveLink();

  /* ─── SCROLL REVEAL ─── */
  const revealEls = document.querySelectorAll('.reveal');
  const revealObs = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        revealObs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.08, rootMargin: '0px 0px -40px 0px' });

  revealEls.forEach(el => revealObs.observe(el));

  /* ─── COUNTER ANIMATION ─── */
  function animateCount(el, target, suffix = '') {
    let n = 0;
    const step = target / 55;
    const timer = setInterval(() => {
      n = Math.min(n + step, target);
      el.textContent = Math.floor(n).toLocaleString() + suffix;
      if (n >= target) clearInterval(timer);
    }, 18);
  }

  const statsBlock = document.querySelector('.hero-stats');
  if (statsBlock) {
    const statsObs = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const nums = entry.target.querySelectorAll('[data-count]');
          nums.forEach(el => {
            const target = parseInt(el.dataset.count);
            const suffix = el.dataset.suffix || '';
            animateCount(el, target, suffix);
          });
          statsObs.unobserve(entry.target);
        }
      });
    }, { threshold: 0.5 });
    statsObs.observe(statsBlock);
  }

  /* ─── BLOG FILTER (blog.html only) ─── */
  const filterBtns = document.querySelectorAll('.filter-btn');
  const blogCards  = document.querySelectorAll('.article-card');

  if (filterBtns.length && blogCards.length) {
    filterBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        const cat = btn.dataset.filter;

        blogCards.forEach(card => {
          const show = cat === 'all' || card.dataset.category === cat;
          card.style.opacity    = show ? '1' : '0.25';
          card.style.transform  = show ? 'scale(1)' : 'scale(0.97)';
          card.style.pointerEvents = show ? 'auto' : 'none';
        });
      });
    });
  }

  /* ─── SMOOTH PAGE TRANSITIONS ─── */
  document.querySelectorAll('a[href$=".html"], a[href="./"]').forEach(link => {
    link.addEventListener('click', e => {
      const href = link.getAttribute('href');
      if (href && !href.startsWith('#') && !href.startsWith('mailto') && !href.startsWith('http')) {
        e.preventDefault();
        document.body.style.opacity = '0';
        document.body.style.transition = 'opacity 0.3s ease';
        setTimeout(() => { window.location.href = href; }, 300);
      }
    });
  });

  // Fade in on load
  document.body.style.opacity = '0';
  requestAnimationFrame(() => {
    document.body.style.transition = 'opacity 0.4s ease';
    document.body.style.opacity = '1';
  });

});
