#!/usr/bin/env bash

echo My name: $0
my_path=$(pwd)
echo My path: ${my_path}

my_directory=$(basename $(pwd))
echo My directory: ${my_directory}

echo My arguments: $@
echo Number of arguments: $#
echo My first argument: $1
echo "My last argument: ${@: -1}"
echo 'Last command: echo My last argument: ${@: -1}'

for v in item1 item2 item3 ; do
    echo Loop element: $v
done

for i in {8..10} ; do
    echo Teller: $i
done

for f in $(ls |grep s) ; do
    echo Filename with s in it: $f
done


text_for_demo='This is a text with email: ann@company.com'
echo "Full text  : ${text_for_demo}"
echo "Up to email: ${text_for_demo% email*}"
echo "The email  : ${text_for_demo#*email}"
echo "And again using sed:"
echo $text_for_demo | sed 's/.*email//'
echo $text_for_demo | sed 's///'

trap catch_ctrl_c INT
function catch_ctrl_c() {
    echo
    echo 'Caught CTRL+c, exit 0'
    exit 0
}
echo -n 'dots, abort with CTRL+c:'
while sleep 0.01 ; do
    echo -n '.'
done
echo
