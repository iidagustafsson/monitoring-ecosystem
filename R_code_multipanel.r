### Multipanel in R - second lecture 

using quotas because we are moving files into R. We installed it last time.
install.packages("sp") 

Install this package
install.packages("GGally")

We installed this last time. Now we want to ask R to make use of it. Therefore, use the library or requrire
library(sp) or require(sp) 

Now we are going to make use of the data set. Now we have explained for the computer that there is a dataset called meuse
data(meuse)

Make use of the dataset for 
attach(meuse)

How to see the names of the data set. There are two different ways
names(meuse)  or head(meuse)

How to make a graph of the two variables cadmium and zinc
plot(cadmium,zinc)

How to change the plot markers
pch=15

How to change the color till blue
col="blue"

Make all the possible paiwis plots of the dataset. Paring all the data. 
We plotted several graphs together.
pairs(meuse)

In case you receive the error "the size is too large, reshape the graph-window)
Re-run the code again

How to modify the graphs - lower number of variables, makes it more readable = less small graphs
using grouping character. grouping all these variables together. switching to 4 variabilities
pairs(~cadmium+copper+lead+zinc,data=meuse)

We have taken the data from the dataset. 
The 4th variables correlated to each other in the first 6 rows. Make subset [. 
comma is separation = start from. state the number of the column until which column
pairs(meuse[,3:6])

Prettify this graph = change color, point marker and the dimension
pairs(meuse[,3:6],pch=23,col="purple")

How to do a beautiful scatterplot. 
Install an additional package = > put it in the beginning. Must use capital letter
install.packages("GGally") 

This is used for the function ggpairs()
We have to recall this function by the library. No comma because already installed in R.
library(GGally)

ggpairs will do a pair by the GGally. To make the graphs more *pretty*
ggpairs(meuse[,3:6])
