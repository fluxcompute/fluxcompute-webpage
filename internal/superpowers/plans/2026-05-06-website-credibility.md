# Website Credibility Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace fake/aspirational signals on fluxcompute/index.html with real credibility anchors and honest pre-launch CTAs, ahead of YC/Speedrun applications.

**Architecture:** All changes are in a single file (`index.html`). CSS additions go inside the existing `<style>` block. New Team section HTML is inserted between the Pricing `<section>` and the `.cta-final` `<div>`. No JS changes needed.

**Tech Stack:** Vanilla HTML/CSS, existing design tokens in `tokens.css`.

---

## File Map

| File | Action |
|------|--------|
| `index.html` | Modify — all changes below |

---

### Task 1: Nav — remove Sign In, rename Research → Team, replace CTA

**Files:**
- Modify: `index.html` (nav `.right` and nav `.center`)

- [ ] **Step 1: Replace nav right section**

Find this exact block in `index.html` (lines 346–349):
```html
  <div class="right">
    <a href="#" style="font-size: var(--text-sm); color: var(--fg-1);">Sign in</a>
    <a href="#" class="btn btn-flux btn-sm">Start free →</a>
  </div>
```
Replace with:
```html
  <div class="right">
    <a href="mailto:ip259@cornell.edu" style="font-size: var(--text-sm); color: var(--fg-1);">ip259@cornell.edu</a>
    <a href="mailto:ip259@cornell.edu" class="btn btn-flux btn-sm">Book a demo →</a>
  </div>
```

- [ ] **Step 2: Rename Research → Team in center nav**

Find:
```html
    <a href="#">Research</a>
```
Replace with:
```html
    <a href="#team">Team</a>
```

- [ ] **Step 3: Verify visually**

Open `index.html` in a browser. Confirm:
- No "Sign in" in top-right
- Email address link visible in nav
- "Book a demo →" button in top-right
- Center nav shows "Team" not "Research"

- [ ] **Step 4: Commit**
```bash
git add index.html
git commit -m "nav: remove sign in, rename Research to Team, swap CTA to book a demo"
```

---

### Task 2: Hero eyebrow + CTAs

**Files:**
- Modify: `index.html` (hero eyebrow span and `.cta` div)

- [ ] **Step 1: Fix hero eyebrow**

Find:
```html
      <span class="t-mono" style="color: var(--fg-2);">→ read the Cornell Tech paper</span>
```
Replace with:
```html
      <span class="t-mono" style="color: var(--fg-2);">Research · NE Agents Day 2026 · Cornell Tech</span>
```

- [ ] **Step 2: Fix hero CTA buttons**

Find:
```html
    <div class="cta">
      <a class="btn btn-flux btn-lg">See it on your traffic →</a>
      <a class="btn btn-ghost btn-lg">Read the paper</a>
      <span class="hint">or <kbd>⌘</kbd><kbd>K</kbd> to search</span>
    </div>
```
Replace with:
```html
    <div class="cta">
      <a href="mailto:ip259@cornell.edu" class="btn btn-flux btn-lg">Book a demo →</a>
      <a href="#team" class="btn btn-ghost btn-lg">Meet the team →</a>
    </div>
```

- [ ] **Step 3: Verify visually**

Open `index.html` in a browser. Confirm:
- Eyebrow shows "Research · NE Agents Day 2026 · Cornell Tech" (no arrow, not a link)
- Hero primary button says "Book a demo →"
- Ghost button says "Meet the team →"
- No ⌘K hint visible

- [ ] **Step 4: Commit**
```bash
git add index.html
git commit -m "hero: replace paper links with demo CTA and team scroll link"
```

---

### Task 3: Replace fake logo strip with institution strip

**Files:**
- Modify: `index.html` (`.strip` div inside hero)

- [ ] **Step 1: Replace strip content**

Find:
```html
    <div class="strip">
      <div class="lbl">Routing production agents at</div>
      <div class="marks">
        <span>◆ Mercator</span>
        <span>Helix.ai</span>
        <span>Bracket</span>
        <span>Rune</span>
        <span>Northwind</span>
        <span>Yoke Labs</span>
      </div>
    </div>
```
Replace with:
```html
    <div class="strip">
      <div class="lbl">Research &amp; engineering from</div>
      <div class="marks">
        <span>Cornell Tech</span>
        <span>MIT CSAIL</span>
        <span>Google</span>
        <span>Veolia</span>
      </div>
    </div>
```

