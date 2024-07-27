#!/bin/bash

workspaceSize="$(hyprctl workspaces | grep "on monitor" | tail -1 | awk -F '[()]' '{print $2}')"

finalWorkspaceSize=0
declare -a workspacesArr

assign(){
    i=1
    endcon=""
    wsnumber=$(hyprctl workspaces | grep "on monitor" | awk -F '[()]' '{print $2}' | head -n +$i | tail -1)
    while true;
    do
	wsnumber=$(hyprctl workspaces | grep "on monitor" | awk -F '[()]' '{print $2}' | head -n +$i | tail -1)
	if [ "$endcon" == "$wsnumber" ]
	then
	    break
	fi
	workspacesArr[$i]=$wsnumber
	endcon=$wsnumber
	i=$((i + 1))
    done
}

findHighest(){
    highest=0
    len=$(( ${#workspacesArr[@]} + 1 ))
    i=1
    while [ $i -lt $len ]
    do
	if [[ ${workspacesArr[$i]} -gt $highest ]]
	then

	    highest=${workspacesArr[$i]}
	fi
	i=$((i + 1))
    done

    finalWorkspaceSize=$highest
}
assign
findHighest

exit $finalWorkspaceSize
