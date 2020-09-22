# 42libasm_tester

## Introduction

This is a simple shell script that automate tests for the 42 Project Libasm/2020.

* check compilation error
* check the function output
* check the return value
* check the errno value for functions with system calls
* check STDIN and file descriptor for read function
* check STDOUT and file descriptor for write function

Running on Linux

## Usage

#### Prerequisites

[GNU Make](https://www.gnu.org/software/make/)\
[NASM Compiler](https://www.nasm.us)

#### Build Instructions

Clone this repo into libasm root's directory.\
Make sure your Makefile has the `make` rule, and `make bonus` rule if you want to test the bonus functions.

```bash
$ git clone https://github.com/vscabell/42libasm_tester.git
$ cd 42libasm_tester
$ bash runtest.sh
$ bash runtest.sh bonus
```

Add successively the functions in the order you want, for example :

```bash
$ bash runtest.sh read
$ bash runtest.sh strlen strdup
$ bash runtest.sh bonus atoi_base
```

Take a look at `/42libasm_tester/unit_tests/diffs` directory for diffs files

\
Some of the outputs examples

![test](https://user-images.githubusercontent.com/56961723/93936914-40a98b80-fcfd-11ea-9066-5f5e90b19e82.png)

:warning: &nbsp;&nbsp;&nbsp;not official tests&nbsp;&nbsp;&nbsp;:warning:\
:warning: still has lots of bugs:warning:
