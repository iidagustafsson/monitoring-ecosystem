**********point pattern analysis notes**********
spatial statisics
driving data taken from the field. build a map on these data


talking about point patter. some distribution. in terms to individuals
most of the data is recorded in in-situ
measurements in the field in a certain point (coordinates x and y)

point patterns are used when studyin differnt population
making use of how individuals make distribution in space. 

density - vectorformat (x,y)
interpolation - rasterformat (
what is the valu of that virable
diameter height

today going to produce density
eg how many countries have the covid right now?

next lecture we will do interpolation

****************construct a density map of covid data***************


# point pattern analysis - density map

install the dataset spatstat
install.packages("spatstat")

recall the packages
library(spatstat)

attach the dataset we want to use. which is covid
attach(covid)

to see the first rows in dataset
head(covid)

now we see the coorinates. and can do our plotting
give a name to the object that we are going to add    = covids
then the function to build this planning point patter = ppp
what is the name of the x variable                    =lon              
what is the name of the y variable                    =lat
what is the range between these numbers. this is c(-180.180) (-90,90)
covids<-ppp(lon,lat,c(-180,180),c(-90,90))

by attaching covid, you dont need to state the dollar $ symbol

c = when we have a group of series of caracthers. 
this is to make sure to cluster together. e.g numbers. if

to build a density map. give it a name : d
d<-density(covids)

now we want to show the density map
my plotting. 
plot(d)


to put the points onto the map
points(covids)

save the workspace - density.RDate





