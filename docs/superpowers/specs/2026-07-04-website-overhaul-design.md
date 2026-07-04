# fluxcompute.dev — Complete Website Overhaul

**Date:** 2026-07-04
**Status:** Approved direction (visual prototype validated in brainstorm session)
**Supersedes:** the live `index.html` and the 2026-05-06 credibility redesign
**Source brief:** `/Users/ishan/FLUXCOMPUTESDK/docs/website-redesign-v1.md`

## Goal

Replace the current cost-routing-pitched site with a complete overhaul that positions FluxCompute as **the reliability layer for production AI agents** — execution graphs, failure classification, graph-aware resume — with cost optimization as the second beat, not the lead. The site must read as premium, hand-crafted, and technically authoritative: reliability you can see, not adjectives.

## Validated decisions (from brainstorm)

1. **Direction:** "Neural Constellation" (Obsidian-energy living graph) fused with "Dark Instrument" telemetry (engineering grid, mono readouts, live log).
2. **Palette:** **Terminal Green** on near-black. No violet anywhere. Failure red is the only other hue.
3. **Hero:** fully animated — drifting/breathing constellation, pulses traveling edges, a recurring fail→resume→heal cycle narrated by a live telemetry log.
4. **Structure:** 8-section single-page scroll story (approved as proposed).
5. **CTAs:** "Book a demo" (email-based for now) + `$ pip install fluxcompute` linking to https://pypi.org/project/fluxcompute/0.1.0/. No fake scheduling links; no fake customer logos.
6. **Proof:** no real screenshot exists, so the proof section is a **live HTML recreation** of the Task Graphs dashboard with honest "demo workload" captioning.

## Visual system

### Color tokens (replaces current cyan→violet system)

```
--bg-0:        #08090c        near-black, cool
--bg-1:        #0b0d12        panel
--bg-2:        #101218        raised panel / terminal chrome
--fg-0:        #f2f4f8        primary text
--fg-1:        #9aa3b2        secondary text
--fg-2:        #5c6472        tertiary / tags
--line-1:      rgba(255,255,255,.07)   hairline borders
--accent:      #2fe6a8        terminal green (primary)
--accent-hi:   #aef7dc        green highlight (gradient end, pulses)
--accent-dim:  rgba(47,230,168,.13)    glows, halos
--ok-text:     #d6f9ec        emphasized inline text
--fail:        #ff4d5e        failure red — the ONLY non-green hue
```

Gradient usage: `linear-gradient(120deg, var(--accent), var(--accent-hi))` for primary CTA and headline highlights. **No violet, ever.** Red reserved exclusively for failure moments so it keeps meaning.

### Typography

- **Display/UI:** Inter Tight (fallback Inter, system-ui). Weight 650 display, tight tracking (−.02 to −.03em).
- **Mono:** ui-monospace / JetBrains Mono for: telemetry, code, node tags, stats, eyebrows, kbd hints.
- Eyebrows: 10–11px mono, letterspaced +.16em, accent-colored, preceded by a 22px rule.

### Texture & depth (the "hand-crafted" layer)

- SVG-noise grain overlay (~4% alpha) on hero and closing sections.
- Fine 56px engineering grid, masked radially so it fades at edges.
- Node halos via radial gradients + gaussian-blur glow filter; three breathing rhythms (5s/6.4s/7.2s, staggered delays) so nothing pulses in lockstep.
- Two-layer parallax: dim background constellation drifts on a different period than the main graph.
- Hairline borders, large soft shadows, backdrop-blur on floating panels.

### Motion rules

- Continuous ambient motion (drift, breathe, edge pulses) must be slow: 26–34s drift cycles, 3.6–5.6s pulse travel.
- The failure cycle is the signature: every ~15s a node flashes red (dashed red edge), a green recovery path draws itself around it (1.6s ease), node heals to highlight green; telemetry log narrates each beat.
- Scroll-triggered reveals (IntersectionObserver, translate+fade, once).
- `prefers-reduced-motion`: all ambient/scroll animation off; failure cycle rendered as its final healed state.

## Page sections (approved)

