#!/bin/bash
#******************************************************************************
#* Name          : tgzippo.sh
#* Description   : tar and gzip directory into a datestamped file.
#* Author        : Mark Berger
#* Date          : 10 Oct 2005
#* Modifications :
#*
#******************************************************************************


FILE=$1

if [ -z "$FILE" ] ; then echo "usage $0 filename" ; exit; fi
if [[ ! -f "$FILE"  && ! -d "$FILE" ]] ; then echo "$FILE doesn't exist" ; exit; fi

export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
tar -cvzf "$FILE"_`date +%Y%m%d_%H%M%S`.tgz $FILE


