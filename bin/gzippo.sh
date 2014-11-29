#!/bin/bash
#******************************************************************************
#* Name          : zippo.sh
#* Description   : zip directory into a datestamped file.
#* Author        : Mark Berger
#* Date          : 6 Sep 2004
#* Modifications :
#*
#******************************************************************************


FILE=$1

if [ -z "$FILE" ] ; then echo "usage $0 filename" ; exit; fi
if [ ! -f "$FILE" ] ; then echo "File $FILE doesn't exist" ; exit; fi


gzip -S _`date +%Y%m%d_%H%M%S`.gz $FILE


