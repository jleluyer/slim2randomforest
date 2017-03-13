# slim2randomforest


## install SLiM

Download [SLiM](https://messerlab.org/slim/) source code

```
unzip SLiM.zip
cd SLiM
make
```
## install admixture

Download [admixture](https://www.genetics.ucla.edu/software/admixture/download.html) source code

## SLim to Random Forest

### Prepare strata file

```
INDIVIDUALS STRATA
i0  Cond1
i1  Cond1
i2  Cond2
i3  Cond2
```

### launch script
```
00_scripts/launch_slim.sh 1
```

## R dependencies

