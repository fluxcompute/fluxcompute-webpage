#!/usr/bin/env bash
# Regenerate docs/tokens.css from the root tokens.css.
#
#   scripts/sync-tokens.sh           regenerate the copy
#   scripts/sync-tokens.sh --check   exit 1 if the copy is stale (for CI)
#
# The docs site is a separate Vercel project whose Root Directory is docs/, so
# it can only serve files from inside docs/ — hence the copy. This script
# exists because the obvious `cp tokens.css docs/tokens.css` deletes the header
# that says the file is a copy, leaving no marker for the next person.
set -euo pipefail
cd "$(dirname "$0")/.."

BANNER='/* GENERATED FILE — do not edit.
 * Copy of ../tokens.css, written by scripts/sync-tokens.sh.
 * Edit the root tokens.css, then re-run that script.
 */
'
expected="${BANNER}$(cat tokens.css)"

if [ "${1:-}" = "--check" ]; then
  if [ "$expected" = "$(cat docs/tokens.css 2>/dev/null)" ]; then
    echo "docs/tokens.css is in sync with tokens.css"
    exit 0
  fi
  echo "docs/tokens.css is STALE — run scripts/sync-tokens.sh" >&2
  exit 1
fi

# Trailing \n keeps the file POSIX-clean. --check compares via "$(cat …)", which
# strips trailing newlines on both sides, so this stays consistent with it.
printf '%s\n' "$expected" > docs/tokens.css
echo "regenerated docs/tokens.css from tokens.css"
