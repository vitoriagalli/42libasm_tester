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
	if [ "$FUNCT" == "write" ]
	then
		ERROR_STD=$( ./"$FUNCT"_std $IMPLEM 2>&1 >/dev/null )
	fi
	if [ $? = 0 ]
	then
		./"$FUNCT"_std $ORIG > a
		./"$FUNCT"_std $IMPLEM > b
		make_diff "$1" a b
		rm -rf a b
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
}

test_fd()
{
	if [ "$FUNCT" == "read" ]
	then
		echo "testing read function" > read.txt
		echo "testing read function" > ft_read.txt
	fi
	ERROR_FD=$( ./"$FUNCT"_fd "$2" $IMPLEM ft_"$FUNCT".txt 2>&1 >/dev/null )
	if [ $? = 0 ]
	then
		./"$FUNCT"_fd "$2" $ORIG "$FUNCT".txt > a
		./"$FUNCT"_fd "$2" $IMPLEM ft_"$FUNCT".txt > b
		make_diff "$1" "$FUNCT".txt ft_"$FUNCT".txt
		make_diff "$1" a b
		rm -rf a b
		rm -rf "$FUNCT".txt ft_"$FUNCT".txt
	else
		echo -e "\033[0;31m[ERROR]\033[0m"
	fi
	[ -f read.txt ] && rm read.txt
	[ -f ft_read.txt ] && rm ft_read.txt
}

FD_OPEN=0
FD_WRONG=1
FUNCT=$1
echo -e ""
echo -e "\033[0;1m> ft_"$FUNCT"\033[0m"
COMP=$( clang testers/test_"$FUNCT"_fd.c -L. -lasm -o "$FUNCT"_fd 2>&1 >/dev/null )
if [ $? = 0 ]
then
	clang testers/test_"$FUNCT"_std.c -L. -lasm -o "$FUNCT"_std
	clang testers/test_"$FUNCT"_fd.c -L. -lasm -o "$FUNCT"_fd
	test_std 1
	test_fd 2 $FD_OPEN
	test_fd 3 $FD_WRONG
	rm -rf "$FUNCT"_std "$FUNCT"_fd
else
	echo -e "\033[0;31m[DONT COMPILE]\033[0m"
fi
