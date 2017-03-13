#!/bin/bash

for i in 1
do
  toEval="cat slim2randomforest.sh | sed 's/__IDX__/$i/g'"
    eval $toEval > TOTAL_"$i".sh
done

#launch scripts

for i in $(ls TOTAL*sh)
do
chmod +x $i
./"$i"
done

