# slim2randomforest

Slim2randomforest is a simple workflow for simulating .vcf datasets with SliM, control for population structure with Admixture and search for polygenic selection with a random forest approach

## WARNING

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

## install SLiM

Download [SLiM](https://messerlab.org/slim/) source code

```
unzip SLiM.zip
cd SLiM
make
```
## install admixture

Download [admixture](https://www.genetics.ucla.edu/software/admixture/download.html) source code

```
tar -xvf *.tar.gz
```

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

First argument is the number of iterations

## R dependencies

## Contributions
Martin Laporte, PhD

