#!/bin/bash

# Script will Search String on file1 from file2

file1=text       # Here My Searching Text
file2=messages   # Here My Where To Search File
numbers=0
details=0

if [ "$1" == '-n' ] || [ "$2" == '-n' ]
then
        numbers=1
fi

if [ "$1" == '-d' ] || [ "$2" == '-d' ]
then
        details=1
fi
file1=`cat $file1`
oneline=`cat $file2 | grep "$file1" | wc -l`

if [ $oneline -gt 0 ]
then
        if [ $numbers -ne 0 ]
        then

                line_num=`cat $file2 | awk "/$file1/"' {print NR}'`

                echo $line_num
        fi

        if [ $details -ne 0 ]
        then
                cat $file2 | awk "/$file1/"' {print "Line " NR ": "$0}'
        fi

        echo "[+] Total $oneline Strings Found"
else
        echo "[+] Not Found The String"
fi

