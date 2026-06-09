#!/bin/bash

set -e

SUBMODULE_PATH="$1"
COMMIT_MSG="$2"

if [ -z "$SUBMODULE_PATH" ] || [ -z "$COMMIT_MSG" ]; then
    echo "usage: $0 <submodule-path> <commit-message>"
    exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel)
cd "$REPO_ROOT/$SUBMODULE_PATH"

git add .
git commit -m "$COMMIT_MSG"
git push origin main

echo ""
cd "$REPO_ROOT"
git add "$SUBMODULE_PATH"
git commit -m "chore: update $SUBMODULE_PATH submodule"
git push origin main

echo "Complete!"
