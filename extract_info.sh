#!/bin/bash

if [ -f $OUT ]; then
  rm -f $OUT
fi
OUT='system_info.txt'

# Print User Information
echo -e User: > $OUT
echo -e '\t'`git config user.name` >> $OUT
echo -e '\t'$USER >> $OUT

# OS Type
echo -e OS Type: >> $OUT
echo -e '\t'`uname --kernel-name` >> $OUT

# OS Distribution and Version
echo -e OS Distribution: >> $OUT
echo -e '\t'`lsb_release --id -s` >> $OUT
echo -e OS Version: >> $OUT
echo -e '\t'`lsb_release -ds | awk '{print $2"\t"$3}'` >> $OUT

