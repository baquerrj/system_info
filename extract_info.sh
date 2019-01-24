#!/bin/bash

if [ -f $OUT ]; then
  rm -f $OUT
fi
OUT='system_info.txt'

# Print User Information
echo -e User Info: > $OUT
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

# Kernel Version
echo -e Kernel Version: >> $OUT
echo -e '\t'`uname -rs` >> $OUT

# Kernel GCC Version
echo -e Kernel GCC Version: >> $OUT
echo -e '\t'`cut -d' ' -f 5-9 /proc/version` >> $OUT

# Kernel Build Time
echo -e Kernel Build Time: >> $OUT
echo -e '\t'`uname -v` >> $OUT

# System Architecture Information
echo -e System Architecture: >> $OUT
echo -e '\t'Machine Hardware Name: `uname -m` >> $OUT
echo -e '\t'Processor Type: `uname -p` >> $OUT
echo -e '\t'Hardware Platform: `uname -i` >> $OUT

# Information on File System Memory
echo -e Total Memory: >> $OUT
echo -e '\t'`vmstat -s | egrep -i 'total memory' | awk '{print $1" "$2}'` >> $OUT
echo -e Used Memory: >> $OUT
echo -e '\t'`vmstat -s | egrep -i 'used memory' | awk '{print $1" "$3}'` >> $OUT
echo -e Free Memory: >> $OUT
echo -e '\t'`vmstat -s | egrep -i 'free memory' | awk '{print $1" "$2}'` >> $OUT
echo -e Active Memory >> $OUT
echo -e '\t'`vmstat -s | egrep -i ' active memory' | awk '{print $1" "$2}'` >> $OUT
echo -e Inactive Memory >> $OUT
echo -e '\t'`vmstat -s | egrep -i 'inactive memory' | awk '{print $1" "$2}'` >> $OUT
echo -e Bufffer Memory >> $OUT
echo -e '\t'`vmstat -s | egrep -i 'buffer memory' | awk '{print $1" "$2}'` >> $OUT
