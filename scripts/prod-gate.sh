#!/usr/bin/env bash
# Prod gate for halditech-landing (#546) — the wiring guarantee.
# Refuse promotion to production (main) if the GTM container is missing from index.html.
# Run this before promoting integration/staging -> main. Non-zero exit = DO NOT PROMOTE.
#
# Rationale: Lovable regenerates whole files and could strip the tracking block. AGENTS.md tells its
# agent not to, and this is the belt-and-suspenders check John+Claude run at the prod gate.
set -euo pipefail

CONTAINER="GTM-PTNGVBS"
FILE="index.html"

if grep -q "$CONTAINER" "$FILE"; then
  echo "✓ prod-gate PASS: $CONTAINER present in $FILE"
  exit 0
else
  echo "✗ prod-gate FAIL: $CONTAINER missing from $FILE — DO NOT PROMOTE."
  echo "  Re-insert the wiring block (see AGENTS.md) before promoting to main."
  exit 1
fi
