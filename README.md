# halditech-landing

The **HaldiTech landing surface** — part of the content-authoring redesign (backlog **#546**).

- **Lane:** 1 (visual). The OFS marketing team builds/edits pages **visually in Lovable**; what they see ships.
- **Domain (planned):** `pages.halditech.com` (subdomain — no rewrite; landing/campaign/ad pages + the
  reclaimed `solutions` / `ivmrs` / `giftcard`).
- **Stack:** React + Vite + TypeScript + Tailwind (Lovable's native output).
- **Deploy:** Vercel, under the `haldi-properties` team.

## The one rule: don't touch the wiring
`index.html` carries a **GTM wiring block** (`GTM-PTNGVBS`) fenced by `⛔ WIRING BLOCK` markers, protected by
[`AGENTS.md`](./AGENTS.md). GA4 / Meta Pixel fire as tags *inside* GTM, managed centrally — never add them to
the page directly. See `AGENTS.md` for the full rule.

## Branch model (canon `git-branch-standard.md`)
| Branch | Role | Who |
|---|---|---|
| `integration` | routine work — push freely | team |
| `staging` | preview → (staging deploy) | team may merge |
| `qa` | QA → (qa deploy) | team may merge |
| `main` | **production** | **John + Claude only** |

The team never learns git — their Lovable→repo sync + merges are handled for them. Production merges are
gated by John + Claude, who also verify the GTM container is present before promoting (no container, no promote).

## Local dev
```bash
npm install
npm run dev
```

## Provenance
Scaffolded 2026-08-28 from the #546 build plan (`halditech/corp/web/content-authoring-redesign-546.md`).
This is the pilot surface that proves the Lovable → repo → Vercel → domain → GTM seam before the other
surfaces (`halditech-web`, `halditech-support`) are stood up.
