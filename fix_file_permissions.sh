#!/bin/sh

DIR="$1"
if [ -z "$DIR" -o ! -d "$DIR" ]; then
    echo "Unknown directory"
    exit 1
fi
DIR=`readlink -f "$1"`

echo "Fixing permissions on  $DIR"
sleep 2

# Remove write for everyone
chmod -R o-w "$DIR"

# Remove execute from files which are not in a bin directory
find "$DIR" -type f -not -regex '.*/bin/.*' -exec chmod a-x {} +

# Remove execute from files in the root of the directory
# find "$DIR" -type f -not -regex '.*' -exec chmod a-x {} +
find "$DIR" -maxdepth 1 -type f -regex '.*' -exec chmod a-x {} +

echo "Done"
