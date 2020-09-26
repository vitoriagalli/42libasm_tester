#! /bin/bash

test_input()
{
	ERROR=$( ./atoi_base "$1" 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		./atoi_base "$1" > "$1".txt
		DIFF=$(diff "$1".txt txt/atoibase/"$1".exp.txt)
		if [ "$DIFF" != "" ]
		then
			echo -e "\033[0;31m[KO]\033[0m"
			echo "--- EXPECTED RESULT ---" >> diffs/atoi_base."$1".txt
			cat txt/atoibase/"$1".exp.txt >> diffs/atoi_base."$1".txt
			echo "--- ACTUAL RESULT ---" >> diffs/atoi_base."$1".txt
			cat "$1".txt >> diffs/atoi_base."$1".txt
		else
			echo -e "\033[0;32m[OK]\033[0m"
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
