Make use of the lab folder
Set my working directory
setwd("C:/lab/")

Go to iol site and download the data called
biomes.csv
biomes_types.csv

Install the package
install.packages("vegan")

Recall the package we are going to use
library(vegan)

Import the plots into R
First give a name to the dataset we are going to use
biomes

Assign this name to a certain function
<-

To import table from the outside of R
read.table

Tell which data R should read: biomes.csv
Make use of “ “ since we are going outside of R (into lab folder)

We have a heading. Each column has a heading. The header equals to true = T
head=T

The comma is the separator of each plot. Telling R "if you see comma = new column"
sep=","

Read the table biomes
biomes<-read.table("biomes.csv", head=T,sep=",")

Take a look at the head of the dataset biomes
The name of the objects
head(biomes)

See how the species are related - Make the multivariate analysis

We have several dimensions. But we will see the data in 2 dimensions only
We are going to take a look at our 20 dimensions (species), but just into 2 dimensions.

We are going to make use of the function called: DEtrended CORrespondence ANAlysis
Give it a name
multivar

Assign this name to the certain function
<-

Make the 
decorana

And use the dataset 
biomes

multivar<-decorana(biomes)

Plot the final result/plot the graph
plot(multivar)

How to make the numbers/letters larger in the graph: cex=
Indicate how big the numbers/letters should be from original
We want them 20% larger than default: cex=1.2
plot(multivar,cex=1.2)

Now we can see all the 20 dimensions (20 species) into 2 dimensions
What can we read from the graph?
A plot of all species
How the species are correlated to each other
Species that are more functionally related are closer to each other. Their coordinates are closer
The closer each species are to each other in the graph, the more related they are

How much are we seeing of the real dataset?
Put the name of the analysis to see the information of it
multivar

Eigenvalues - the amount of perception you can have of the old system
Originally 20 different dimensions
Reducing everything into 2 dimensions (x-axis, y-axis)
The amount of the perception we are seeing
Add the % from column 1 + 2
Around 82% 

What are the points?
They are the different species
How the different plots are scattered into 2 dimensions

Now we are going to make use of the other data we downloaded from iol: biomed_types.csv
We will link each plot to each other
See how they are linked into the multivariate graph

First plot multivar and have a look at it
plot(multivar)

Read the biomes_types table (same procedure as we did with biomes)
biomes_types <-read.table("biomes_types.csv",header=T,sep=",")

Link one point to each other. See if the different biomes can be seen into our graph
First attach this dataset: attach()
State which dataset to attach: biomes_types
attach(biomes_types)

Connecting all the ellipse from the multivar, by making use of the function: ordeiellipse()
Ordeiellipse draws lines, points or ellipses by each group
State which dataset to use: multivar
We have four different biomes. So, we are going to use four different colors for each biome
col=1:4 or col=c("green","blue","red","black")
We want to draw ellipses by each group (biome): kind=”ehull”
We want to change the dimension of the line in the graph: lwd=
We want the with a width 3 times thicker than original: 3
lwd=3
ordiellipse(multivar,type,col=1:4,kind="ehull",lwd=3)

The colors represent the four different biomes
The biomes that are coming out from the dataset
All species inside and a bit outside of the ellipse are species from a specific biome
Green ellipse: tropical forest. 
Red ellipse: broad leaf forest/temperate forest
Blue ellipse: tundra
Black ellipse: coniferous forest

Now we want to put the name of each biome in the plotted graph
Make use of the function: ordispider()     “the spider house"
State which data to use and colors to use
Put each name of the biomes by using: label=T
ordispider(multivar,type,col=1:4,label=T)
