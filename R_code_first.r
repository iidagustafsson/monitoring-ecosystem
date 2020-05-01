install.packages("sp")

Recall the package
library(sp)
data(meuse)

# Let us see how the meuse dataset is structured:
meuse

# Let us look at the first row of the set
head(meuse)
= means only to see some lines of the dataset. the first 6 rows will be visible

# Let us plot two variables 
# Let us see if the zinc concentration is related to that of copper
attach(meuse)
= now the dataset it attached. and we can now start with the plotting.
can also google: R software plot function (to see all different plot functions available) (x-axis,y-axis)

plot(zinc,copper)
= graph visable in R

change the graph (x-axis,y-axis,separation) separation: e.g colors. there is a need for " because colors are numbers
plot(zinc,copper,col="blue") 

To change the symbols in the graph - point character: pch
Google to see different point characters and their numbers
Here we make us of the point character equals to 19
plot(zinc,copper,col="blue",pch=19) 

to make larger point characters in the graph. character exaggeration: cex >1
to make a smaller point characters pick a number in between 0-1 
plot(zinc,copper,col="blue",pch=19,cex=2)
