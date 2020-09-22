#! /bin/bash

declare -x ORIG=0
declare -x IMPLEM=1
filepath=`pwd`

rm -rf unit_tests/diffs
mkdir unit_tests/diffs

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
		bash run_atoi_base.sh
		bash run_linked_list.sh
	else
		for var in $@
		do
			if [ "$var" == "atoi_base" ]
			then
				bash run_atoi_base.sh
			elif [ "$var" == "list_push_front" ] ||[ "$var" == "list_size" ] ||
				[ "$var" == "list_sort" ] || [ "$var" == "list_remove_if" ]
			then
				bash run_linked_list.sh "$var"
			fi
		done
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
		bash run_stdfunct.sh strlen
		bash run_stdfunct.sh strcpy
		bash run_stdfunct.sh strcmp
		bash run_stdfunct.sh strdup
		bash run_syscall.sh read
		bash run_syscall.sh write
	else
		for var in $@
		do
			if [ "$var" == "strlen" ] ||[ "$var" == "strcpy" ] ||
				[ "$var" == "strcmp" ] || [ "$var" == "strdup" ]
			then
				bash run_stdfunct.sh "$var"
			elif [ "$var" == "read" ] || [ "$var" == "write" ]
			then
				bash run_syscall.sh "$var"
			fi
		done
	fi
}

if [ "$1" == "bonus" ]
then
	run_bonus $@
else
	run_mandatory $@
fi
