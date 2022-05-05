#!/bin/sh

# SPDX-License-Identifier: GPL-3.0-or-later

# See https://github.com/keirf/greaseweazle/issues/193
gw info  2>&1 | grep -q "Not found"
if [ $? == 0 ] ; then
	echo "Error: did not detect any Greaseweazle"
	exit 1
fi

echo "Insert a non-write protected floppy. Floppy will be erased."
echo "Press Enter to continue, Ctrl+C to abort"
read

FULLIMG=`mktemp --suffix=.img`

gw write --format ibm.1440 144mb-empty.img
echo write empty retval $?
gw read --format ibm.1440 $FULLIMG
diff $FULLIMG 144mb-empty.img
if [ $? != 0 ] ; then
	echo "Error: Failed to read/write empty disk image"
	exit 1
fi
echo "Read/Write test #1 OK"
rm -f $FULLIMG

gw write --format ibm.1440 144mb-full.img
gw read --format ibm.1440 $FULLIMG
diff $FULLIMG 144mb-full.img
if [ $? != 0 ] ; then
	echo "Error: Failed to read/write full disk image"
	exit 1
fi
echo "Read/Write test #2 OK"
