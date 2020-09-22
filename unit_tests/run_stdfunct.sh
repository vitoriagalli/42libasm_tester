#! /bin/bash

test_input()
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
	rm -rf a b
}

FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"

clang testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT"

test_input 1 "Hello World!"
test_input 2 "lorem\tipsum\tdolor\nsit\namet\n"
test_input 3 "\n\n\f\r\t"
test_input 4 ""
test_input 5 "    "

rm -rf "$FUNCT"
