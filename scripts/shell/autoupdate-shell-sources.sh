#! /bin/bash

set -e

echo "shell sources directory is: $SHELL_SOURCES_DIR"
echo "remote repository url is: $SHELL_SOURCES_REMOTE"

# Not a git repo
if [ ! -d "$SHELL_SOURCES_DIR" ]; then
    echo "shell sources directory not found, attempting to clone..."
    if git clone "$SHELL_SOURCES_REMOTE" "$SHELL_SOURCES_DIR" ; then
        exit 0
    else
        echo "Failed to clone repository at $SHELL_SOURCES_REMOTE to $SHELL_SOURCES_DIR"
        exit 1
    fi
fi

cd "$SHELL_SOURCES_DIR" || exit 0

echo "shell sources directory found"
# Any uncommitted changes
if [[ -n $(git status --porcelain) ]]; then
    echo "there are uncommitted local changes. leaving to be resolved manually..."
    exit 0
fi

echo "fetching changes from remote..."
git fetch --prune

# Check commits behind/ahead
read -r behind ahead < <(git rev-list --left-right --count origin/HEAD...HEAD)

echo "local repository is $ahead commits ahead, $behind commits behind"

# ahead
if [ "$ahead" -gt 0 ]; then
    echo "local repository is ahead of remote. leaving to be resolved manually..."
    exit 0

# behind
elif [ "$behind" -gt 0 ]; then
    echo "local repository is behind remote. pulling changes..."
    git reset --hard origin/HEAD
    exit 0

# up to date
else
    echo "everything up to date"
    exit 0
fi