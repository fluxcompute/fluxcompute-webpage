# FluxCompute Website Credibility Redesign
**Date:** 2026-05-06
**Status:** Approved

## Context
Pre-launch, no product, no users. Goal: make the site credible for YC and Speedrun applications by replacing fake/aspirational signals with real ones (team credentials, research institutions), removing broken UI elements (Sign In), and replacing product-launch CTAs with honest pre-launch ones (Book a demo / email).

---

## Changes

### 1. Nav
- Remove "Sign in" link
- Replace "Start free →" button with **"Book a demo →"** (`mailto:ip259@cornell.edu` — swap for Calendly URL when available)
- Rename center nav link "Research" → "Team" (anchor: `#team`)
- Add plain email link `ip259@cornell.edu` next to demo button

### 2. Hero eyebrow
- Change `→ read the Cornell Tech paper` (was a link) to a static non-linking label: **`Research · NE Agents Day 2026 · Cornell Tech`**

### 3. Hero CTAs
- Primary button: "See it on your traffic →" → **"Book a demo →"** (`mailto:ip259@cornell.edu`)
- Ghost button: "Read the paper" → **"Meet the team →"** (smooth-scrolls to `#team`)
- Remove the `⌘K` keyboard shortcut hint (implies a product search UI that doesn't exist)

### 4. Logo strip
- Remove "Routing production agents at" label and all six fake company names (Mercator, Helix.ai, Bracket, Rune, Northwind, Yoke Labs)
- Replace with institution strip: label **"Research & engineering from"** + marks: `Cornell Tech · MIT CSAIL · Google · Veolia`

### 5. New Team section (inserted between Pricing and final CTA)
- Section number: `04 · Team`
- Heading: `Built by researchers who've worked on the problem.`
- Two cards side by side, each with: initials avatar (gradient-styled), name, title, bio

**Ishan Patwardhan** — Co-founder
> Researcher at Cornell Tech in Agentic Systems, ML hardware, and hardware-software co-design. Inference research at MIT CSAIL: hierarchical MoE, DAG-based token routing. SWE at Google: SVD-based context engineering and evaluation frameworks for Gemini. Prior: HPC systems, math libraries, and container platforms at Hewlett Packard Enterprise.

**Niki Karanikola** — Co-founder
> Two years shipping production LLM inference, dense retrieval, and RAG pipelines at Veolia — re-architected enterprise knowledge access from weeks to minutes, 6× faster reporting cadence, +20% NDCG. Researcher at Cornell Tech's Social Technologies Lab.

Avatar style: 48px circle, flux gradient background, white initial letter, matching existing design tokens.

### 6. Pricing CTAs
- "Start pilot" (Pilot tier) → **"Book a demo"** (`mailto:ip259@cornell.edu`)
- "Start 14-day pilot →" (Growth tier) → **"Book a demo →"** (`mailto:ip259@cornell.edu`)
- "Contact sales" (Enterprise tier) → **"Get in touch →"** (`mailto:ip259@cornell.edu`)

### 7. Final CTA block
- Primary button: "Start pilot →" → **"Book a demo →"** (`mailto:ip259@cornell.edu`)
- Ghost button: "Read the paper" → **"Get in touch →"** (`mailto:ip259@cornell.edu`)

### 8. Footer
- Remove `SOC 2 Type II · build #4f2a91` from the `.copy` bar (replace with plain `© 2026 FluxCompute, Inc.` only)
- Update tagline: `Built on Cornell Tech research.` → `Built by Cornell Tech & MIT researchers. New York · San Francisco.`
- Add email `ip259@cornell.edu` to Company footer column

---

## What is NOT changed
- All existing sections (How it works, Performance, Pricing) — content and layout unchanged
- The live routing feed simulation — kept as-is (it's a visual demo, not a false claim)
- The performance benchmark numbers — kept (they come from the research)
- Dead nav links (How it works, Pricing, Docs, Customers) — left as `#` anchors for now

---

## Open items
- Swap `mailto:ip259@cornell.edu` for a Calendly URL once set up
- Niki's competition result (top 16/900) — omitted pending full name of competition
- Headshots — initials avatars used for now; swap when available