1. **Hero — the living graph.** As prototyped: nav (Product / How it works / Docs / Team + Book a demo), eyebrow `EXECUTION GRAPHS FOR AI AGENTS`, headline "Agents fail. / Yours won't / **stay failed.**", lede (records every step → resumes from the break → cheapest capable model), CTAs (demo + pip install), stat strip (−64% inference spend · 0 lost tasks · 1 line to integrate), animated constellation right with node tags (plan/retrieve/tool-call/synthesize/verify/deliver/write-report), floating live telemetry log.
2. **Problem — "long-running agents die in the dark."** A 40-step task fails at step 37; today you replay all 40. Three failure-mode cards in terminal styling: context overflow · tool error · model stall. Copy is short and brutal; numbers in mono.
3. **How it works — the execution graph, 4 pillars.** (1) Automatic execution graph — context propagation, zero manual instrumentation, works with LangGraph/CrewAI/your own loop; (2) Failure classification — overflow/tool/budget/stall/refusal, surfaced not buried; (3) Graph-aware resume — minimal context from succeeded steps only, never full-transcript replay; (4) Cost-aware routing — same intelligence on happy path and retry. KV-cache persistence and on-prem compression appear as supporting detail lines under pillar 4, not top-level. Each pillar gets a small inline SVG diagram in-system.
4. **Product proof — dashboard recreation.** HTML/CSS recreation of the Task Graphs dashboard tab: status-colored DAG, failure-reasons table, per-task cost rollup. Light interactivity (hover, cycling rows). Caption: "Demo workload — reproduce it yourself: `pip install fluxcompute`." No invented aggregate stats (no "N=2.1M queries").
5. **Code — the resume snippet.** The `client.task()` / `client.step()` / `client.resume()` example in a terminal frame with type-in animation. Framing line: LangGraph can't do cost-aware resume; Temporal can't do model-aware resume; Flux is both.
6. **Cost — reliability that pays for itself.** Routing-savings story (60–70%), animated cost meter, one-line methodology note (demo workload, reproducible). Honest numbers only.
7. **Team + design partners.** Founder cards led by what's shipped; academic/industry background as a clearly-labeled secondary line ("Our team's background: Cornell Tech · MIT CSAIL · Google · Veolia" — explicitly labeled, not styled as a customer bar). Then the design-partner ask: onboarding early partners running production agents.
8. **Final CTA + footer.** Constellation reprise (sparser), single demo CTA, footer links: PyPI, docs (docs.fluxcompute.dev), contact email. GitHub link added only once the repo is public — no dead links. No pricing section.

## Technical approach

- **Stack:** static, zero-dependency — one `index.html` + rewritten `tokens.css`, vanilla JS only (telemetry log, failure cycle, scroll reveals, type-in). No frameworks, no build step, no external requests except Google Fonts for Inter Tight + JetBrains Mono (self-host later if desired).
- **Files changed:** `index.html` (full rewrite), `tokens.css` (full rewrite to green system), `logo.svg` (recolor to green gradient). `Design System.html` is out of scope this pass (stale after token change — follow-up task).
- **Graph implementation:** inline SVG; curved quadratic edges; `animateMotion` pulses; CSS keyframes for drift/breathe; JS class-toggling (`phase-fail/-recover/-healed`) driving the failure cycle — exactly the prototype's architecture, refined.
- **Mobile-first, and fix the overflow class of bugs for good:** no `white-space: nowrap` on any flowing text; every mono/metadata row gets `min-width: 0` + wrap or owned `overflow-x: auto`; grids collapse ≤880px; hero graph moves below copy on mobile at reduced density; verify at 390px before done.
- **Accessibility/perf:** semantic landmarks, visible focus states, WCAG AA contrast (green-on-black passes easily), `prefers-reduced-motion` honored, single-page weight target < 300KB excluding fonts.

## Out of scope

- Real dashboard screenshots (none exist yet — recreation instead)
- Scheduling-tool integration (Calendly) — email CTA until one exists
- Pricing page, blog, changelog page, docs site
- `Design System.html` regeneration (follow-up)

## Success criteria

- Reads as reliability-first within 5 seconds of landing; cost is beat two.
- Zero horizontal overflow at 390px, 768px, 1440px.
- The failure→resume animation communicates the product without reading a word.
- No violet. No fake logos, fake stats, or fake CTAs.
