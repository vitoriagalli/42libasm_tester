#! /bin/bash

test_leak()
{
	valgrind --leak-check=full \
			--log-file=valgrind.txt \
			./"$FUNCT" "$IMPLEM" "$2" 2>&1 >/dev/null
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
	./"$FUNCT" $ORIG "$2" > a
	./"$FUNCT" $IMPLEM "$2" > b
	DIFF=$(diff a b)
	if [ "$DIFF" != "" ]
	then
		echo -e "\033[0;31m[KO]\033[0m"
		echo "--- EXPECTED RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
		cat a >> diffs/ft_"$FUNCT"."$1".txt
		echo "--- ACTUAL RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
		cat b >> diffs/ft_"$FUNCT"."$1".txt
	else
		echo -e "\033[0;32m[OK]\033[0m"
	fi
	rm -f a b
}

test_input()
{
	ERROR=$( ./"$FUNCT" $IMPLEM "$2" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		"$TEST" "$1" "$2"
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"

INPUT=(
			"Hello World!"
			"lorem\tipsum\tdolor\nsit\namet\n"
			"testing  functions\0123456789"
			""
			"    "
		)

if [ "$2" = "leak" ]
then
	TEST="test_leak"
else
	TEST="test_output"
fi

COMP=$( clang testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT" 2>&1 >/dev/null )
if [ $? = 0 ]
then
	clang -Wall -Werror -Wextra testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT"
	for i in {0..4}
	do
		test_input $i ${INPUT[i]}
	done
	rm -f "$FUNCT"
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi
