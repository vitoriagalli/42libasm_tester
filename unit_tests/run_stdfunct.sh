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
	./"$FUNCT" $ORIG "$2" > a
	./"$FUNCT" $IMPLEM "$2" > b
	diff a b > diffs/ft_"$FUNCT"."$1".txt
	DIFF=$(diff a b)
	if [ "$DIFF" != "" ]
	then
		echo -e "\033[0;31m[KO]\033[0m"
	else
		echo -e "\033[0;32m[OK]\033[0m"
		rm -rf diffs/ft_"$FUNCT"."$1".txt
	fi
	rm -f a b
}

test_input()
{
	ERROR=$( ./"$FUNCT" $IMPLEM "$2" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		if [ "$3" = 'leak' ] && [ "$FUNCT" = "strdup" ]
		then
			test_leak "$2"
		else
			test_function "$1" "$2"
		fi
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"
COMP=$( clang testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT" 2>&1 >/dev/null )
if [ $? = 0 ]
then
	clang -Wall -Werror -Wextra testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT"
	test_input 1 "Hello World!" "$2"
	test_input 2 "lorem\tipsum\tdolor\nsit\namet\n" "$2"
	test_input 3 "\n\n\f\r\t" "$2"
	test_input 4 "" "$2"
	test_input 5 "    " "$2"
	rm -f "$FUNCT"
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi
