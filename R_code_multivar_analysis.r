Make use of the lab folder
setwd("C:/lab/")

Install the package
install.packages("vegan")

Recall the dataset we are going to use
library(vegan)

Import the plots into R
First give a name to the dataset we are going to use
biomes

Assign this name to a certain function
<-

To import table from the outside of R
read.table

We have a heading. Each column had a heading. The header is true
head=T

The comma is the separator  of each plot. Telling R "if you see  comma = new column"
sep=","

Read the table biomes
biomes<-read.table("biomes.csv", head=T,sep=",")

Take a look at the head of the dataset biomes
The name of the objects
head(biomes)

See how the species are related - Make the multivariate analysis

We have several dimensions. But we will see the data in 2 dimensions only
We are going to take a look at our 20 dimensions, but just into 2 dimensions.

We are going to make use of DEtrended CORrespondence ANAlysis
Give it a name
multivar

Assign this name to a certain function
<-

Make the 
decorana

And use the dataset 
biomes

multivar<-decorana(biomes)

Plot the final result/plot the graph
plot(multivar)

How to make the numbers/letters larger in the graph
Indicate how big the numbers/letters should be from original
cex=1 (original) cex=1.2 (20% larger)
plot(multivar,cex=1.2)

Now we can see all the 20 dimensions (20 species) into 2 dimensions
What can we read from the graph?
A plot of all species
How the species are correlated to each other
Species that are more functionally related are closer to each other. Their coordinate is closer

How much are we seeing of the real dataset?
Go to the code.
Put the name of the analysis
multivar

Eigenvalues - the amount of perception you can have of the old system
Originally 20 different dimensions
Reducing everything into 2 dimensions (x-axis, y-axis)
The amount of the perception we are seeing
Subtract the % from column 1 + 2
82% 

The closer each species are to each other in the graph, the more related they are

What are the points?
They are the different plots
How the different plots are scattered into 2 dimensions

Use an additional table in lab folder. The second one we downloaded from iol
called: biomes types

Link each plot to each other
See how they are linked into the multivariate graph.

plot(multivar)

Read the biomes types table  (same as we did with biomes)
biomes_types <-read.table("biomes_types.csv",header=T,sep=",")

Link one point to each other. See if the different biomes can be seen into our graph
A function to do so is:

attach this dataset
attach(biomes_types)

Make use of the funtion. Connacting all the ellipse from the multivar
multivar

Declare  which column to use

We have four different biomes. So we are going to use four different colors
col=1:4 or col=c("green","blue","red","black")

The dimension of the line we are going to use. The line width is 3 times larger than original
lwd=3

ordiellipse(multivar,type,col=1:4,kind="ehull",lwd=3)

Colors: the four different biomes
The biomes that are coming out from.
All species inside and a bit outside of the ellipse are species from a specific biome
Green ellipse: tropical forest. 
Red ellipse: broad leaf forest/temperate forest
Blue ellipse: tundra
Black ellipse: coniferous forest

ordispider - "the spider house"
Put each name of the biomes by using
label=T
ordispider(multivar,type,col=1:4,label=T)
