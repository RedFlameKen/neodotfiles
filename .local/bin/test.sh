#!/bin/bash

findCommand="find -L /home/kenneth/school -mindepth 1 -type f "

excludeList="
.classpath
.project
*.class
"

result=$($findCommand $($excludeList | sed 's/^\(.*\)/\!\ -iname\ \"\1\" /')  | fzf)

echo $result
