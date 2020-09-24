#! /bin/bash

initialize_expected_results ()
{
	echo "56" > 0.exp.txt
	echo "-255" > 1.exp.txt
	echo "-42" > 2.exp.txt
	echo "29" > 3.exp.txt
	echo "-501" > 4.exp.txt
	echo "105" > 5.exp.txt
	echo "-3" > 6.exp.txt
	echo "0" > 7.exp.txt
	echo "0" > 8.exp.txt
	echo "0" > 9.exp.txt
	echo "0" > 10.exp.txt
	echo "0" > 11.exp.txt
	echo "0" > 12.exp.txt
	echo "0" > 13.exp.txt
	echo "0" > 14.exp.txt
	echo "0" > 15.exp.txt
	echo "0" > 16.exp.txt
	echo "0" > 17.exp.txt
	echo "0" > 18.exp.txt
}

test_input()
{
	ERROR=$( ./atoi_base "$1" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		./atoi_base "$1" > "$1".txt
		diff "$1".txt "$1".exp.txt > diffs/atoi_base."$1".txt
		DIFF=$(diff "$1".txt "$1".exp.txt)
		if [ "$DIFF" != "" ]
		then
			echo -e "\033[0;31m[KO]\033[0m"
		else
			echo -e "\033[0;32m[OK]\033[0m"
			rm -rf diffs/atoi_base."$1".txt
		fi
		rm -f "$1".txt "$1".exp.txt
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

echo -e ""
echo -e "\033[0;1m> ft_atoi_base\033[0m"
COMP=$( clang testers/test_atoi_base.c -L. -lasm -o atoi_base 2>&1 >/dev/null )
if [ $? = 0 ]
then
	initialize_expected_results
	clang -Wall -Werror -Wextra testers/test_atoi_base.c -L. -lasm -o atoi_base
	for i in {0..18}
	do
		test_input $i
	done
	rm -f atoi_base
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi

rm -f *.exp.txt
