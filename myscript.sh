#!/bin/sh

# write out some stuff
echo "output"
echo This message goes to stderr >&2

# do something which returns an exit code
echo "true" | grep -q "false"
