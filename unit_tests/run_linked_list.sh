#! /bin/bash

test_input()
{
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

clang testers/test_linked_list.c -L. -lasm -o linked_list
FUNCT=(list_push_front list_size list_sort list_remove_if)

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
