#! /bin/bash

test_input()
{
	ERROR=$( ./"$FUNCT" "$1" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		./"$FUNCT" "$1" > "$1".txt
		diff "$1".txt txt/"$FUNCT"."$1".exp.txt > diffs/"$FUNCT"."$1".txt
		DIFF=$(diff "$1".txt txt/"$FUNCT"."$1".exp.txt)
		if [ "$DIFF" != "" ]
		then
			echo -e "\033[0;31m[KO]\033[0m"
		else
			echo -e "\033[0;32m[OK]\033[0m"
			rm -rf diffs/"$FUNCT"."$1".txt
		fi
		rm -rf "$1".txt
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"
COMP=$( clang  testers/test_linked_list.c testers/test_"$FUNCT".c \
		-L. -lasm -o "$FUNCT" 2>&1 >/dev/null )
if [ $? = 0 ]
then
	clang testers/test_linked_list.c testers/test_"$FUNCT".c -L. -lasm  \
		-g -o "$FUNCT" 2>&1 >/dev/null
	for i in {0..4}
	do
		test_input $i
	done
	rm -rf "$FUNCT"
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi
