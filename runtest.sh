#! /bin/bash

declare -x ORIG=0
declare -x IMPLEM=1

rm -rf unit_tests/diffs
mkdir unit_tests/diffs
echo -e "---------------------------------"
echo -e "|       \033[0;1m LIBASM UNIT TEST\033[0m       |"
echo -e "---------------------------------"

function run_bonus()
{
	make bonus
	cd unit_tests
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
	make re
	cd unit_tests
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