- [ ] **Step 2: Verify visually**

Open `index.html` in a browser. Confirm:
- Strip reads "Research & engineering from"
- Four institution names visible: Cornell Tech, MIT CSAIL, Google, Veolia
- No startup placeholder names remain

- [ ] **Step 3: Commit**
```bash
git add index.html
git commit -m "hero: replace fake customer logos with real institution strip"
```

---

### Task 4: Add Team section CSS + HTML

**Files:**
- Modify: `index.html` (`<style>` block and body between `</section>` pricing close and `<div class="container"> <div class="cta-final">`)

- [ ] **Step 1: Add Team CSS**

Inside the `<style>` block, immediately before the closing `</style>` tag, add:
```css
  /* === Team === */
  .team-grid { display: grid; grid-template-columns: 1fr 1fr; gap: var(--s-5); }
  .team-card {
    background: var(--bg-1); border: 1px solid var(--line-1);
    border-radius: var(--r-4); padding: var(--s-6);
    display: flex; flex-direction: column; gap: var(--s-4);
  }
  .team-avatar {
    width: 48px; height: 48px; border-radius: 50%;
    background: var(--flux-gradient);
    display: flex; align-items: center; justify-content: center;
    font: 600 var(--text-md)/1 var(--font-sans);
    color: #fff; flex-shrink: 0;
  }
  .team-name { margin: 0; font: 600 var(--text-md)/1.2 var(--font-sans); letter-spacing: var(--tracking-tight); }
  .team-role { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--flux-cyan); letter-spacing: var(--tracking-caps); text-transform: uppercase; margin-top: var(--s-1); }
  .team-bio { margin: 0; font-size: var(--text-sm); color: var(--fg-1); line-height: 1.6; }
  .team-contact { font-family: var(--font-mono); font-size: var(--text-xs); color: var(--fg-2); margin-top: auto; }
  .team-contact a { color: var(--flux-cyan); }
  @media (max-width: 880px) { .team-grid { grid-template-columns: 1fr; } }
```

- [ ] **Step 2: Add Team section HTML**

Find the comment `<!-- CTA -->` (line ~641) and insert the following block immediately before it:
```html
<!-- 04 Team -->
<section class="s" id="team">
  <div class="container">
    <div class="s-head">
      <div>
        <div class="num">04 · Team</div>
        <h2>Built by researchers who've worked on the problem.</h2>
      </div>
      <p>FluxCompute is built by two Cornell Tech researchers with hands-on experience in ML hardware, production LLM systems, and inference optimization.</p>
    </div>
    <div class="team-grid">
      <div class="team-card">
        <div class="team-avatar">I</div>
        <div>
          <h3 class="team-name">Ishan Patwardhan</h3>
          <div class="team-role">Co-founder</div>
        </div>
        <p class="team-bio">Researcher at Cornell Tech in Agentic Systems, ML hardware, and hardware-software co-design. Inference research at MIT CSAIL: hierarchical MoE, DAG-based token routing. SWE at Google: SVD-based context engineering and evaluation frameworks for Gemini. Prior: HPC systems, math libraries, and container platforms at Hewlett Packard Enterprise.</p>
        <div class="team-contact"><a href="mailto:ip259@cornell.edu">ip259@cornell.edu</a></div>
      </div>
      <div class="team-card">
        <div class="team-avatar">N</div>
        <div>
          <h3 class="team-name">Niki Karanikola</h3>
          <div class="team-role">Co-founder</div>
        </div>
        <p class="team-bio">Two years shipping production LLM inference, dense retrieval, and RAG pipelines at Veolia — re-architected enterprise knowledge access from weeks to minutes, 6× faster reporting cadence, +20% NDCG. Researcher at Cornell Tech's Social Technologies Lab.</p>
        <div class="team-contact"><a href="mailto:nk699@cornell.edu">nk699@cornell.edu</a></div>
      </div>
    </div>
  </div>
</section>

```

- [ ] **Step 3: Verify visually**

Open `index.html` in a browser. Confirm:
- "04 · Team" section appears between Pricing and the final CTA block
- Two cards side by side (stacked on mobile)
- Each card has a gradient circle avatar (I / N), name, Co-founder label, bio text, and email link
- "Meet the team →" ghost button in hero scrolls to this section

- [ ] **Step 4: Commit**
```bash
git add index.html
git commit -m "feat: add team section with founder cards (Ishan + Niki)"
```

