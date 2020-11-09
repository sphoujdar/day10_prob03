#!/bin/bash -x

flipcount=50
declare -A flip_log
while [ $flipcount -gt 0 ] ; do
	((flip1=RANDOM%2))
	((flip2=RANDOM%2))
	case $flip1$flip2 in
	00)
		((flip_log[HH_count]+=1))
		;;
	01)
                ((flip_log[HT_count]+=1))
                ;;

        10)
                ((flip_log[TH_count]+=1))
                ;;
        11)
                ((flip_log[TT_count]+=1))
                ;;

	esac
	((flipcount-=1))
done


for key in ${!flip_log[@]}  ; do
	echo $key --- ${flip_log[$key]}
	echo Percentage of $key is $(($((${flip_log[$key]}*100))/50))\%
done



