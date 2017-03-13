#!/bin/bash

NUMBER=__IDX__
# launch slim file
  toEval="cat script_slim_template.sh | sed 's/__NB__/$NUMBER/g'"
   eval $toEval > SLIM_"$NUMBER".sh

# launch slim
slim SLIM_"$NUMBER".sh

# launch admixture
inputvcf="$(echo test.slim."$NUMBER".vcf|sed 's/.vcf//g')"

plink --vcf "$inputvcf".vcf --recode --out "$inputvcf".impute --double-id --allow-extra-chr --chr-set 55
plink --file "$inputvcf".impute --make-bed --out "$inputvcf".impute --allow-extra-chr --chr-set 55
admixture "$inputvcf".impute.bed 2

#prepare matrix
cut -f 1 test.slim."$NUMBER".impute.2.Q >admixture."$NUMBER".txt
paste individuals.list.txt admixture."$NUMBER".txt >matrix.admixture."$NUMBER".txt

#prepare genetic matrix
grep -v '#' test.slim."$NUMBER".vcf|cut -f -2,10-|sed -e 's/0|0/0/g' -e 's/1|0/1/g' -e 's/0|1/1/g' -e 's/1|1/2/g'|awk '{print $1"_"$2,$0}'|cut -f 1 >loci.matrix."$NUMBER".txt
grep -v '#' test.slim."$NUMBER".vcf|cut -f -2,10-|sed -e 's/0|0/0/g' -e 's/1|0/1/g' -e 's/0|1/1/g' -e 's/1|1/2/g'|awk '{print $1"_"$2,$0}'|cut -f 3- >TEMP.matrix."$NUMBER".txt

grep 'CHR' test.slim.1.vcf|cut -f 10- >header."$NUMBER".txt
cat header."$NUMBER".txt TEMP.matrix."$NUMBER".txt >matrix_genetic."$NUMBER".txt

rm TEMP.matrix."$NUMBER".txt


#launch RF
toEval="cat script_rf_template.R | sed 's/__NB__/$NUMBER/g'"
   eval $toEval > RANDFOR_"$NUMBER".R

Rscript RANDFOR_"$NUMBER".R



