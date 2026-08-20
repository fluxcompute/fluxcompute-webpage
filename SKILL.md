# FluxCompute — Skill notes for AI assistants

When designing inside this project, follow these rules. Read `README.md` for brand context first.

## Always
1. **Load `tokens.css`.** Don't redefine colors, type, spacing, or radius — they exist as CSS custom properties. Use them: `var(--bg-1)`, `var(--fg-0)`, `var(--accent-grad)`, `var(--s-5)`, `var(--r-3)`.
2. **Default to dark.** Every page starts with `<html data-theme="dark">`. Light is a variant, not a peer.
3. **Use the type primitives.** `t-display`, `t-h1..h3`, `t-body`, `t-small`, `t-caps`, `t-mono`. Don't hand-roll font stacks.
4. **Use the components.** `.btn`, `.btn-flux`, `.btn-ghost`, `.btn-primary`, `.card`, `.input`, `.badge`, `.code` are defined. Compose with these before inventing.
5. **Mono for numbers.** Latency, IDs, prices, region codes, deploy hashes, file sizes — all JetBrains Mono. Don't put numbers in Inter Tight body type.

## Color rules
- **One accent per surface.** The accent gradient (`--accent-grad`) is loud. Use it for: the logo, the primary CTA, one hero element, and key data viz. If you've used it three times on a page, kill two.
- **Status colors are muted.** `--ok-text` and `--fail` are deliberately desaturated. Don't replace them with bright greens/reds.
- **Borders are hairlines.** `var(--line-1)` (7% white) is the default divider, `--line-2` (13%) for inputs/cards. There is no `--line-3`. Never solid 1–2px in `fg-0`.
- **Don't introduce new colors.** If a design "needs" a different blue, you're probably reaching for accent when the answer is hierarchy via type weight or surface elevation.

## Layout rules
- **8px grid.** All spacing on `--s-1..s-10`. No arbitrary `padding: 13px`.
- **Tight corners.** `--r-2` (6px) for buttons/inputs, `--r-3` (10px) for cards, `--r-4` (14px) for big surfaces. Avoid pill/capsule shapes except for status badges and toggles.
- **Density over whitespace.** This is a developer tool. A landing page can breathe; a dashboard should feel information-rich, not airy.
- **Grid backgrounds, not gradients.** Hero surfaces use the dotted `.bg-grid` utility, not abstract blurry blobs. Implies coordinate space, not "AI."

## Type rules
- **Tight tracking on display.** `letter-spacing: var(--tracking-display)` (-0.03em) at 40px+. Inter Tight is already tight; on big sizes it needs more.
- **Pretty wrapping.** Use `text-wrap: pretty;` on body copy, `text-wrap: balance;` on headlines.
- **No serif. Ever.** This is infrastructure, not a magazine.

## Voice rules (copywriting)
- **Specific over aspirational.** "p50 cold start: 340ms" beats "blazingly fast." Numbers > adjectives.
- **No exclamation points.** Tone is calm and confident; the product speaks.
- **Technical literacy assumed.** "kubectl," "CUDA," "p99," "OTLP" — readers know these. Don't define them.
- **Active, direct verbs.** "Deploy" not "unleash." "Ship" not "leverage." Avoid "powerful," "intelligent," "magical," "seamless."
- **Mono in copy, sparingly.** Use the mono font for actual code, paths, hashes, and metric values that appear inline. Don't style headlines in mono for "tech feel."

## What to avoid
- Glassmorphism, frosted glass cards
- Hexagon mesh / circuit-board patterns
- Generic "AI blue" gradients (use the terminal-green `--accent-grad`)
- Robot/brain/neural-network iconography
- Drop shadows on everything (use `--shadow-1` and `--shadow-2` rarely; flat is the default)
- Emoji. The brand has no emoji vocabulary.
- Stock photography of "diverse engineers pointing at screens"
- Filler stat blocks ("99.99% uptime!" "10x faster!") with no substance

## Iconography
No icon library is canonical. Use 18–20px line icons at 1.5–2px stroke width, `currentColor`. Prefer minimal Phosphor / Lucide-style geometry. The flux mark itself is the only branded glyph.

## When inventing new components
Match the existing shape language: 1px hairline borders, 6–14px radius, mono labels for metadata, sans for content. Test in both dark and light themes. Snap every dimension to the spacing scale.

## Files
- `tokens.css` — load this on every page
- `logo.svg` — full lockup; for inline use copy the `<svg>` from `Design System.html` and set `currentColor` for the wordmark
- `Design System.html` — reference / spec sheet
- `index.html` — the landing page, the system applied end to end

When in doubt: open Linear, Vercel, or Modal in another tab. Ask "would they ship this?" If no, simplify.
