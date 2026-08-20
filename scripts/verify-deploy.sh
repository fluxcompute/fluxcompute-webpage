#!/usr/bin/env bash
# Verify what is ACTUALLY live, independent of how the deploy was triggered
# (Git integration, `vercel --prod`, or a dashboard Redeploy).
#
#   scripts/verify-deploy.sh
#
# Exit 0 only when the apex is serving current code AND the docs site answers.
# Safe to run any time; it only issues GET/HEAD requests.
APEX="https://fluxcompute.dev"
DOCS="https://docs.fluxcompute.dev"
fail=0

code() { curl -sS -o /dev/null -w "%{http_code}" -m 25 "$1" 2>/dev/null; }
body() { curl -sS -m 25 "$1" 2>/dev/null; }

ok()   { printf "  \033[32mPASS\033[0m  %s\n" "$1"; }
bad()  { printf "  \033[31mFAIL\033[0m  %s\n" "$1"; fail=1; }
want() { # want <url> <expected-code> <label>
  local got; got=$(code "$1")
  [ "$got" = "$2" ] && ok "$3 ($got)" || bad "$3 — expected $2, got $got"
}

echo
echo "Deployment freshness"
curl -sSI -m 25 "$APEX/" 2>/dev/null | grep -iE "^(last-modified|age)" | sed 's/^/  /'
echo "  (compare last-modified against when you deployed — an old date means"
echo "   your change never shipped, whatever the dashboard says)"

echo
echo "1. Apex is serving current code"
if body "$APEX/" | grep -q 'pypi.org/project/fluxcompute/0.1.0/'; then
  bad "footer still links PyPI 0.1.0 — this build predates the fix"
else
  ok "footer PyPI link is unversioned (current code is live)"
fi

echo
echo "2. Private files are not published"
want "$APEX/SKILL.md"                                                   404 "/SKILL.md"
want "$APEX/Design%20System.html"                                       404 "/Design System.html"
want "$APEX/README.md"                                                  404 "/README.md"
want "$APEX/internal/superpowers/plans/2026-07-04-website-overhaul.md"  404 "/internal/superpowers/…"
want "$APEX/docs/superpowers/plans/2026-07-04-website-overhaul.md"      404 "/docs/superpowers/… (old path)"

echo
echo "3. Docs are NOT duplicated on the apex"
echo "   (if these 200, .vercelignore is not being honored — see README)"
want "$APEX/docs/index.html"    404 "/docs/index.html"
want "$APEX/docs/routing.html"  404 "/docs/routing.html"

echo
echo "4. Docs site is live"
verr=$(curl -sSI -m 25 "$DOCS/" 2>/dev/null | grep -i "x-vercel-error" | tr -d '\r')
if [ -n "$verr" ]; then
  bad "$DOCS/ — $verr (no Vercel project is attached to this domain yet)"
else
  want "$DOCS/" 200 "$DOCS/"
  body "$DOCS/" | grep -q "Route every query" \
    && ok "docs home serves the expected content" \
    || bad "docs home reachable but content is unexpected"
  for p in routing execution-graphs telemetry configuration examples; do
    want "$DOCS/$p.html" 200 "/$p.html"
  done
  want "$DOCS/tokens.css" 200 "/tokens.css (shared asset resolves)"
fi

echo
if [ "$fail" = 0 ]; then
  echo "ALL CHECKS PASSED — the deploy is live and correct."
else
  echo "SOME CHECKS FAILED — see above. Nothing here is destructive; re-run after deploying."
fi
exit $fail
