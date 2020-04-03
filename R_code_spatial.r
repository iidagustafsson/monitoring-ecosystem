### R code for spatial view of points

what to do today - show the point we have seen last time on a map

recall the library that we used last time
library(sp)

recall the dataset meuse
data(meuse)

Look at the data - looking at some data. the first 6 rows of data
head(meuse)

we can see that the data containt some spatial data. points in space. they have coordinaates. x and y

# coordinates
tell the dataset this is a spatial dataset. tell the dataset that the coordinates are x and y
coordinates(meuse)=~x+y

now we are going to think spatial. make functions that use spatial infromation
the dataphrame from a spatial data to plot
plot(meuse) 

one of the functions that are contaning in the sp packages. explain which dataset you are using. 
and then make use of one of the virables example zinc
spplot(meuse,"zinc")

for using the plot. you will se the spots in space.
by using the spplot, 

see how the other elements/virable are related to the spatial amount
# excercise: plot the sptaial amount of copper
spplot(meuse,"copper")

change the titel of the graph. using main=
spplot(meuse,"copper",main="copper concentration")

we can see the cooleration. 
where there is a higher amount of zinc, there is also an higher concentration of copper.
this means that the river is brining this material. 

an othjer function. tyo see the same information. but changing the size of pints, instead of color
it is called bubble. put in the dataset, the virable we want to show in bubble
bubble(meuse,"zinc")
it is the same information as the previous map. but making use of the amount of the element. 
larger bubble means a higher concentration

# exercise: bubble copper in red
bubble(meuse,"copper",col="red",main="Copper Concentration")

# Importing new data. Making use of the file covid.agg
download covid.agg from iol. 
create a folder called Lab on desktop C
now we should transfer this dataset into R

# setting the working directory : Lab
For windows users. setwd. Than recall the desktop where we stored the folder
setwd("C:/Lab/")

Give name of the dataset we want to use - covid
Link the name to the functions. Linking the function to an object <-
Dataset will be called covid. What is the name of the table we are going to read?
We are going to read the table in covid read.table
Previously we have told R to make use of the file in folder Lab
The first row in the dataset is just a heading. There is a heading. 
Need to tell R this, by putting head=T
covid<-read.table("covid_agg.csv",head=T)

attach the dataset
attach(covid)

make a plot of country and cases. X-axis = country, and Y-axis = cases
plot(country,cases)


number of cases by each country. the highest amount of cases were in china. 
making the name of the countries vertical, in order to see all the countries.
labes = las. 4 differnt codes. 

plot(country,cases,las=0)
nothing happened in R. making parrallel labels

try a new label. las=1
plot(country,cases,las=1)
=>all the labels of the horizontal labels

Try a new label. las=2
plot(country,cases,las=2)
=>this changes the name of the countries horisontal

Try a new label. las=3
plot(country,cases,las=3)
vertical labels


plot(country,cases,las=3,cex.axis=0.5)
making x-axis half of the levels as before

lets plot the dataset spatially
make us of the ggplot2 - make beautiful graphs. 
it is a library that can be installed
the main patterns that we can achieve by ggplot. 
to make a ggplot. need 3 main components
1. the dataset we are going to make use of (in our case - covid)
2. aesthetic mapping (the virables we want to put in the graph) (in our case is the country + cases)
3. the symbol we want to show this data (e.g. points)

install the packaged called ggplot2
install.packages("ggplot2")

explian to R that we want to make use of the package ggplot2
library(ggplot2)

save the data. go to File => Save workspace => in the mapfolder Lab in C. I called it .RData
.RData under the menu File

-------------------------------------------
2020-04-03

open previsoly saved RData
# setting the working directory : Lab
For windows users. setwd. Than recall the desktop where we stored the folder
setwd("C:/Lab/")


load makes you help load previously saved data
we are going out of R. there " needed
load(".RData")


ls means list. it is the list of all the models you previously you have done. it is a list of problems.
it will show you all the data you have made so far. if everything went well. covid and meuse should appear. 
ls()

making use of the most fancy packaged for R. 
to make beutiful graphs
we can plot : 
1 - data
2- aestetic mapping
3- gemone

make use of ggplot2 packaged. 
recall the ggplot
library(ggplot2)

into ggplot2 there is a database called mgp dataframe 
the dataset it about cars, but make use of the plots
the first thing to do, is to put the data into the R
the dataset we are about to use is called mpg

data(mpg)
head(mpg)

Now we see the first rows of the dataset

key components: data, aes and geometry
first always put the data. 
data = mpg
then the aestetic = aes
and then virable = 
geometry = geom_point
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()


most of the times

change from points to lines 
ggplot(mpg,aes(x=displ,y=hwy))+geom_line()

changing the geomentry. change to 
ggplot(mpg,aes(x=displ,y=hwy))+geom_polygon()

go ahead and use covid data. how to plot our covid data.
it is already in our data set
have a look at it
head(covid)


What do we want to plot?
tell it we use covid as dataset
then tell him what variabilites we want to use - x=longitude, y=latitude, size=cases
size means that the size of the point will change depending on the changes in virabilites
ggplot(covid,aes(x=lon,y=lat,size=cases))+geom_point()

