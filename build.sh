#!/usr/bin/env bash
# Package a Manifest V3 browser extension into a distributable zip.
#
#   ./build.sh            -> dist/<name>-<version>.zip
#
# The archive keeps manifest.json at its root, which is what the
# Chrome Web Store / Edge Add-ons uploader and "Load unpacked" both expect.
#
# Reusing this in another extension: edit FILES below. Everything else --
# the name, the version, the output layout, the exclusions -- is derived
# or project-agnostic.
set -euo pipefail

cd "$(dirname "$0")"

# Everything the browser loads, relative to this script. Listed explicitly
# rather than excluded by pattern: a missing entry breaks the extension
# loudly and immediately, whereas a missing exclusion quietly ships private
# files to a public store.
FILES=(manifest.json icons css popup scripts settings)

# Output filename prefix. Leave empty to slugify the manifest's name.
NAME=""

read_manifest_key() {
  sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" manifest.json | head -1
}

VERSION=$(read_manifest_key version)
if [ -z "$VERSION" ]; then
  echo "Could not read \"version\" from manifest.json" >&2
  exit 1
fi

if [ -z "$NAME" ]; then
  NAME=$(read_manifest_key name | tr '[:upper:]' '[:lower:]' \
    | tr -cs 'a-z0-9' '-' | sed 's/^-*//;s/-*$//')
fi
if [ -z "$NAME" ]; then
  echo "Could not derive a name; set NAME at the top of build.sh" >&2
  exit 1
fi

missing=()
for f in "${FILES[@]}"; do
  [ -e "$f" ] || missing+=("$f")
done
if [ ${#missing[@]} -gt 0 ]; then
  echo "Missing: ${missing[*]}" >&2
  echo "Update the FILES list at the top of build.sh." >&2
  exit 1
fi

OUT="dist/${NAME}-${VERSION}.zip"
mkdir -p dist
rm -f "$OUT"

zip -r -q "$OUT" "${FILES[@]}" -x '*.DS_Store' '*/.*'

echo "Built $OUT ($(du -h "$OUT" | cut -f1))"
unzip -Z1 "$OUT"
