### R code for spatial view of points

what to do today - show the point we have seen last time on a map

Recall the library we used last time
library(sp)

Load the dataset meuse
data(meuse)

Look at the data
Look at the first 6 rows of data
head(meuse)

We can see that the data contains some spatial data 
Points in space because they have coordinates: x and y

# coordinates
Tell the dataset this is a spatial dataset 
Tell the dataset that the coordinates are x and y
coordinates(meuse)=~x+y

Now we are going to think spatially 
Make functions that use spatial information
The data frame from a spatial data to plot
One of the functions in sp package to make use of: spplot()
Explain which dataset you are using: meuse 
Explain which variable to make use of: "zinc" 
spplot(meuse,"zinc")

Now let us see how the other elements/variables are related to the spatial amount
# exercise: plot the spatial amount of copper
spplot(meuse,"copper")

In order to change the title of the graph
Make use of the function: main=
State what name you want as the title: copper concentration
Use the " " because we go outside of R
spplot(meuse,"copper",main="copper concentration")

We can see the correlation between zinc and copper 
Where there is a higher amount of zinc, there is also a higher concentration of copper
This means that the river is bringing this material 

Another function - to see the same information 
But see the concentration of the variable with respect to the size of the points 
Make use of the function: bubble()
State which dataset we want to use: meuse
State with variable we want to plot: zinc
Remember to use: “ “ 
bubble(meuse,"zinc")

It is the same information as the previous map, but making use of the amount of the element
Larger size of the bubble means a higher concentration

# exercise: bubble copper in red
bubble(meuse,"copper",col="red",main="Copper Concentration")

# Importing new data. 
Making use of the file covid.agg
Download covid.agg from iol 
Create a folder called Lab on desktop C
Now we should transfer this dataset into R

# setting the working directory to  Lab folder
For windows users. setwd. Then recall the desktop where we stored the folder
setwd("C:/Lab/")

Assign a name to the dataset we want to use: covid
Link the name to the functions. Linking the function to an object:t <-
Dataset will be called covid 
What is the name of the table we are going to read
Check the fully name of the file we downloaded: covid_agg.csv
Make use of “ “ since we are going outside of R
We are going to read the table. Make use of the function: read.table
Previously we have told R to make use of the file in folder Lab
The first row in the dataset is just a heading 
We need to tell R this, by putting head= T (true)
covid<-read.table("covid_agg.csv",head=T)

attach the dataset
attach(covid)

make a plot of country and cases: plot()
X-axis = country, and Y-axis = cases: country, cases
plot(country,cases)

Number of cases by each country - the highest amount of cases was in China 
Making the name of the countries vertical, in order to see all the countries under the plot
To make labels make use of the function to do so is: las=  (there are 4 different options 0, 1, 2, 3)

Let us try label 0: las=0
plot(country,cases,las=0)
Nothing happened in R. Making parallel labels

Try a new label: las=1
plot(country,cases,las=1)
=>all the labels of the horizontal labels

Try a new label: las=2
plot(country,cases,las=2)
=>this changes the name of the countries horizontal

Try a new label: las=3
plot(country,cases,las=3)
=> vertical labels

To make the text at x-axis 50% smaller than defult: cex.axis=0.5
This is to see all the countries
plot(country,cases,las=3,cex.axis=0.5)

Let us plot the dataset spatially
Make us of the ggplot2 - make beautiful graphs 
The main patterns that we can achieve by ggplot 
To make a ggplot: need 3 main components
1. the dataset we are going to make use of (in our case - covid)
2. aesthetic mapping (the variables we want to put in the graph) (in our case is the country + cases)
3. the symbol we want to show this data (e.g. points)

First we need to install the packaged called ggplot2
install.packages("ggplot2")

Explain to R that we want to make use of the package ggplot2
library(ggplot2)

Save the data
Go to File => Save workspace => in the map folder Lab in C. I called it .RData
.RData under the menu File

-------------------------------------------
2020-04-03

Open previously saved RData
Set my working directory
setwd("C:/Lab/")

To load the previous saved data. Make use of the function: load()
State with data we want to load: .RData
we are going outside of R. therefore we needed: “ “
load(".RData")

In order to see a list of all the data you have made so far. 
Make use of the function: ls()
If everything went well, covid and meuse should appear as our data
ls()

Making use of the fanciest packaged for R. 
To make beautiful graphs
We can plot : 
1- data
2- aesthetic mapping
3- gemone

Make use of ggplot2 packaged 
Recall the ggplot2
library(ggplot2)

Into ggplot2 there is a database called mgp data frame 
The dataset it about cars, but make use of the plots
The first thing to do, is to put the data into the R: data()
State which dataset we are about to use: mpg
data(mpg)

To see the first rows of the dataset
head(mpg)

Key components: data, aes and geometry
When plotting, first always put the data: mpg
Secondly the aesthetic: aes
Thirdly the variable = x and y
X-axis: displ
Y-axis: hwy
Lastly, geometry: geom_point()
ggplot(mpg,aes(x=displ,y=hwy))+geom_point()

Change the geometry from points to lines: geom_line()
ggplot(mpg,aes(x=displ,y=hwy))+geom_line()

Change the geometry from lines  to polygon
ggplot(mpg,aes(x=displ,y=hwy))+geom_polygon()

Now go ahead and use our covid data
How to plot our covid data?
It is already in our data set
First have a look at it
head(covid)

What do we want to plot?
First tell R we use covid as dataset: covid
Secondly the aesthetic: aes
Thirdly what variabilities we want to use: x=longitude, y=latitude, size=cases
Size means, that the size of the point will change depending on the changes in variabilities 
The geometry should be points: geom.points()
ggplot(covid,aes(x=lon,y=lat,size=cases))+geom_point()
