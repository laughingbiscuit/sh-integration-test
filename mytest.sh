#!/bin/sh

RESULT=

# run our script
SCRIPT_OUTPUT=$(sh myscript.sh 2>&1)
SCRIPT_CODE=$?

# Assert some content of the script
echo "$SCRIPT_OUTPUT" | grep -q "output"
RESULT=$RESULT"Result contains output,$?;"

# Assert the response code
[ $SCRIPT_CODE -eq 1 ]
RESULT=$RESULT"Result code is 1,$?;"

# Print the results
echo
echo "RESULTS"
echo "$RESULT" | tr ';' '\n' | column -s ',' -t

# Set exit code
[ -z `echo "$RESULT" | awk -F"," '{ print $2 }' RS=";" | grep -v 0` ]
exit $?
