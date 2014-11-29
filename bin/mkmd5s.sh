IFS=$'\n';(for f in `find . -type f | grep -v .DS_Store |\
                                      grep -v .Trashes |\
                                      grep -v .fseventsd |\
                                      grep -v .Spotlight-V100 |\
                                      grep -v .com.apple.timemachine.supported |\
                                      grep -v .com.apple.timemachine.donotpresent |\
                                      grep -vi pm_lock |\
                                      grep -vie "_md5s_.*txt$" |\
                                      grep -vi md5s.txt`;do md5 $f;done;) > _md5s_`date +%Y%m%d_%H%M%S`.txt
