#!/bin/bash

REPO_URL="https://github.com/csc-training/high-performance-r"

REVISION=$(git rev-parse --short HEAD)
REVISION_LONG=$(git rev-parse HEAD)
TIMESTAMP=$(git show --no-patch --format=%ci $REVISION_LONG)

echo "Updated for <c-link href=\"$REPO_URL/commit/$REVISION_LONG\">$REVISION</c-link> ($TIMESTAMP)"
