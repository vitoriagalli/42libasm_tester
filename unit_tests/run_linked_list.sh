#! /bin/bash

test_input()
{
	ERROR=$( ./linked_list "$2" "$3" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		./linked_list "$2" "$3" > "$3".txt
		diff "$3".txt txt/"$1"."$3".exp.txt > diffs/"$1"."$3".txt
		DIFF=$(diff "$3".txt txt/"$1"."$3".exp.txt)
		if [ "$DIFF" != "" ]
		then
			echo -e "\033[0;31m[KO]\033[0m"
		else
			echo -e "\033[0;32m[OK]\033[0m"
			rm -rf diffs/"$1"."$3".txt
		fi
		rm -rf "$3".txt
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

run_all_functions()
{
	for i in {0..3}
	do
		echo -e ""
		echo -e "\033[0;1m> ft_""${FUNCT[i]}""\033[0m"
		for j in {0..3}
		do
			test_input ${FUNCT[i]} $i $j
		done
	done
}

run_function()
{
	echo -e ""
	echo -e "\033[0;1m> ft_""$1""\033[0m"
	for j in {0..3}
	do
		test_input $1 $2 $j
	done

}

FUNCT=(list_push_front list_size list_sort list_remove_if)


COMP=$( clang testers/test_linked_list.c -L. -lasm -o linked_list 2>&1 >/dev/null )

# if [ $? = 0 ]
# then
	clang testers/test_linked_list.c -L. -lasm -o linked_list

	if [ "$1" == "list_push_front" ]; then
		only_funct=0
	elif [ "$1" == "list_size" ]; then
		only_funct=1
	elif [ "$1" == "list_sort" ]; then
		only_funct=2
	elif [ "$1" == "list_remove_if" ]; then
		only_funct=3
	fi

	if [ "$1" == "" ]
	then
		run_all_functions
	else
		run_function "$1" $only_funct
	fi

	rm -rf linked_list

# else
# 	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
# fi



#
# the test compile only when all functions were add to the libasm.a
# even if is a empty source file, need to fix this!
#
