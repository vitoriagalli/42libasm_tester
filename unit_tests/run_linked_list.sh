#! /bin/bash

test_leak()
{
	valgrind --leak-check=full \
			--log-file=valgrind.txt \
			./"$FUNCT" "$1" 2>&1 >/dev/null
	MEM=$(cat valgrind.txt | grep "All heap blocks were freed -- no leaks are possible")
	if [ "$MEM" = "" ]
	then
		echo -e "\033[0;31m[LEAK]\033[0m"
	else
		echo -e "\033[0;32m[NO_LEAK]\033[0m"
	fi
	rm -f valgrind.txt
}

test_output()
{
	./"$FUNCT" "$1" > "$1".txt
	DIFF=$(diff "$1".txt txt/linkedlist/"$FUNCT"."$1".exp.txt)
	if [ "$DIFF" != "" ]
	then
		echo -e "\033[0;31m[KO]\033[0m"
		echo "--- EXPECTED RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
		cat txt/linkedlist/"$FUNCT"."$1".exp.txt >> diffs/ft_"$FUNCT"."$1".txt
		echo "--- ACTUAL RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
		cat "$1".txt >> diffs/ft_"$FUNCT"."$1".txt
	else
		echo -e "\033[0;32m[OK]\033[0m"
	fi
	rm -f "$1".txt
}

test_input()
{
	ERROR=$( ./"$FUNCT" "$1" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		"$TEST" "$1"
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"

if [ "$2" = "leak" ]
then
	TEST="test_leak"
else
	TEST="test_output"
fi

COMP=$( clang  testers/test_linked_list.c testers/test_"$FUNCT".c \
		-L. -lasm -o "$FUNCT" 2>&1 >/dev/null )
if [ $? = 0 ]
then
	clang -Wall -Werror -Wextra testers/test_linked_list.c \
	testers/test_"$FUNCT".c -L. -lasm -g -o "$FUNCT" 2>&1 >/dev/null
	for i in {0..4}
	do
		test_input $i ${INPUT[i]}
	done
	rm -f "$FUNCT"
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi
