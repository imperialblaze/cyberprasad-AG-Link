# Prasad Sawant — Portfolio Website

A professional portfolio website for Prasad Sawant, Cybersecurity Awareness Specialist.

## Project Structure

```
prasad-sawant-portfolio/
├── index.html          ← Homepage (Home, Work, Training, About, Contact)
├── blog.html           ← Full blog page (dark editorial theme)
├── css/
│   └── style.css       ← Shared styles (tokens, nav, footer, utilities)
├── js/
│   └── main.js         ← Shared JS (cursor, scroll reveal, counters, filters)
├── assets/
│   └── images/         ← Place your photos here
└── README.md
```

## Quick Start

1. **No build step required.** Open `index.html` in any modern browser.
2. For local development with live reload, use VS Code + Live Server extension.
3. To deploy: upload all files to any static host (Netlify, Vercel, GitHub Pages, etc.)

## Personalisation Checklist

### Photos
- Replace photo placeholders in `index.html`:
  - Hero section: uncomment `<img src="assets/images/prasad.jpg" ...>`
  - About section: uncomment `<img src="assets/images/prasad-about.jpg" ...>`
- Use a 3:4 ratio portrait for hero, 4:5 for about section.

### Contact Details
- In `index.html`, update `prasad.sawant@email.com` (appears in the contact section & footer)
- Add your real LinkedIn URL (search for `href="#">LinkedIn`)
- Add your Twitter/X URL (search for `href="#">Twitter / X`)

### CV Download
- Add your CV as `assets/prasad-sawant-cv.pdf`
- In `index.html`, update: `<a class="btn btn-ghost-light" href="assets/prasad-sawant-cv.pdf">`

### Blog Articles
- Replace `href="#"` on each article card in `blog.html` with your real article URLs
- Update article titles, dates, excerpts, and read times
- Add new cards to the grid following the existing markup pattern

### Stats & Experience
- Update years of experience in `index.html` (search for `7+`)
- The 25K+ and 50+ counters animate automatically — update `data-count` values if needed

### Certifications
- Update the `.cred-tag` items in the About section with your actual certifications

## Fonts Used
- **Bebas Neue** — display / headings (Google Fonts)
- **Cormorant Garamond** — editorial italic accents (Google Fonts)
- **JetBrains Mono** — body / UI text (Google Fonts)

Fonts load from Google Fonts CDN. For fully offline use, download and self-host them.

## Browser Support
Chrome, Firefox, Safari, Edge — all modern evergreen browsers.
Custom cursor hides on touch/mobile automatically (via `cursor: none` only on pointer devices).

## Deployment (Netlify — recommended)
1. Drag the `prasad-sawant-portfolio` folder to [netlify.com/drop](https://app.netlify.com/drop)
2. Done. Your site is live instantly with HTTPS.

## Design System

| Token            | Value      | Usage                       |
|------------------|------------|-----------------------------|
| `--ink`          | `#0a0c0f`  | Primary text & backgrounds  |
| `--paper`        | `#f4f0e8`  | Page background, light text |
| `--warm`         | `#f0ece0`  | Section backgrounds         |
| `--accent`       | `#c8401a`  | Red-orange brand accent     |
| `--gold`         | `#b8973a`  | Skill bar gradient end      |
| `--muted`        | `#7a7060`  | Secondary text              |

---

Built for Prasad Sawant · 2025
