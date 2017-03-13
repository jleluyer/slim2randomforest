#!/bin/bash

#prepare indivduals list
awk '{print $1}' 01_info_file/strata.txt|grep -v 'INDIV' >01_info_file/individuals.list.txt

#launch loop
for i in 100
do
  toEval="cat 00_scripts/slim2randomforest.sh | sed 's/__IDX__/$i/g'"
    eval $toEval > TOTAL_"$i".sh
done

#launch scripts

for i in $(ls TOTAL*sh)
do
chmod +x $i
msub "$i"
done

