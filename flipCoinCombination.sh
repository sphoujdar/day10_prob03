#!/bin/bash -x

flipcount=50
declare -A flip_log
while [ $flipcount -gt 0 ] ; do
	((flip1=RANDOM%2))
	#((filp2=RANDOM%2))
	case $flip1 in
	0)
		((flip_log[H_count]+=1))
		;;
	1)
                ((flip_log[T_count]+=1))
                ;;

        #        ((th_count+=1))
        #        ;;
	#11)
        #        ((tt_count+=1))
        #        ;;
	esac
	((flipcount-=1))
done


for key in ${!flip_log[@]}  ; do
	echo $key --- ${flip_log[$key]}
	echo Percentage of $key is $(($((${flip_log[$key]}*100))/50))\%
done



