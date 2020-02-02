#!/bin/sh
    # ratio: 2

    #arg 1 is ratio
    #arg 2 is last number of chord elements
    #arg 3 is filename to save as
    for j in $(seq 0 0.01 8)
    do
        cat  avl_instruct_ldmax.txt | sed -e "s/alfa/${j}/g"  > "tempFiles/tempAvl_instruct_ldmax.txt"
        avl < "tempFiles/tempAvl_instruct_ldmax.txt"
        clff=$(sed -n '27,27 p' tempFiles/forceResult.dmp | cut -c 13-19) 
        cdtot=$(sed -n '25,25 p' tempFiles/forceResult.dmp | cut -c 13-19) 
        echo "${j} ${cdtot} ${clff} ">> "results/ldmax.txt"
    done

