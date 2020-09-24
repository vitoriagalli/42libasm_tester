#! /bin/bash

test_leak()
{
	valgrind --leak-check=full \
			--log-file=valgrind."$1".txt \
			./"$FUNCT" "$1" 2>&1 >/dev/null
	MEM=$(cat valgrind."$1".txt | grep "All heap blocks were freed -- no leaks are possible")
	if [ "$MEM" = "" ]
	then
		echo -e "\033[0;31m[LEAK]\033[0m"
	else
		echo -e "\033[0;32m[NO_LEAK]\033[0m"
	fi
	rm -f valgrind."$1".txt
}

test_function()
{
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
	rm -f "$1".txt
}

test_input()
{
	ERROR=$( ./"$FUNCT" "$1" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		if [ "$2" = 'leak' ]
		then
			test_leak "$1"
		else
			test_function "$1"
		fi
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
	clang -Wall -Werror -Wextra testers/test_linked_list.c \
	testers/test_"$FUNCT".c -L. -lasm -g -o "$FUNCT" 2>&1 >/dev/null
	for i in {0..4}
	do
		test_input $i $2
	done
	rm -f "$FUNCT"
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi
