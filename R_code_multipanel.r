### Multipanel in R - second lecture 

We installed the package sp last time
Now we want to ask R to make use of it 
Therefore use the function: library() or require()
State to R wich package to recall: sp
No need for " " since we already installed it
library(sp) 

Now we are going to make use of the dataset in the package sp
Explain for R we are going to make us of it, by using the function: data()
State to R which dataset in the package we want to use: meuse
data(meuse)

Make use of the dataset by using the function: attach()
Now we can simply access the datasets by calling their names
State to R which dataset in the package we want to access easily: meuse
attach(meuse)

How to see the names of the data set
There are two different ways:
names(meuse)  or head(meuse)

In the dataset we can see different variables, eg cadmium, copper, lead, zinc etc
How to plot a graph of two variables: cadmium and zinc
plot(cadmium,zinc)

How to change the plot characters: pch=
We will make use of the characters corresponding to number 15
pch=15

How to change the color of the point characters: col=
We will make use of the color blue: "blue"
col="blue"

Plot several graphs together
Make all the possible plots of the dataset
Make a scatterplot for each variable in the dataset combined
Make use of the function: pairs()
State to R which dataset you want to make us of to plot all the combined variables: meuse
pairs(meuse)

In case you receive the error "the size is too large, reshape the graph-window)
Re-run the code again

How to modify the graphs - lower number of variables, makes it more readable = less small graphs
Using grouping character. Grouping all these variables together. switching to 4 variabilities
pairs(~cadmium+copper+lead+zinc,data=meuse)

We have taken the data from the dataset. 
The 4th variables correlated to each other in the first 6 rows. Make subset [. 
Comma is the separation between the different column
State the number of the column to start from until which column to end with 
Copper = 3 Zinc = 6: 3:6
pairs(meuse[,3:6])

Prettify this graph
Change the point character: pch=23
Change color of the point character: col="purple"
pairs(meuse[,3:6],pch=23,col="purple")

How to do a beautiful scatterplot. 
Install an additional package: install.packages()
State to R which package to install: GGally
Use "" since we are going outside of R
install.packages("GGally") 

Now we have to recall the library by using the function: library()
No comma needed because we have already installed it in R.
library(GGally)

This package is installed in order to make use of the function: ggpairs()
ggpairs will make a scatterplot of each pair of th variable. 
Numeric value on the left, and the correlation in percent on the right
This is to make the graphs more *pretty*
ggpairs(meuse[,3:6])
