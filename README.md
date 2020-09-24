# 42libasm_tester

## Introduction

This is a simple shell script that automate tests for the 42 Project Libasm/2020.

* check compilation error
* check the function output
* check the return value
* check the errno value for functions with system calls
* check memory leak when necessary

## Usage
:warning: Running on VM 42 Linux only

#### Prerequisites

[GNU Make](https://www.gnu.org/software/make/)\
[NASM Compiler](https://www.nasm.us)\
[Valgrind](https://www.valgrind.org/)

#### Build Instructions

Clone this repo into libasm root's directory.\
Make sure your Makefile has the `make re` rule, and `make bonus` rule if you want to test the bonus functions.\
Both adding the objects to the `libasm.a` library.

```bash
$ git clone https://github.com/vscabell/42libasm_tester.git
$ cd 42libasm_tester
$ bash runtest.sh
$ bash runtest.sh bonus
```

Add successively the functions in the order you want, for example
```bash
$ bash runtest.sh write
$ bash runtest.sh strlen strdup
$ bash runtest.sh bonus atoi_base
```

Check if any memory leak was detected
```bash
$ bash runtest.sh leak
$ bash runtest.sh bonus leak
```

Take a look at `/42libasm_tester/unit_tests/diffs` directory for diffs files

\
Some of the outputs examples

![outputs](https://user-images.githubusercontent.com/56961723/94193242-7fb71880-fe86-11ea-96e4-ef66e5387d38.png)

:warning: &nbsp;&nbsp;&nbsp;not official tests&nbsp;&nbsp;&nbsp;:warning:\
:warning: still has lots of bugs:warning:
