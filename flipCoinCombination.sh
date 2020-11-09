#!/bin/bash -x

flipcount=50
declare -A flip_log
while [ $flipcount -gt 0 ] ; do
	((flip1=RANDOM%2))
	((flip2=RANDOM%2))
	((flip3=RANDOM%2))
	case $flip1$flip2$flip3 in
	000)
		((flip_log[HHH_count]+=1))
		;;
	001)
                ((flip_log[HHT_count]+=1))
                ;;

        010)
                ((flip_log[TTH_count]+=1))
                ;;
        011)
                ((flip_log[HTT_count]+=1))
                ;;
	100)
                ((flip_log[THH_count]+=1))
                ;;
        101)
                ((flip_log[THT_count]+=1))
                ;;

        110)
                ((flip_log[TTH_count]+=1))
                ;;
        111)
                ((flip_log[TTT_count]+=1))
                ;;

	esac
	((flipcount-=1))
done

#Place Holder Value , will be checked with before declaring winner
winner_key=HHH_count


for key in ${!flip_log[@]}  ; do
	echo $key --- ${flip_log[$key]}
	win_percentage=$(($((${flip_log[$key]}*100))/50))
	echo Percentage of $key is $win_percentage\%
	if [ $win_percentage -gt $(($((${flip_log[$winner_key]}*100))/50)) ] ; then
		winner_key=$key
	fi
done

echo Winner is $winner_key

