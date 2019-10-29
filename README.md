# MutPlot

Makes a gene and sample level plot for mutation data

### Disclaimer
This is an alpha stage software. Please let me know if you like it/hate it/find bugs/have suggestions

## Installation

MutPlot was written in R 3.6.1 I've not tested it on earlier versions.

### Dependancies

It'll load/install:
 * ggplot2 - for the plotting
 * magrittr - so I can use pipe for nicer looking code
 * ggpubr - as_ggplot function for legend wrangling
 * plyr - for ddply
 * patchwork - a neat little graph combining too, you may need to install this from github, not 100% (see below)
 
 
### Get the package

As we're on github you'll need "install_github" from devtools.

```R
## If you don't already have devtools installed
BiocManager::install("devtools")
```
You'll probably need to install patchwork from github too for plot stitching. This can be done as follows:

```R
library(devtools)
install_github("thomasp85/patchwork")
```

To install the package just use this:

```R
library(devtools)
install_github("findlaycopley/MutPlot")
```
This should give you access to the package.

## Input

You need to input a dataframe containing all the variant positions in long format.

It needs the following xx columns:

**Sample**

* (string) the sample that the variant exists in.

**Gene**

* (string) the gene that the variant is in.

**Info**

* (string) information about the type of variant (e.g. missense, frameshift etc ...) 

The names of these columns can be whatever you want and they're passed to the function as you call it, i.e.:

```R
mutationPlot(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info")
## OR
prepareMutData(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info")
```

## Examples
##TODO change the way you access this data

There is a dataframe included called Data that includes a small mock up for testing the package.

The pipeline is run as follows:
```R
## Build an object of the MutationPlot class from the data.
MutationPlot <- prepareMutData(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info")
## Plots a waterfall plot of gene vs sample. 
## Tiles are coloured by the number of mutations in that sample/gene
MutationPlot <- plotWaterfall(MutationPlot)
## Plots a bar graph of the number of mutations per gene, bars coloured by mutation info
MutationPlot <- plotGeneCount(MutationPlot)
## Plots a bar graph of the number of mutations per sample, bars coloured by mutation info
MutationPlot <- plotSampleCount(MutationPlot)
## Pulls the legend for the waterfall and bar plots and creates new plots.
MutationPlot <- plotLegend(MutationPlot)
## Combines the plots with the patchwork package.
MutationPlot <- ComboMutPlot(MutationPlot)
```

This will return a plot that looks like this (generated using the example data):

![plot example](https://github.com/findlaycopley/MutPlot/blob/master/testData.png)

The whole pipeline can be run in one line with the following function:

```R
mutationPlot(Data, SampleCol="Sample", GeneCol="Gene", InfoCol="Info")
```
