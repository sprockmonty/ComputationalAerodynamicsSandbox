#!/bin/sh
    # ratio: 2

function convergeOnRation(){
    #arg 1 is ratio
    #arg 2 is last number of chord elements
    #arg 3 is filename to save as
    ratio=${1}
    for j in $(seq 1 ${2})
    do
        span=$((ratio*j))
        cat RAE_wingAWingAutomate.txt | sed -e "s/chordToChange/${j}/g" | sed -e "s/spanToChange/${span}/g" > "tempFiles/tempAVLWing.txt"
        avl < avl_instruct.txt
        cl=$(sed -n '16,16 p' tempFiles/result.dmp | cut -d "=" -f2) 
        echo "${j} ${span} ${cl}">> "results/${3}"
    done
}


