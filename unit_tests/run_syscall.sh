#! /bin/bash

make_diff ()
{
	diff "$2" "$3" > diffs/ft_"$FUNCT"."$1".txt
	DIFF=$(diff a b)
	if [ "$DIFF" != "" ]
	then
		echo -e "\033[0;31m[KO]\033[0m"
	else
		echo -e "\033[0;32m[OK]\033[0m"
		rm -rf diffs/ft_"$FUNCT"."$1".txt
	fi
}

test_std()
{
	./"$FUNCT"_std $ORIG > a
	./"$FUNCT"_std $IMPLEM > b
	make_diff "$1" a b
	rm -rf a b
}

test_fd()
{
	if [ "$FUNCT" == "read" ]
	then
		echo "testing read function" > read.txt
		echo "testing read function" > ft_read.txt
	fi
	./"$FUNCT"_fd "$2" $ORIG "$FUNCT".txt > a
	./"$FUNCT"_fd "$2" $IMPLEM ft_"$FUNCT".txt > b
	make_diff "$1" "$FUNCT".txt ft_"$FUNCT".txt
	make_diff "$1" a b
	rm -rf a b
	rm -rf "$FUNCT".txt ft_"$FUNCT".txt
}

FD_OPEN=0
FD_WRONG=1
FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"

clang testers/test_"$FUNCT"_std.c -L../ -lasm -o "$FUNCT"_std
clang testers/test_"$FUNCT"_fd.c -L../ -lasm -o "$FUNCT"_fd

test_std 1
test_fd 2 $FD_OPEN
test_fd 3 $FD_WRONG

rm -rf "$FUNCT"_std "$FUNCT"_fd
