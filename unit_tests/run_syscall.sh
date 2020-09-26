#! /bin/bash

prepare_function()
{
	if [ "$FUNCT" = "read" ]
	then
		echo "testing read function" > read.txt
		echo "testing read function" > ft_read.txt
	fi
}

check_error()
{
	if [ "$FUNCT" = "read" ] && [ $1 = $STD ]
	then
		echo -e "\e[2mtesting stdin\e[0m"
	else
		ERROR_FD=$( ./"$FUNCT" "$1" $IMPLEM ft_"$FUNCT".txt 2>&1 >/dev/null )
	fi
}

make_diff ()
{
	DIFF=$(diff "$2" "$3")
	if [ "$DIFF" != "" ]
	then
		echo -e "\033[0;31m[KO]\033[0m"

		echo "--- EXPECTED RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
		cat a >> diffs/ft_"$FUNCT"."$1".txt
		echo "--- ACTUAL RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
		cat b >> diffs/ft_"$FUNCT"."$1".txt

	else
		echo -e "\033[0;32m[OK]\033[0m"
		rm -f diffs/ft_"$FUNCT"."$1".txt
	fi
}

run_compare()
{
	if [ $? = 0 ]
	then
		./"$FUNCT" "$1" "$ORIG" "$FUNCT".txt > a
		./"$FUNCT" "$1" "$IMPLEM" ft_"$FUNCT".txt > b
		DIFF=$(diff a b)
		if [ "$DIFF" != "" ]
		then
			echo -e "\033[0;31m[KO]\033[0m"
			echo "--- EXPECTED RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
			cat "$FUNCT".txt >> diffs/ft_"$FUNCT"."$1".txt
			echo "" >> diffs/ft_"$FUNCT"."$1".txt
			cat a >> diffs/ft_"$FUNCT"."$1".txt
			echo "--- ACTUAL RESULT ---" >> diffs/ft_"$FUNCT"."$1".txt
			cat ft_"$FUNCT".txt >> diffs/ft_"$FUNCT"."$1".txt
			echo "" >> diffs/ft_"$FUNCT"."$1".txt
			cat b >> diffs/ft_"$FUNCT"."$1".txt
		else
			echo -e "\033[0;32m[OK]\033[0m"
		fi
		rm -rf a b
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

test_input()
{
	prepare_function
	check_error "$1"
	run_compare "$1"
}

STD=0
FD_OPEN=1
FD_WRONG=2

FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"

COMP=$( clang testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT" 2>&1 >/dev/null )
if [ $? = 0 ]
then
	clang -Wall -Werror -Wextra testers/test_"$FUNCT".c -L. -lasm -o "$FUNCT"
	test_input $STD
	test_input $FD_OPEN
	test_input $FD_WRONG
	rm -f "$FUNCT"
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi

rm -f "$FUNCT".txt
rm -f ft_"$FUNCT".txt
