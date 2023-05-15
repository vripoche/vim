grep -ril "$1" `pwd` | xargs sed -i '' "s#$1#$2#g"
