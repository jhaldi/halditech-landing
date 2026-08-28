# AGENTS.md — rules for AI agents working in this repo (Lovable, Claude, etc.)

This repo is the **HaldiTech landing surface** (backlog #546, Lane 1 — the visual/Lovable lane).
The OFS marketing team builds and edits the real pages here **visually in Lovable**. That freedom is
the whole point — with **one** exception below.

## ⛔ DO NOT MODIFY — the tracking / wiring block

`index.html` contains a **wiring block** in both the `<head>` and the `<body>`, fenced by these markers:

```
<!-- ⛔ WIRING BLOCK — DO NOT EDIT OR REMOVE (see AGENTS.md). Owned by John + Claude. -->
...
<!-- ⛔ END WIRING BLOCK -->
```

**Never edit, move, reorder, or remove anything between those markers.** It is the Google Tag Manager
container (`GTM-PTNGVBS`) that carries every downstream measurement tag (GA4, Meta Pixel, etc.). A page
that loses this block has **broken measurement** — invisible to analytics and ad platforms — which is a
silent, expensive failure, not a style choice.

Specifically:
- **Do not** remove or rename the GTM `<script>` in `<head>` or the `<noscript>` iframe in `<body>`.
- **Do not** re-initialize `window.dataLayer` after GTM loads (it breaks tag firing).
- **Do not** add a competing GA4 (`gtag`) tag directly in the page — GA4 fires *inside* GTM. Duplicating it
  double-counts every pageview.
- If you regenerate `index.html` wholesale, **re-insert the wiring block exactly as-is** from the markers above.

Everything else in `index.html` (title, favicon, meta) and all of `/src` is yours to build freely.

## Ownership split
- **Team (via Lovable):** design + content of every page. Build visually; what you see ships.
- **John + Claude:** the wiring block above, the branch/deploy config, and the production gate. A promotion
  to production (`main`) is verified by Claude to still contain `GTM-PTNGVBS` — no container, no promote.

## Branch model (per canon `git-branch-standard.md`)
- `integration` — routine work, push freely.
- `staging` / `qa` — self-serve preview / QA (team may merge).
- `main` — **production; restricted to John + Claude.** Do not push or merge to `main`.
