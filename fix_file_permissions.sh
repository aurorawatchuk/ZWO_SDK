#!/bin/sh

DIR=`dirname $0`
if [ -z "$DIR" ]; then
    echo "Unknown directory"
    exit 1
fi
DIR="$DIR/SDK"

# Remove write for everyone
chmod -R o-w "$DIR"

# Remove execute from files which are not in a bin directory
find "$DIR" -type f -not -regex '.*/bin/.*' -exec chmod a-x {} +
