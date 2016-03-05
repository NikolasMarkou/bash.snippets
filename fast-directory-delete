#!/bin/bash

# rm is too slow when handling lots of small files, this is 
# because it creates internal lists before deleting them,
# that means that if you have millions of files it will take long 
# before even starting to delete anything.

# The correct and fast way to delete something is as follows
# find all files using the find command and 
# delete them as soon as they are found

## Parse arguments
ARGS=( "$@" )

for ARG in ${ARGS[@]} ; do
  if [ ! -e "${ARG}" ] ; then
    echo "${ARG} does not exist"
    continue
  fi
  
  find ${ARG} -type f -delete
  rm -rf ${ARG}
done

exit 0
