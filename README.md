# FluxCompute

Serverless GPU inference for any model.

## What it is

FluxCompute is a developer platform for running ML models as autoscaling HTTP endpoints. Push a model (open-weights, fine-tune, or custom container), get a `https://flux.run/m/<id>` URL with sub-second cold starts, p50 latency dashboards, and per-token pricing. Built for teams that don't want to manage GPU clusters, but also don't want to be locked into a single foundation-model vendor.

**Audience:** ML engineers, applied AI teams, infra-conscious startups.

**Adjacent to:** Modal, Replicate, Baseten, RunPod, Together. Differentiator is cold-start performance + bring-your-own-container ergonomics.

## Brand voice

- **Technical, not corporate.** Assume the reader knows what a CUDA kernel is. Don't explain "What is GPU?"
- **Specific, not aspirational.** "p50 cold start: 340ms" beats "blazingly fast." Numbers > adjectives.
- **Calm confidence.** No hype, no exclamation points. The product speaks.
- **Direct.** "Deploy" not "unleash." "Endpoint" not "magical AI experience."

Reference tone: Linear changelogs, Vercel docs, Modal blog posts.

## Visual direction

Developer-tool aesthetic in the lineage of Linear / Vercel / Modal — dark-first, technical density, restrained color, mono accents. The brand mark is a stylized flux line — a single curved gradient stroke suggesting motion, energy, and the path data takes through a network. Avoid: glassmorphism, generic AI-blue gradients, hexagon-mesh patterns, robot iconography.

### Color
Two surfaces, one accent.
- **Surface:** near-black ink with cool undertone (not pure `#000`); paired with a near-white that's slightly warm.
- **Accent:** terminal green (`--accent: #2fe6a8`), with `--accent-grad` running to a pale mint. Used sparingly — for the logo, the primary CTA, key data viz, and active states. If everything is accent, nothing is.
- **Status colors:** muted, technical — never saturated traffic-light hues.

### Type
- **Display + UI:** a geometric grotesk (Inter Tight or similar) — tight tracking on display sizes.
- **Mono:** for code, latency numbers, IDs, anything quantitative. JetBrains Mono.
- **No serif.** This is infrastructure, not a magazine.

### Layout
- 8px grid, dense but not cramped.
- Hairline 1px dividers (`--line-1`, `rgba(255,255,255,.07)` on dark) over heavy borders.
- Subtle dotted/grid background on hero surfaces — never as decoration alone, always implying coordinate space.

## Files

- `index.html` — the landing page served at `fluxcompute.dev`
- `docs/` — the docs site served at `docs.fluxcompute.dev` (see below)
- `tokens.css` — color, type, spacing, radius, shadow tokens (CSS custom properties)
- `logo.svg` — primary mark
- `Design System.html` — token preview / spec sheet
- `SKILL.md` — instructions for AI assistants designing in this system
- `scripts/sync-tokens.sh` — regenerates `docs/tokens.css` from the root copy
- `internal/` — planning docs. Not published; see `.vercelignore`

## Deployment

This repo backs **two Vercel projects**, both deploying from `main`:

| Domain | Vercel Root Directory | Serves |
| ------ | --------------------- | ------ |
| `fluxcompute.dev` | repo root | `index.html` |
| `docs.fluxcompute.dev` | `docs/` | `docs/index.html` and siblings |

The docs site is a second project rather than a path rewrite on the first one
because Vercel gives the filesystem precedence over rewrites — a
`docs.fluxcompute.dev/*` → `/docs/*` rewrite would still serve the root
`index.html` at the docs root, since that file exists.

Because the docs project can only serve files inside `docs/`, that folder keeps
its own copy of `tokens.css` and the favicons. **After editing the root
`tokens.css`, regenerate the copy:**

```bash
scripts/sync-tokens.sh            # regenerate docs/tokens.css
scripts/sync-tokens.sh --check    # exit 1 if it has drifted (CI-friendly)
```

Don't `cp` by hand — that deletes the generated-file banner, leaving no marker
that `docs/tokens.css` is a copy.

### .vercelignore

There are two, and both matter:

- **`.vercelignore`** (repo root) keeps `internal/`, `SKILL.md`, `Design
  System.html`, `README.md` and `scripts/` out of the apex deployment — the
  first three were publicly reachable before it existed. It also excludes
  `docs/`, so the apex project doesn't publish a second, broken copy of the
  docs site at `fluxcompute.dev/docs/*`.
- **`docs/.vercelignore`** ignores nothing, and is load-bearing precisely
  because of that: Vercel falls back to the root `.vercelignore` when a Root
  Directory has none of its own, so without this file the `docs/` line above
  would make the docs project exclude itself and deploy empty.

## Docs content

`docs/` documents the public, Apache-2.0 [FluxCompute
SDK](https://github.com/fluxcompute/fluxcompute-sdk) only — its README and
`docs/telemetry-contract.md` are the source of truth. Nothing about the hosted
platform's internals belongs here. When the SDK's routing table, env vars, or
client options change, these pages need the same edit.
