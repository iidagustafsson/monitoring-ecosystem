Fist we will install the package by using the function: install.packages()
State to R which package to install: sp
Use " " since we are going outside of R
install.packages("sp")

Then we need to tell R we are going to make use of the package
By recalling the package we use the function: library()
library(sp)

To load the dataset inside the package into the workspace
Make use of function: data()
State to R which dataset we want to load: meuse
data(meuse)

Let us see how the meuse dataset is structured
By simply typing: 
meuse

Let us look at the first 6 rows of the dataset by using function: head()
State to R which dataset you want to see the 6 rows of: meuse
head(meuse)

Let us plot two variables 
Let us see if the zinc concentration is related to that of copper
First attach the dataset, in order so we can now start with the plotting
attach(meuse)
(can also google: R software plot function (to see all different plot functions available) (x-axis,y-axis))

The first variable will be on x-axis and the second variable will be on y-axis
To plot the dataset make use of the function: plot()
State to R which variable should be on x-axis and which to be on y-axis: zinc, copper
plot(zinc,copper)

To change the color of the datapoints in the graph 
Make use of the function: col=
There is a need for " " because colors are numbers in R 
But by using " " we can write the name of the color we want to use
plot(zinc,copper,col="blue") 

To change the symbols in the graph - point character
Make use of the function: pch=
Google to see different point characters and their corresponding numbers
Here we make us of the point character equals to 19
plot(zinc,copper,col="blue",pch=19) 

To make larger point characters in the graph
Make use of the character exaggeration function: cex=
To make larger point characters: >1
To make a smaller point characters: 0-1 
We want to make the point characters twice the original size
plot(zinc,copper,col="blue",pch=19,cex=2)
