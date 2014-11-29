#!/bin/sh
# Create a tgz file  of changes to be uploaded to website based
# on svn revision numbers
# Usage example: mkgitfixforwebsite.sh 8fe7357^ 91b

                         
if [ -z "$1" ] ; then echo "usage $0 sha1 sha2" ; exit; fi

export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true
DATE=`date +"%Y%m%d-%H%M"`
echo "fix_git_$DATE.tgz"
git diff --name-status $1 $2 | cut -f2 | sort -u |\
  tar -czvf fix_git_$DATE.tgz -T - \
    --exclude=".git*" \
    --exclude="templates*" \
    --exclude=".htaccess" \
    --exclude="_ini.php" \
    --exclude="._*"  \
    --exclude="resources*" \
    --exclude="zest_layout*" \
    --exclude="bin*" \
    --exclude=".DS_Store"

