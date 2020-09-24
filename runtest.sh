#! /bin/bash

function echo_title()
{
	echo -e ""
	echo -e ""
	echo -e "\033[0;96m ██╗     ██╗██████╗  █████╗ ███████╗███╗   ███╗ \033[0m"
	echo -e "\033[0;96m ██║     ██║██╔══██╗██╔══██╗██╔════╝████╗ ████║ \033[0m"
	echo -e "\033[0;96m ██║     ██║██████╔╝███████║███████╗██╔████╔██║ \033[0m"
	echo -e "\033[0;96m ██║     ██║██╔══██╗██╔══██║╚════██║██║╚██╔╝██║ \033[0m"
	echo -e "\033[0;96m ███████╗██║██████╔╝██║  ██║███████║██║ ╚═╝ ██║ \033[0m"
	echo -e "\033[0;96m ╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ \033[0m"
	echo -e "\033[0;96m                          ┌┬┐┌─┐┌─┐┌┬┐┌─┐┬─┐ \033[0m"
	echo -e "\033[0;96m   by vscabell             │ ├┤ └─┐ │ ├┤ ├┬┘ \033[0m"
	echo -e "\033[0;96m                           ┴ └─┘└─┘ ┴ └─┘┴└─ \033[0m"
}

function echo_subtitle_bonus()
{
	echo -e "\033[0;96m +-+-+-+-+-+ \033[0m"
	echo -e "\033[0;96m |B|O|N|U|S| \033[0m"
	echo -e "\033[0;96m +-+-+-+-+-+ \033[0m"
}

function run_each_mandatory_function()
{
	for var in $@
	do
		if [ "$var" == "strlen" ] ||
			[ "$var" == "strcpy" ] ||
			[ "$var" == "strcmp" ] ||
			[ "$var" == "strdup" ]
		then
			bash run_stdfunct.sh "$var"
		elif [ "$var" == "read" ] ||
				[ "$var" == "write" ]
		then
			bash run_syscall.sh "$var"
		fi
	done
}

function run_each_bonus_function()
{
	for var in $@
	do
		if [ "$var" == "atoi_base" ]
		then
			bash run_atoi_base.sh
		elif [ "$var" == "list_push_front" ] ||
				[ "$var" == "list_size" ] ||
				[ "$var" == "list_sort" ] ||
				[ "$var" == "list_remove_if" ]
		then
			bash run_linked_list.sh "$var"
		fi
	done
}

function run_valgrind()
{
	bash run_stdfunct.sh strdup leak
}

function run_valgrind_bonus()
{
	bash run_linked_list.sh list_push_front leak
	bash run_linked_list.sh list_sort leak
	bash run_linked_list.sh list_remove_if leak
}

function run_bonus()
{
	cd ../
	make bonus
	mv libasm.a $filepath/unit_tests/
	cd $filepath/unit_tests/
	echo_title
	echo_subtitle_bonus
	if [ "$2" == "" ]
	then
		run_each_bonus_function atoi_base \
								list_push_front \
								list_size list_sort \
								list_remove_if
	elif [ "$2" == "leak" ]
	then
		run_valgrind_bonus
	else
		run_each_bonus_function $@
	fi
}

function run_mandatory()
{
	cd ../
	make re
	mv libasm.a $filepath/unit_tests/
	cd $filepath/unit_tests/
	echo_title
	if [ "$1" == "" ]
	then
		run_each_mandatory_function strlen \
									strcpy \
									strcmp \
									write \
									read \
									strdup
	elif [ "$1" == "leak" ]
	then
		run_valgrind
	else
		run_each_mandatory_function $@
	fi
}

declare -x ORIG=0
declare -x IMPLEM=1
filepath=`pwd`

rm -rf unit_tests/diffs
mkdir unit_tests/diffs

if [ "$1" == "bonus" ]
then
	run_bonus $@
else
	run_mandatory $@
fi
