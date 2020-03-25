install.packages("sp")

library(sp)
data(meuse)

# Let us see how the meuse dataset is structured:
meuse

# Let us look at the first row of the set
head(meuse)
= means only to see some lines of the dataset. the first 6 rows will be visable

# Let us plot two variables 
# Let us see if the zinc concentration is related to that of copper
attach(meuse)
= now the dataset it attached. and we can now start with the plotting.
can also google: R software plot function (to see all differnt plot functions available) (x-axis,y-axis)

plot(zinc,copper)
= graph visable in R

change the graph (x-axis,y-axis,seperation) seperation: e.g colors. there is a need for " because colors are numbers
plot(zinc,copper,col="blue") 

To change the symbols in the graph- pointcharacter: pch
google to see differnt pointcharacters and their numbers
plot(zinc,copper,col="blue",pch=19) 

to make larger pointcharacters in the graph. character exaggeration: cex >1
to make a smaller pointcharacters pick a numer in between 0-1 
plot(zinc,copper,col="blue",pch=19,cex=2)