---

### Task 5: Fix pricing CTAs

**Files:**
- Modify: `index.html` (three pricing `.price` blocks)

- [ ] **Step 1: Fix Pilot tier CTA**

Find:
```html
        <a class="btn btn-ghost">Start pilot</a>
```
Replace with:
```html
        <a href="mailto:ip259@cornell.edu" class="btn btn-ghost">Book a demo</a>
```

- [ ] **Step 2: Fix Growth tier CTA**

Find:
```html
        <a class="btn btn-flux">Start 14-day pilot →</a>
```
Replace with:
```html
        <a href="mailto:ip259@cornell.edu" class="btn btn-flux">Book a demo →</a>
```

- [ ] **Step 3: Fix Enterprise tier CTA**

Find:
```html
        <a class="btn btn-ghost">Contact sales</a>
```
Replace with:
```html
        <a href="mailto:ip259@cornell.edu" class="btn btn-ghost">Get in touch →</a>
```

- [ ] **Step 4: Verify visually**

Open `index.html` in a browser. Confirm:
- All three pricing cards show updated CTA labels
- Clicking any CTA opens a mailto: draft to ip259@cornell.edu

- [ ] **Step 5: Commit**
```bash
git add index.html
git commit -m "pricing: replace pilot/contact-sales CTAs with book-a-demo mailto links"
```

---

### Task 6: Final CTA block + footer cleanup

**Files:**
- Modify: `index.html` (`.cta-final` buttons, footer `.copy`, footer tagline, footer Company column)

- [ ] **Step 1: Fix final CTA buttons**

Find:
```html
    <div class="row">
      <a class="btn btn-flux btn-lg">Start pilot →</a>
      <a class="btn btn-ghost btn-lg">Read the paper</a>
    </div>
```
Replace with:
```html
    <div class="row">
      <a href="mailto:ip259@cornell.edu" class="btn btn-flux btn-lg">Book a demo →</a>
      <a href="mailto:ip259@cornell.edu" class="btn btn-ghost btn-lg">Get in touch →</a>
    </div>
```

- [ ] **Step 2: Remove SOC 2 / build hash from footer**

Find:
```html
  <div class="copy">
    <span>© 2026 FluxCompute, Inc.</span>
    <span>SOC 2 Type II · build #4f2a91</span>
  </div>
```
Replace with:
```html
  <div class="copy">
    <span>© 2026 FluxCompute, Inc.</span>
  </div>
```

- [ ] **Step 3: Update footer tagline**

Find:
```html
    <p class="meta">The compiler for agentic systems. Built on Cornell Tech research. New York · San Francisco.</p>
```
Replace with:
```html
    <p class="meta">The compiler for agentic systems. Built by Cornell Tech &amp; MIT researchers. New York · San Francisco.</p>
```

- [ ] **Step 4: Update footer Company column**

Find:
```html
  <div>
    <h4>Company</h4>
    <ul>
      <li><a href="#">Research</a></li>
      <li><a href="#">Customers</a></li>
      <li><a href="#">Careers</a></li>
      <li><a href="#">Security</a></li>
    </ul>
  </div>
```
Replace with:
```html
  <div>
    <h4>Company</h4>
    <ul>
      <li><a href="#team">Team</a></li>
      <li><a href="#">Customers</a></li>
      <li><a href="#">Careers</a></li>
      <li><a href="mailto:ip259@cornell.edu">Contact</a></li>
    </ul>
  </div>
```

- [ ] **Step 5: Verify visually**

Open `index.html` in a browser. Confirm:
- Final CTA block shows "Book a demo →" and "Get in touch →"
- Footer bottom bar shows only "© 2026 FluxCompute, Inc." — no SOC2 or build hash
- Footer tagline reads "Built by Cornell Tech & MIT researchers."
- Footer Company column shows "Team" (scrolls to #team) and "Contact" (opens mailto)

- [ ] **Step 6: Final full-page check**

Scroll the full page top to bottom and verify:
- No "Sign in" anywhere
- No "Read the paper" anywhere
- No fake company names anywhere
- No "SOC 2" anywhere
- Team section present and well-formatted
- All demo/contact buttons open mailto: correctly

- [ ] **Step 7: Commit and push**
```bash
git add index.html
git commit -m "cleanup: fix final CTA, remove SOC2, update footer tagline and company links"
git push
```
