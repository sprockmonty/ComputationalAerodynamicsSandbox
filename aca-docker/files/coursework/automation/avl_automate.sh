#!/bin/sh
    # ratio: 2

convergeOnRatio(){
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
        cd=$(sed -n '27,27 p' tempFiles/forceResult.dmp | cut -c 33-41) 
        echo "${j} ${span} ${cl} ${cd}">> "results/${3}"
    done
}

convergeOnRatio 2 24 "ratio2.txt"
convergeOnRatio 3 18 "ratio3.txt"
convergeOnRatio 4 13 "ratio4.txt"
convergeOnRatio 5 9 "ratio5.txt"
convergeOnRatio 6 7 "ratio6.txt"
convergeOnRatio 7 10 "ratio7.txt"
convergeOnRatio 8 5 "ratio8.txt"
convergeOnRatio 9 8 "ratio9.txt"
convergeOnRatio 10 5 "ratio10.txt"
