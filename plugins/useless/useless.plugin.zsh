make_snow(){ clear; while :; do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS)); sleep 0.1; done | awk '{a[$3]=0; for(x in a) {o=a[x]; a[x]=a[x]+1; printf "\033[%s;%sH ",o,x; printf "\033[%s;%sH*\033[0;0H",a[x],x;}}' }
transfer() { curl --upload-file ./$1 https://transfer.sh/$1; }

alias transfer=transfer
alias snow=make_snow
alias enable_wifi="networksetup -setairportpower en0 on"
alias disable_wifi="networksetup -setairportpower en0 off"
alias permission="stat -f '%OLp'"
