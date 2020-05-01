**********point pattern analysis notes**********
spatial statistics
driving data taken from the field. build a map on these data


talking about point patter. some distribution. in terms to individuals
most of the data is recorded in in-situ
measurements in the field in a certain point (coordinates x and y)

point patterns are used when studying different  population
making use of how individuals make distribution in space. 

density - vectorformat (x,y)
interpolation - rasterformat (
what is the value of that variable
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

For windows users. setwd. Then recall the desktop where we stored the folder
setwd("C:/Lab/")

head=T means that the column header
import the data
covid<-read.table("covid_agg.csv",head=T)

attach the dataset we want to use. which is covid
attach(covid)

to see the first rows in dataset
head(covid)

now we see the coordinates and can do our plotting
give a name to the object that we are going to add    = covids
then the function to build this planning point patter = ppp
what is the name of the x variable                    =lon              
what is the name of the y variable                    =lat
what is the range between these numbers. this is c(-180.180) (-90,90)
covids<-ppp(lon,lat,c(-180,180),c(-90,90))

by attaching covid, you dont need to state the dollar $ symbol

c = when we have a group of series of characters 
this is to make sure to cluster together. e.g numbers. if

to build a density map. give it a name : d
d<-density(covids)

now we want to show the density map by plotting. 
plot(d)


to put the points onto the map
points(covids)

save the workspace - density.RDate

------------------- 2020-04-08---------------
re-open density
Load previous workspace. Tell R from where to load from
setwd("C:/Lab/")
load(".RData")

To see which datasets we used last time
ls()
= covid, covids, d, meuse, mpg
  
Recall library to make spatial map
library(spatstat) 
  
Plot a density map, The density map we plotted last time. saved as d
plot(d)
points(covids)

Install the packages rgdal. Since it is outside of R "
install.packages("rgdal")
library(spatstat)
library(rgdal)
plot(d)
points(covids)

Download file called coastlines from iol
Extract the zipped file into the created Lab-folder
lets input vector lines to the map
coastlines<-readOGR("ne_10m_coastline.shp")

- creating worldmap lines
plot(d)
points(covids)
plot(coastlines,add=T)

lets see the ecological point. not dealing with the number of cases
we are seeing the density of how many cases in countries
use a command that will be useful  by monitoring ecosystems
changing the aspects. changing the colors of the map

We are going to make a pallet. give it a name cl
We want to adress it: <-

State to the software. The color range we want to switch in-between
Instead of how it is now from blue to yellow color

To indicate a range. Build a cluster: (c)
The colors we want. First color for the smaller values, last color for largest values. 
 "yellow","orange","red"
Our map will range from yellow to red. Red color for highest density of cases.

To wider the range of different colors, add number in end
(100)

Plot the density, by the colorpalette we make
cl<-colorRampPalette(c("yellow","orange","red")) (100)
plot(d,col=cl, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)

####Exercise: new color ramp palette
clr<-colorRampPalette(c("blue","green","yellow"))(100)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)

clr<-colorRampPalette(c("blue","green","yellow","orange"))(100)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)

clr<-colorRampPalette(c("blue","green","yellow","orange","red"))(100)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)
  
Do a new Ramp Palette
Change the number of colors. Into a small number of colors
clr<-colorRampPalette(c("blue","green","yellow","orange","red"))(5)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)

clr<-colorRampPalette(c("blue","green","yellow","orange","red"))(1000)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)
  
By doing so, it will be a less beautiful map. 
Changing from one color into another color very abrupt
The number is representing the final number of color we are using, in the last case 5.
By changing  into a higher number, it will make it into a smooth change. 
    
  
How to export such a map?
We are going to make a pdf of the map.
Give it the namn covid_density
pdf("covid_density.pdf")
  
Copy all of the functions used for plotting
clr<-colorRampPalette(c("blue","green","yellow","orange","red"))(1000)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)
  
close the devise
dev.off()
  
pdf("covid_density.pdf")
clr<-colorRampPalette(c("blue","green","yellow","orange","red"))(1000)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)
dev.off()
  
The map will now be saved into the lab folder.
And will be called covid_density
  
You can also create png files
png("covid_density.png")
clr<-colorRampPalette(c("blue","green","yellow","orange","red"))(1000)
plot(d,col=clr, main="Densities of covid-19")
points(covids)
plot(coastlines,add=T)
dev.off()

pdf-files have a higher quality when you zoom in. 
We started with countries, cases, latitude, longitude and ended with a nice map!
