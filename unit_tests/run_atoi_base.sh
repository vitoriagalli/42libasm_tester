#! /bin/bash

test_input()
{
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
	rm -rf "$1".txt "$1".exp.txt
}

echo "56" > 1.exp.txt
echo "-255" > 2.exp.txt
echo "-42" > 3.exp.txt
echo "29" > 4.exp.txt
echo "-501" > 5.exp.txt
echo "105" > 6.exp.txt
echo "-3" > 7.exp.txt
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
echo "0" > 19.exp.txt

echo -e ""
echo -e "\033[0;1m> ft_atoi_base\033[0m"

clang testers/test_atoi_base.c -L. -lasm -o atoi_base

for i in {1..19}
do
	test_input $i
done

rm -rf atoi_base

