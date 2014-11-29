#!/bin/bash
#******************************************************************************
#* Name          : zippo.sh
#* Description   : zip directory into a datestamped file.
#* Author        : Mark Berger
#* Date          : 6 Sep 2004
#* Modifications :
#*
#******************************************************************************


DIR=$1

if [ -z "$DIR" ] ; then echo "usage $0 dirname" ; exit; fi
if [ ! -d "$DIR" ] ; then echo "$DIR not a directory" ; exit; fi


zip -r $DIR\_`date +%Y%m%d_%H%M%S` $DIR


