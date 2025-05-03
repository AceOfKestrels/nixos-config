#! /bin/sh

__sourceAll() {
    source "$SHELL_SOURCES_DIR/$SHELL_SOURCES_SOURCE_ALL_FILE"
}

__shellSourcesCheckForUpdates() {
    # Disable job control output
    set +m
    {
        cd "$SHELL_SOURCES_DIR"
        git fetch --quiet
        if ! git diff --quiet HEAD "$SHELL_SOURCES_REMOTE_BRANCH" ; then
            echo "shell-sources has been updated."
            echo "Run \"update-shell-sources\" to pull the changes."
        fi
        cd - > /dev/null
    } &
    disown

    set -m
}

update-shell-sources() {
    if [ ! -d "$SHELL_SOURCES_DIR" ]; then
        if git clone "$SHELL_SOURCES_REMOTE" "$SHELL_SOURCES_DIR" ; then
            __sourceAll
            return 0
        else
            echo "Failed to clone repository at $SHELL_SOURCES_REMOTE to $SHELL_SOURCES_DIR"
            return 1
        fi
    fi

    cd "$SHELL_SOURCES_DIR"

    if ! git diff-index --quiet HEAD -- ; then
        echo "There are local changes. Please resolve them manually."
        return 1
    fi

    git fetch
    git reset --hard "$SHELL_SOURCES_REMOTE_BRANCH" --quiet

    echo "Updating..."

    __sourceAll
    cd - > /dev/null
}

if [ ! -d "$SHELL_SOURCES_DIR" ]; then
    echo "shell-sources directory not found at $SHELL_SOURCES_DIR"
    echo "Run \"update-shell-sources\" to clone the repository."
    return 0
fi

__sourceAll

__shellSourcesCheckForUpdates
