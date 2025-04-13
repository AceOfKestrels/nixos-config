#! /bin/sh

echo "Copy template configs..."

SCRIPT=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPT")
DEST="$SCRIPTDIR/local"

mkdir -p "$DEST"

for file in "$SCRIPTDIR"/templates/*.local.nix; do
    if [ -z "$file" ]; then
        echo "No file found..."
        continue
    fi
    base_name=$(basename "$file")
    if [ -e "$DEST/$base_name" ]; then
        echo "$base_name already exists."
        continue
    fi
    if cp --update=none "$file" "$DEST/$base_name"; then
        echo "Successfully created $base_name"
    fi
done