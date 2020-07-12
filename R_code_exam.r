# 1. R first codes
# 2. Multipanel
# 3. Spatial
# 4. Multivariate Analysis
# 5. PCA Remote Sensing
# 6. DVI Remote Sensing
# 7. Ecosystem Functions
# 8. Radiance
# 9. Diversity Measurement
# 10. faPar
# 11. EBVs
# 12. Cladonia Focal
# 13. Snow cover
# 14. NO2 + Monitoring Air Pollution
# 15. Crop + Zoom
# 16. sdm (Species Distribution Modelling)
# 17. Exam - project


######################## First code #########################
#############################################################
#############################################################
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

######################## Second code ########################
#############################################################
#############################################################
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

######################## Third code #########################
#############################################################
#############################################################
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

######################## Fourth code ########################
#############################################################
#############################################################
Make use of the lab folder
Set my working directory
setwd("C:/lab/")

Go to iol site and download the data called: 
biomes.csv
biomes_types.csv

Install the package
install.packages("vegan")

Recall the package we are going to use
library(vegan)

Import the plots into R
First give a name to the dataset we are going to use
biomes

Assign this name to a certain function
<-

To import table from the outside of R
read.table

Tell which data R should read: biomes.csv
Make use of “ “ since we are going outside of R (into lab folder)

We have a heading. Each column has a heading. The header equals to true = T
head=T

The comma is the separator of each plot. Telling R "if you see comma = new column"
sep=","

Read the table biomes
biomes<-read.table("biomes.csv", head=T,sep=",")

Take a look at the head of the dataset biomes
The name of the objects
head(biomes)

See how the species are related - Make the multivariate analysis

We have several dimensions. But we will see the data in 2 dimensions only
We are going to take a look at our 20 dimensions (species), but just into 2 dimensions

We are going to make use of the function called: DEtrended CORrespondence ANAlysis
Give it a name
multivar

Assign this name to the certain function
<-decorana

And use the dataset 
biomes

multivar<-decorana(biomes)

Plot the final result/plot the graph
plot(multivar)

How to make the numbers/letters larger in the graph: cex=
Indicate how big the numbers/letters should be from original
We want them 20% larger than default: cex=1.2
plot(multivar,cex=1.2)

Now we can see all the 20 dimensions (20 species) into 2 dimensions
What can we read from the graph?
A plot of all species
How the species are correlated to each other
Species that are more functionally related are closer to each other. Their coordinates are closer
The closer each species are to each other in the graph, the more related they are

How much are we seeing of the real dataset?
Put the name of the analysis to see the information of it
multivar

Eigenvalues - the amount of perception you can have of the old system
Originally 20 different dimensions
Reducing everything into 2 dimensions (x-axis, y-axis)
The amount of the perception we are seeing
Add the % from column 1 + 2
Around 82% 

What are the points?
They are the different species
How the different plots are scattered into 2 dimensions

Now we are going to make use of the other data we downloaded from iol: biomed_types.csv
We will link each plot to each other
See how they are linked into the multivariate graph

First plot multivar and have a look at it
plot(multivar)

Read the biomes_types table (same procedure as we did with biomes)
biomes_types <-read.table("biomes_types.csv",header=T,sep=",")

Link one point to each other. See if the different biomes can be seen into our graph
First attach this dataset: attach()
State which dataset to attach: biomes_types
attach(biomes_types)

Connecting all the ellipse from the multivar, by making use of the function: ordeiellipse()
Ordeiellipse draws lines, points or ellipses by each group
State which dataset to use: multivar
We have four different biomes. So, we are going to use four different colors for each biome
col=1:4 or col=c("green","blue","red","black")
We want to draw ellipses by each group (biome): kind=”ehull”
We want to change the dimension of the line in the graph: lwd=
We want the with a width 3 times thicker than original: 3
lwd=3
ordiellipse(multivar,type,col=1:4,kind="ehull",lwd=3)

The colors represent the four different biomes
The biomes that are coming out from the dataset
All species inside and a bit outside of the ellipse are species from a specific biome
Green ellipse: tropical forest. 
Red ellipse: broad leaf forest/temperate forest
Blue ellipse: tundra
Black ellipse: coniferous forest

Now we want to put the name of each biome in the plotted graph
Make use of the function: ordispider()     “the spider house"
State which data to use and colors to use
Put each name of the biomes by using: label=T
ordispider(multivar,type,col=1:4,label=T)

######################## Fifth code #########################
#############################################################
#############################################################
Set my working directory to lab folder
setwd("C:/lab/")

We are going to look at the path 224 and the row 63 
The image we are going to make use of is from that area - Amazon Forest
We have two different dates; one image is from year 1988 and the other is from 2011

Import one of the images from Lab folder
We are going make use of two datasets: Raster and RStoolbox
library(raster)
library(RStoolbox)

To import all of the data from a satellite picture into R
Make us of brick function: brick
State the data which we want to import: p223r63_masked.grd
Use “ “ since we are going outside R
Assign the function to the new name: p224r63_2011
p224r63_2011<-brick("p224r63_2011_masked.grd")

Make use of 3 different landsat band sets
First Band B1: Blue
Second Band B2: Green
Third Band B3: Red
Fourth Band B4: NIR
Fifth Band B5: (Short-wave) Medium Infra-Red (different range of wavelength within spectrum)
Sixth Band B6: Thermal infrared
Seventh Band B7: (Short-wave) Medium Infra-Red (different range of wavelength within spectrum)
Eight Band B8: Panchromatic

We can plot in different ways: plotRGB, GGplot
Stretch to see the colors, by making a linear stretching 
The function is called: stretch="Lin"
We want to describe the different bands (Medium infra-red, NIR, RED) by using the primary colors: RED, GREEN, BLUE
plotRGB(p224r63_2011,r=5,g=4,b=3,stretch="Lin")

We need an additional library to plot GGplot
Recall the library
library(ggplot2)
The function is called: ggRGB()
State which data to use: p224r63_2011
State which bands to use - Medium infra-red, NIR, RED: 5,4,3
ggRGB(p224r63_2011,5,4,3)

### Exercise - Produce the same procedure but with the 1988 image
1. Upload the image into R
2. Give it the name
3. Plot it into the software

p224r63_1988<-brick("p224r63_1988_masked.grd")
plotRGB(p224r63_1988,r=5,g=4,b=3,stretch="Lin")
ggRGB(p224r63_1988,5,4,3)

To see both the images at the same time 
Make use of the function: par
par(mfrow=c(1,2))
plotRGB(p224r63_1988,r=5,g=4,b=3,stretch="Lin")
plotRGB(p224r63_2011,r=5,g=4,b=3,stretch="Lin")

The pink part has increased a lot = agricultural lands. The main forest is in dangerous
We used the band 5 = Medium Infra-Red, band 4= NIR and band 3= Red

How to see all the bands together? All the information together in one plot
Let us see if the bands are correlated to each other or not
First of all, what does it mean correlated?
Being correlated - means you are following the pattern of another variable
Example the number of trips/travels and the number of infected by covid are related 

Let us see if B1 and B3 are corelated to each other
Blue and Red should have a high correlation. Because this light is used to fixate photosynthesis
Make to plots. Band 1 x-axis and band 3 y-axis
We need to know the names of the bands
How to know the names of anything in R?
Make use of the function: names
State the name of the data we want to see the names of: p224r63_2011
names(p224r63_2011)

Here you have the names of the different bands: B1_sre and B3_sre
We are interested in plotting the band 1 and band 3

Make us of the image from 2011
Linking different parts
By using the $ symbol

To close the window
dev.off()

Now linking the image to B1 and B3
plot(p224r63_2011$B1_sre, p224r63_2011$B3_sre)
B1 and B3 have high correlation 

Positive correlation between variables. Both variables are increasing with respect to the other
Negative correlation between variables. One variable is decreasing with respect to the other
No correlation - flat curve/line

We can apply
Principal component = PC1 - accounting for 90% 
Principal component = PC2 - accounting for 10%

We need to decrease the resolution of the image
Why? The PCA is a hard. We have a huge amount of data
Decrease it by a factor of 10. Passing from 4 M of data -> into 40K of data
Decreasing on the linear dimension
Make use of the function: aggregate() 
Assign the image a new name: <-
Associate the image by: res (resolution)
p224r63_2011_res<-aggregate(p224r63_2011,fact=10)

Raster PCA is the function that performs Principal Component Analysis
Assign the image a new name: <-
Associate the image by: pca
p224r63_2011_pca<-rasterPCA(p224r63_2011_res)

In order to see all the information within the dataset run the name of the image
p224r63_2011_pca

The different components: call, model, map
Let us plot the map
The dollar symbol is linking the different outputs together with the map
plot(p224r63_2011_pca$map)

Let us make a new color ramp palette
Assign the image a new name: <-
Give it the name: cl
cl<-colorRampPalette(c('dark grey','grey','light grey'))(100)
plot(p224r63_2011_pca$map, col=cl)

The PC1 - is accounting for almost all the information of the variations (99,83%)

Let us see how the variations of each component in the model 
We are interest in the information of the model. We want to see the output of the model
Make use of the function: summary
summary(p224r63_2011_pca$model)

Let us see how much the different bands are correlating to each other
pairs(p224r63_2011)

Band 4 (NIR) has a lower correlation with respect to the other bands

Let us plot the first 3 components
Make use of 3 different colors (Blue, Green and Red)
The first component accounting for 99,83%
The second component accounting for 0,146%
The third component accounting for 0,0157%

We are going to plot each principle components into the bands
Principle component 1, 2 and 3. Red=PC1, Green=PC2 and Blue=PC3
plotRGB(p224r63_2011_pca$map,r=1,g=2,b=3, stretch="Lin")


### Repeat the same procedure for 1988 image
First decrease the amount of data by factor 10: fact=10
Make use of the function: aggregate()
Second make use the pca: rasterPCA()
Third: plot in RGB our map. By using the color ramp palette cl
And linking the outputs with the map
p224r63_1988_res<-aggregate(p224r63_1988,fact=10)
p224r63_1988_pca<-rasterPCA(p224r63_1988_res) 
plot(p224r63_1988_pca$map, col=cl)

summary(p224r63_1988_pca$model)

Very high correlation between the bands
99,56% by PC1 (the image from 2011 has 99,83%)
0,38% by PC2 (the image from 2011 has 0,146%)
0,048% by PC3 (the image from 2011 has 0,0157%)

Make us of the function pairs to make a scatterplot by the variables in 1988
pairs(p224r63_1988)
Very high correlation between the bands

Now make a difference between these two pca maps
Plot the difference between the two images
Let us take the map from 2011 subtracted by the map from 1988
For each pixel we have two different maps 
Assign it the name: <-
Give it the name: difpca  (different pca)
difpca<-p224r63_2011_pca$map-p224r63_1988_pca$map

plot these differences among the single components 
plot(difpca)

We will change the color ramp palette
Assign it the name: <-
Give it the name: cldif
cldif<-colorRampPalette(c('blue','black','yellow'))(100)

Now we are going to only plot the Principle Component 1: PC1
To see the name, just run the name
difpca

Lets link the differences in the first component
plot(difpca$PC1,col=cldif)

This is showing the highest the possible variations between two images
Where there have been the highest variations - yellow part
Where there have been the lowest variations - blue part

What we did today:
First, we decreased the complexity of the images by factor 10 to make it easier to plot
We took all the differences in the bands of 1988
Put it into one principle component
The same for image in 2011
Then subtracted the two principle components with each other, to see the differences

######################## Sixth code #########################
#############################################################
#############################################################
First, we need to install two new packages
install.packages("raster")
install.packages("RStoolbox")
or use: install.packages(c("rasteer","RStoolbox"))
Go to iol and download the file

We will continue next lecture
----------------------------------------------------
2020-02-22
Unzip the downloaded file into the Lab folder
Make sure it is unpacked

Set my working directory to lab folder
setwd("C:/lab/")

We are going to make use of the dataset raster
Raster is the format of pixels
Pixels = the quadrates forming the images

Recall the package raster
library(raster)

Go to the Lab folder. And find the data we downloaded (last time) it is called (p224r63...)
The name of the file corresponds to their location on the world map
The numbers equals to coordinates - path: 224 row: 63
The files are from 2011 and 1988. In these two years the images have been taken

Import the images from the lab folder
The function to import images into R is called: brick
We use brick since we want to importing all of the packs of bands

Go to the lab folder - .grd extension are the images (the extension cannot be seen in windows)
grd = grid (easy way to store information)
Import one of the images
Start with the one from 2011
brick("p224r63_2011_masked.grd")

Give a name to this file
p224r63_2011<-brick("p224r63_2011_masked.grd")

Lets plot it into R
plot(p224r63_2011)

Vegetation is reflected by the Near Infrared (NIR) 
High reflection in Green light, very little reflection in RED and BLUE due to photosynthesis

Change the color ramp pallets of the plots
The color ramp is now from white to green colors
We are going to change it into a grey scale ramp

Assign the color ramp palette to the name: cl
To get a smooth transition between the colors: (100)
cl<-colorRampPalette(c("black","grey","light grey"))(100)

Plot the image and use the color ramp palette
plot(p224r63_2011,col=cl)

Bands of landset
First band B1: Blue
Second band B2: Green
Third band B3: Red
Fourth band B4: NIR
Fifth band B5: Medium Infra Red
Sixth band B6: Thermal Infra Red
Seventh band B7: Medium Infra Red

Let us make a different plot of the image
Plot the single band. Just one of them
Each of them can be colored with a single color ramp palette

To plot several images at the same time
Make us of the function: par
Make a multi frame row: mfrow
Explain the number of rows and colums you want: 2,2
To put the number of columns and graphs into the graph. Make a series of character (c)
par(mfrow=c(2,2))

To see all the colors available in R
color()

We are going to plot the B1 band 
Assign the color ramp pallet to the name: clb
Use the $ symbol to link all the bands to the images 
The name of the band B1 = B1_sre
clb<-colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre,col=clb)

### Exercise - do the same for green band. Which is band B2
Assign the color ramp pallet to the name: clg
clg<-colorRampPalette(c("dark green", "green","light green"))(100)
plot(p224r63_2011$B2_sre,col=clg)

### Exercise - do the same for red band. Which is band B3
Assign the color ramp pallet to the name: clr
clr<-colorRampPalette(c("dark red", "red","pink"))(100)
plot(p224r63_2011$B3_sre,col=clr)

### Exercise - do the same for the NIR band. Which is band B4
Assign the color ramp pallet to the name: cln
cln<-colorRampPalette(c("red", "orange","yellow"))(100)
plot(p224r63_2011$B4_sre,col=cln)

NIR band reveals that there is a lot of vegetation 
White parts in the image has no value. It is water coming from the nearby river

Make a graph with 4 rows and 1 column and plot all the previous images
par(mfrow=c(4,1))
clb<-colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre,col=clb)
clg<-colorRampPalette(c("dark green", "green","light green"))(100)
plot(p224r63_2011$B2_sre,col=clg)
clr<-colorRampPalette(c("dark red", "red","pink"))(100)
plot(p224r63_2011$B3_sre,col=clr)
cln<-colorRampPalette(c("red", "orange","yellow"))(100)
plot(p224r63_2011$B4_sre,col=cln)

To close the window
dev.off()

Show a plot in red green blue plot (RGB).
Plot an image of multi-layers
The function is called: plotRGB()
State which band should correspond to which layer: R-red=3, G-green=2, B-blue=1
State to R which data to plot: p224r63_2011
Stretch to see the colors, by making a linear stretching: stretch=”Lin”
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")

Change the bands scheme
We are going to make us of our NIR (=4)
Remove the blue band (=1)
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")

Plants are reflecting much in NIR light spectrum
NIR - is now set to the red color. The red color is the forest
Pink/violet parts - related to the agricultural fields 
White/grey parts - open areas

### Exercise: plot NIR on top of the GREEN component of the RGB
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")

We have now simply inversed the red and the green bands
NIR - is now set to the green color = the forest
Dark green = high amount of water coming. Can measure the amount of humidity
Pink/violet parts- related to the agricultural fields 
White/grey parts - open areas

### Exercise: plot NIR on top of the BLUE component of the RGB
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")

NIR - is now set to blue color = the forest
Yellow = related to the agricultural fields
White/grey parts - open areas

Save the workspace into lab folder
I called it remote_sensing
---------------------------------------------

2020-04-24
Set my working directory
setwd("C:/lab/")

Load previous working space
Load the file called remote_sensing into R

Now load to see all the dataset we used last time
ls()

Which are: "cl" "clb" "clg" "cln" "clr" "landuse" "meuse" "p224r63_2011"   

Recall the dataset raster. Raster means that the data contains of pixels
library(raster)

Import the other image. The one from 1988
brick("p224r63_1988_masked.grd")

Give a name to this file
p224r63_1988<-brick("p224r63_1988_masked.grd")

Let us plot it into R
plot(p224r63_1988)

Bands of landset (same as for 2011)
First band B1: blue
Second band B2: green
Third band B3: Red
Fourth band B4: NIR
Fifth band B5: Medium Infra Red
Sixth band B6: Thermal Infra Red
Seventh band B7: Medium Infra Red

### Exercise: plot in visible RGB 3 2 1 both the images. So plot in 2 rows and 1 column
par(mfrow=c(2,1))
plotRGB(p224r63_1988,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")

We are going to make use of the NIR, RED and BLUE
### Exercise: plot in false color (NIR) RGB 4 3 2 both images
par(mfrow=c(2,1))
plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")

By using the NIR, it is the most powerful band in order to monitor ecosystems 
Here you can see how much humans have opened up the forest. Humans have change the forest
Which have created problems for the people living in the forest 
But also creating problems for animals and plants
Creating new niches for alien species to adapt to. Will compete with the endemic species

Use another stretch
Let us make us of a histogram stretch: stretch="hist"
This function enhances the 'noise'. 
In this case it is mainly related to humidity. The evapotranspiration process of the forest will be visible 
Put the both images in the same plot, but underneath one and another. Still using RGB 4 3 2 in both images
par(mfrow=c(2,1))
plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="hist")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="hist")

The most important ecological process - evapotranspiration 
Much higher humidity in 1988, compared to 2011. 
If there is a high amount of humidity - means the forest was more alive in 1988 compared to 2011

What we want to do is comparing the vegetation index. Between the two images
NIR is highly reflective. RED is very absorbed by chloroplasts 
A healthy plant, has a very high reflection in NIR light while low reflection in RED light
The difference between these indexes will give us the Vegetation Index
DVI (Difference Vegetation Index) = NIR-RED
A dying plant, has less reflection in NIR light while higher reflection of RED light

Bands of landset
First band B1: blue
Second band B2: green
Third band B3: Red
Fourth band B4: NIR
Fifth band B5: Medium Infra Red
Sixth band B6: Thermal Infra Red
Seventh band B7: Medium Infra Red

Let us start with the image from 2011
Assign it the name to the index: dvi2011
To link the band to the image, make use of $  
dvi2011<-p224r63_2011$B4_sre-p224r63_2011$B3_sre
Now we are subtracting RED value with the NIR value

Let us use a different color ramp palette
cl<-colorRampPalette(c("darkorchid3", "light blue","lightpink4"))(100)
plot(dvi2011,col=cl)

### Exercise- Make a DVI (Difference Vegetation Index) for 1988
dvi1988<-p224r63_1988$B4_sre-p224r63_2011$B3_sre
cl<-colorRampPalette(c("darkorchid3", "light blue","lightpink4"))(100)
plot(dvi1988,col=cl)

To make the differences from one year to another
Give it the name : diff
Assign the differences to this name: <-
The differences: dvi2011 - dvi1988
diff<-dvi2011 - dvi1988
plot(diff)

Green parts = DVI changes a lot
Yellow parts = DVI did not change
Brown parts = DVI was negatively affected. By random events

See the effects of changing the grain
Grain - the dimensions of the pixels
By changing the grain (dimension of pixel), you will change the capability to cover a certain property
Higher dimensions - hard to discover single plants. You will only see the forest
Small dimensions - you can see a single tree/plant within the forest

Let us change the grain of the images
When changing the dimensions of the pixels it is called resampling: res
The function is: aggregate()
Aggregate our image: aggregate(p224r63_2011)
We need to express how much we want to aggregate it. How much we want to increase the factor: fact=

We are going to rename it to: p224r63_2011res
And we want to aggregate it with the factor 10: fact=10
p224r63_2011res10<-aggregate(p224r63_2011,fact=10)

Now we want to aggregate it with the factor 100: fact=100
p224r63_2011res100<-aggregate(p224r63_2011,fact=100)

Now we want to see all the images at the same time
Make use of the par multi frame row function: par(mfrow 
State how many rows and columns: 3,1
We want to plot it with the NIR in the red band, the red in the green band and the green in the blue band
We want to plot the original, the dimensions with factor 10 and with the dimension of factor 100
par(mfrow=c(3,1))
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011res10,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011res100,r=4,g=3,b=2,stretch="Lin")

Save the workspace into lab folder
I called it remote_sensing_new

######################## Seventh code #######################
#############################################################
#############################################################
We are going to use Raster
Raster is the format of pixels - all data based on pixels

Install the packages rasterdiv (diversity) and rasterVis (visualisation)
install.packages("rasterdiv") 
install.packages("rasterVis") 

Recall the dataset rasterdiv and rasterVis
library(rasterdiv)
library(rasterVis)

Attach the data copNDVI
data(copNDVI)

Plot the dataset
plot(copNDVI)

We can now make additional graphs on the world map
We should remove some values by using: cbind 
We want to remove the values from the 253 to 255
Put this data as NA value
Reclassify the data into copNDVI
copNDVI<-reclassify(copNDVI,cbind(253:255,NA)

Levelplot is simple but powerful function to plot data
(If we want to impress our supervisor :) )
levelplot(copNDVI)
Now we have plotted the biomass functions and services that we have had during the last 30 years (from 1999)

The graph on the right side. What does it show us?
It shows us the DVI values of the biomass. Shows us the ecosystem services/functions
The main functions of Earths concerning biomass
In the north - mainly the conifer forest = high value
In the equatorial region - the rainforest = high value
On the 30 degrees north latitude - mainly desert/savanna = low value

The graph on the top side. What does it show us?
The variabilities are much lower over the longitudes. 
This is due to the latitudinal location of the biomes
The top graph considers high and low values all over the longitudes (=small variabilities)

Let us change the grain of the images
Let us aggregate the NDVI
The function is: aggregate()
Increase the pixle dimension by factor of 10: fact=10
Let us give a new name to the image: copNDVI10
copNDVI10<-aggregate(copNDVI,fact=10)

The map becomes a bit smoother, because the pixels are now bigger than before 

Let us see what happens when we aggregate with the factor 100 
And change the name of the new image into: copNDVI100
copNDVI100<-aggregate(copNDVI,fact=100)

The map becomes now very blurry, because the pixels are now very big. Cannot see much details 
Fun fact: Most of climate change maps are made by this resolution

#########################################################
Extra code (not included in this lecture!! just for fun)
library(ggplot2)

myPalette <- colorRampPalette(c('white','green','dark green'))
sc <- scale_colour_gradientn(colours = myPalette(100), limits=c(1, 8))

ggR(copNDVI, geom_raster = TRUE) +
scale_fill_gradientn(name = "NDVI", colours = myPalette(100))+
labs(x="Longitude",y="Latitude", fill="")+
#   theme(legend.position = "bottom") +
  NULL
# +
# ggtitle("NDVI")
#########################################################

Move to another example 
See how much the plants are losing their chemical cycling and energy flow, due to human activities
See how much we have converted the previous forest into agricultural lands

Download the data defor1_ and defor2_ images from iol
Save them into Lab-folder
        
Take a look at the images:
Everything that is red in the defor1_ image is forest
Everything that is grey in the defor2_ image is agricultural land

Set the working directory
setwd("C:/lab/")

Recall the raster packages
library(raster)

Import the data we saved in lab folder (defor1_ + defor2_)
The function to import images into R is called : brick
Go to the lab folder - .jpg extension are the images (the extension cannot be seen in windows)
brick("defor1_.jpg")
Put the name of the data. Give it the name defor1
defor1<-brick("defor1_.jpg")

Now let us also brick the second raster
Put the name of the data. Give it the name defor2
defor2<-brick("defor2_.jpg")

Now both the images are imported
Let us plot them into R
First check the landset bands:

Bands of landset 
First band B1: NIR
Second band B2: RED
Third band B3: GREEN

Show a plot - RGB
R-red =3, G-green =2, B-blue=1
The function is called: plotRGB
Change the bands scheme (r=1, g=2, b=3)

Stretch to see the colors, by making a linear stretching 
The function is called: stretch="Lin"
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
What we see: our forest before the changes in land use

Now do the same fow defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
What we see: our forest has undergone large changes in land use

Make use of the function: par
Make a multiframe row: mfrow
Explain the number of rows and columns you want: 1,2
To put the number of columns and graphs into the graph. Make a series of character (c)
Now we can see the images next to each other
Par is creating a multiframe of rows. The numbers indicate: 1 row 2 columns
par(mfrow=c(1,2))

Calculate the DVI between the different images
We need to know the name of the bands:
defor1
Bands of landset 
First band B1: NIR, defor_.1
Second band B2: RED, defor_.2
Third band B3: GREEN 

defor2
Bands of landset 
First band B1: NIR, defor2_.1
Second band B2: RED, defor2_.2
Third band B3: GREEN 

We should link the bands of the data 
To link the band to the image, make use of $.
dvi1<-defor1$defor1_.1-defor1$defor1_.2
dvi2<-defor2$defor2_.1-defor2$defor2_.2

Change the color ramp palette of the plots
Assign the color ramp pallet to the name: cl
cl<-colorRampPalette(c("darkblue","yellow","red","black"))(100) 

Plot both of them with the new colorRamp Palette
par(mfrow=c(1,2))
plot(dvi1,col=cl)
plot(dvi2,col=cl)

difdvi<-dvi1-dvi2
ERROR! The raster objects have different extents. 

Shut down the specified device
dev.off()

Change the color ramp palette of the plots
Assign the color ramp pallet to the name: cld
cld<-colorRampPalette(c("blue","white","red"))(100) 
plot(difdvi, col=cld)

Showing the difference of the previous forest to the current forest
Red parts/color = agricultural land
Light parts/color = forest
Shows the loss of ecosystem functions/services
All red parts have loss biomass and its services/functions

Use another stretch
Let us make us of a histogram stretch: "hist"
This function enhances the 'noise' 
hist(difdvi)
The bars show several values that are greater than 0 
Meaning that there is a high loss of DVI/biomass

######################## Eight code #########################
#############################################################
#############################################################
Recall the raster library
library(raster)

We are not going to import any data
So no need to set our working directory
We are going to make the data ourselves

We are going to create a new raster
Two columns and two rows
Assign it the name: toy
Put the maximum and minimum values on x-axis and y-axis
toy<-raster(ncol=2,nrow=2,xmn=1,xmx=2,ymn=1,ymx=2)

We are going to put these numbers into the raster
Series of values, make use of the function: c()
Assign it the name: values(toy)
values(toy) <- c(1.13,1.44,1.55,3.4)

Put the data in each pixel
First pixel (upper left) 1.13, second (lower left) 1.44 
third (upper right) 1.55 and fourth (lower right) 3.4

Now we can plot toy: plot()
We can also put the values of toy, by putting text of toys: text()
State which data we want to put the text of: toy
Using two decimals: digits=2
plot(toy)
text(toy, digits=2)

This is an example of a radiance image
How much energy is reflecting by the object
And arrives to the satellite
This is calculated by watts per square meter

You can most of the times download the radiance image = the numbers

Four potential values
An image with 2 bits (2^2)
How would such an image look like?

We assign a code, a value of the ranging (from 0 to 3)
We have four possible values

Let us make an image
Minimun: 0
Maximum: 3
Make use of the function: stretch (which stretch values)
Assign it the name: toy2bits
toy2bits<-stretch(toy,minv=0,maxv=3)

The storage mode is to put as integer
Making use of integer values
If we make use of the stretch they are directly integer
This is used to ensure, that toy the different images, are storing integer values
storage.mode(toy2bits[]) = "integer"

Plot the image
plot(toy2bits)
text(toy2bits, digits=2)

We change the radiance image
The lower number of bits = the lower amount of biodiversity

Let us make an image of four bits
16 potential values

toy4bits <- stretch(toy,minv=0,maxv=15)
storage.mode(toy4bits[]) = "integer"
plot(toy4bits)
text(toy4bits, digits=2)

How many values are possible for 8 bits?
256 potential values
Values range from 0 - 256
Now we should change the range to 256
And plot it again into R
toy8bits<-stretch(toy,minv=0,maxv=255)
storage.mode(toy8bits[]) = "integer"
plot(toy8bits)
text(toy8bits, digits=2)

The colors are the same. But values are different

Now we can plot all of them one after the other
Make use of the function: mfrow=c()
One row and 4 columns (1,4)

par(mfrow=c(1,4))
plot(toy)
text(toy, digits=2)
plot(toy2bits)
text(toy2bits, digits=2)
plot(toy4bits)
text(toy4bits, digits=2)
plot(toy8bits)
text(toy8bits, digits=2)

The image on the right, starting from the toy of 2 bits. 
Very similar to the radiance image

Run the code to close all the previous parameters
dev.off()

######################## Ninth code #########################
#############################################################
#############################################################
Explain to the software we are going to make use of moving window
By making use of the function: matrix
First set the moving window
We are going to make a window by 5 rows and 5 columns
Assign it the name: window
window<-matrix(1, nrow = 5, ncol = 5)

Then right window to see the five rows and columns
window

We will calculate the new value of the standard variation
The function we are going to make use of: focal
focal = calculation of certain values in a neighbourhood

Give it the name: sd_snt 
Make use of the function: focal
Make use of the first principle component in the sntpca image
Make us of the map. Link it to the first PC1
w should be the size of the moving window we created
Put the function to be standard deviation: sd
sd_snt<-focal(sntpca$map$PC1,w=window,fun=sd)

Make use of a color ramp palette (going from dark blue to red)
Assign it the name: cl
cl<-colorRampPalette(c('dark blue','green','orange','red'))(100)  

Plot the image by using the color ramp palette
plot(sd_snt,col=cl)

Put the two images next to each other: snt and sd_snt
By making use of the function: par
One row and two columns: 1,2
And give the plots the title: original image and diversity
par(mfrow=c(1,2))
plotRGB(snt,4,3,2, stretch="lin", main="original image") 
plot(sd_snt, col=cl, main="diversity")

(main is to give a name to the different images. 
But raster does not make use of the function
So it is not visible in the images)

######################## Tenth code #########################
#############################################################
#############################################################
We are going to make use of raster, rasterVis and rasterdiv
Recall the libraries
library(raster)
library(rasterVis)
library(rasterdiv)

Take a look at the latest data. The data we used last time
Dealing with worldwide

copNDVI - Copernicus reflectance in the NIR, and small reflection in Red (due to photosynthesis)
We will measure the difference between these values

Let us plot the NDVI
plot(copNDVI)

Blue color represent the water
reclassifying 
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

Make a level plot of this NDVI: levelplot()
To see the NDVI values with respect to the world map
State which data to level plot: copNDVI
levelplot(copNDVI)

The value of NDVI is larger within the equator - mainly primary forest = increasing the biomass
The value of NDVI is lower 30 degrees around the equator – mainly because of deserts
Another peak in the NDVI. At the top of the graph. This is due to the broad leaf and conifer forest
The equator forest is longitudinal structured. While the conifer forest is latitudinal structured
The taiga is not structured in 3 dimensions. The individuals/species are very similar to each other 
The vertical structure is very poor. The individuals are very similar
No plants on top of each other. Usually just one species at one place

Set my working directory
setwd("C:/lab/")

Now we can enter the faPAR
The faPAR is called faPAR10
Go to the lab folder

Let us import the data
Make us of the function: raster
Give it the name: faPAR10
10 meaning we used the factor 10 aggregated the data (professor already did for us)
faPAR10 <- raster("faPAR10.tif")

Make the same level plot we did, but with the faPAR10 instead  
Important to have PAR in cap - because R is sensitive. To not risk any misunderstandings
levelplot(faPAR10)

High NDVI in the north hemisphere and around the equator
What is happening to the faPAR?
The equator has a very high amount of photosynthesis in this area
Not all sunlight that is incoming, is reaching the soil
Most light is used by the plants
In top of the northen part. The faPAR is not as high as the NDVI
We are not only considering the energy
We are considering the chemical cycling by plants
In the conifer forest most light is going into the soil. All incoming light is not used by plants
Conifer forest: one individual after one an another. next to each other. very similar. and much light not used by plant = can easily reach the soil
Tropical forest: the opposite - many different individuals next to one and another, complex structures and almost no sunlight reaches the soil

Save as pdf, both NDVI image and faPAR10
Use the pdf function: pdf("")
Use the " - since we are going to save it outside of R
Give it the name copNDVI.pdf and faPAR10.pdf

pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()

pdf("faPAR.pdf")
levelplot(faPAR10)
dev.off()

Regression model between faPar and NDVI
Amount of erosion in a certain area presented in kilogram per square meter
erosion<-c(12, 14, 16, 24, 26,40, 55, 67)

Assign the heavy metals to a certain of numbers: hm
presented in ppm
hm<-c(30, 100, 150, 200, 260, 340, 460, 600)

Plot the relationship between the values
change the color: col=”red”
change the point character: pch=29
x-axis as erosion 
y-axis as heavy metals
plot(erosion, hm, col="red", pch=19, xlab="erosion", ylab="heavy metals")

Let us make the model between heavy metal and erosion
Make use of the function: lm
Let us give a name to the model : model1
model1<-lm(hm~erosion)

We can see the summary of the model
By using the function: summary()
And the name of the model: model1
summary(model1)

What is the value of the R square
These values are significantly related
The pattern we observe is far away from being random

Now we can put into the plot, the line between the two variables
How to do so?
One is a- intercept, b-slope of the curve
If you have two variables that are exact equal to each other = the value will be 1

The function is called: abline
The line described by a and b (multiple the erosion)
abline(model1)

We want to make the same estimations by the faPAR and NDVI
Go to iol site => code  => R code faPAR

Set my working directory
setwd("C:/lab/")

load the library raster
library(raster)

load the faPAR10 image by using raster()
faPAR10<-raster("faPAR10.tif")

Load the library rasterdiv
library(rasterdiv)

Plot the faPAR10 image
plot(faPAR10)

We want to see how much the faPAR10 is related to the copNDVI

To know how many cells are inside the faPAR10. Just put the name
faPAR10

Recall the library sf
library(sf)

Inside that package there is a function that select random points
Directly select random points from an image
Make use of that function: random.points()
Assign it the name: pts
The name of the image: faPAR10
The number of points: 1000
pts<-random.points(faPAR10,1000)

Extraction of photosynthesis? and biomass?
The function is called: extract
What do we want to extract: copNDVI 
We want to put each value on top of the point
Every single point will have the value: pts
Assign it the name: COPNDVIp
copNDVIp<-extract(copNDVI, pts)

Do the same for faPAR10
faPAR10p <- extract(faPAR10, pts) 

We have put the values of the NDVIp

Let us make the model between the photosynthesis and biomass
Make use of the function: lm
Let us give a name to the model : model2
model2<-lm(faPAR10p~copNDVIp)

See the summary of the model
summary(model2)

Plot the relationship between the values
Change the color: col=”green”
Change the point character: pch=19
x-axis as biomass
y-axis as photosynthesis
plot(copNDVIp, faPAR10p, col="green", xlab="biomass", ylab="photosynthesis")

Put the line between the two variables
The color of the line: red
abline(model2, col="red")

######################## Eleventh code ######################
#############################################################
#############################################################
Download the image from iol: sentinel
Save the image in the Lab folder

Set my working directory to lab folder
setwd("C:/lab/")

Recall the package raster
library(raster)

Importing the image from lab folder
Raster is going to import a single level band
But satellite images are composed by different bands
Red band, Green band, blue band, NIR band

By using the function: brick
You will import all the levels of the images
Put the name of the image: snt_r10.tif
brick("snt_r10.tif")

Assign the image the new name: snt
snt<-brick("snt_r10.tif")

To see all the information of the image
Just run the name of the image
snt

The max value is very high

Now we are going to plot the image
Plotting the image by using the function: plot
plot(snt)

The different colors represent different values. Ranging from high to lower

Band 1 - blue
Band 2 - green
Band 3 - red
Band 4 - NIR

Now we will plot it with RGB plot: plotRGB()
State which data to plot: snt
Putting red over red band, green over green band and blue over blue band: 3, 2, 1
Make a linear stretching: stretch=”lin”
plotRGB(snt, 3, 2, 1, stretch="lin")

Not a typical tropical forest
With mountain complexity
There might be slopes there might be mountains 
It is very complex surroundings
Many parts that are related to each other

Now we are going to make us of NIR, RED and GREEN
Putting NIR over the red band, the red over the green band and green over the blue band
plotRGB(snt, 4, 3, 2, stretch="lin")

The standard deviation (SD)
Can only be calculated on one single layer
We are going to pass from 2 dimensions into 1 dimension

To see the values of the different bands
pairs(snt)

We want to reduce the number of bands into just a few bands

We want to do the PCA analysis
Recall the library RStoolbox
library(RStoolbox)

Reduce all the amounts of bands on the levels, into just one layer
Assign it the name: sntpca
Make use of the function: rasterPCA
sntpca<-rasterPCA(snt)

How many variables does it have?
Run the code of the name to see the information
sntpca

The first principle component
We are linking the model by using the dollar sign

To see the information of the model
The first principle component
It is explaining the 70% of the variability
summary(sntpca$model)

Now we can plot the image. Link it to the map
plot(sntpca$map)

Plot the RGB image. Link it to the map. 
plotRGB(sntpca$map, 1, 2, 3, stretch="lin")

We will create a moving window, in order to make calculations
First, we need to decide the size of the window
By moving the window, we will calculate a new standard derivation

First build the window
We will assign it the name: window
It is a matrix, and we will put the number 1
We are going to make a matrix by 5 by 5 pixels
We will make the window by 5 rows and 5 columns
window<-matrix(1, nrow =5, ncol =5)

To recall it, and to see the information
window

Now we will do the calculation
We will make use of the function: focal()
It will calculate the neighbourhood. The values around the focal cell by the moving window.
State which data to do the calculation on: sntpca$map$PC1
W should be set to the window we created: window
Fun should be set to standard deviation: fun=sd
Assign it the name: sd_snt
sd_snt<-focal(sntpca$map$PC1, w=window, fun=sd)

Create a color ramp palette
Plot the sd_snt
cl <- colorRampPalette(c('dark blue','green','orange','red'))(100) # 
plot(sd_snt, col=cl)

Make a comparison of the original image and the standard deviation image
Put the titel original image and diversity above the plots
par(mfrow=c(1,2))
plotRGB(snt,4,3,2, stretch="lin", main="original image") 
plot(sd_snt, col=cl, main="diversity")

######################## Twelfth code #######################
#############################################################
#############################################################
Download the data from the iol site
The image called: cladonia_stellaris_calaita.JPG
Save the image into the Lab-folder

Let us load the image into R
But first, set my working directory in order to do so
setwd("C:/lab/")

Now import the file
There are two different functions to import files
Two functions into the raster package: raster or brick
Raster function: import one single layer - one single band
Brick function: import several layers - several bands

There are 3 different layers in the image we are going to use
Therefore, we should use brick function over raster

First recall the library
library(raster)

Now we can make use of the function: brick()
And state the name of the file: cladonia_stellaris_calaita.JPG
(To see the exact name of the file press properties)
Assign a name to the file: clad
clad<-brick("cladonia_stellaris_calaita.JPG")

Now we should plot the image in order to see it
We will use the RGB plot: plotRGB (R=red G=gree B=blue)
We will plot it in the same bands: 1- red, 2-green and 3-blue
Make a linear stretching: stretch=”lin)
plotRGB(clad, 1,2,3, stretch="lin")

We will create a moving window, in order to make calculations
First, we need to decide the size of the window
By moving the window, we will calculate a new standard derivation

First build the window
We will assign it the name: window
It is a matrix, and we will put the number 1
We are going to make a matrix by 3 by 3 pixels
We will make the window by 3 rows and 3 columns
window<-matrix(1, nrow = 3, ncol = 3)

To recall it, and to see the information
window

Now we will do the calculation
We will make use of the function: focal()
It will calculate the neighbourhood. The values around the focal cell by the moving window.
State which data to do the calculation on: clad
W should be set to the window we created: window
Fun should be set to standard deviation: fun=sd
Assign it the name: sd_sntr
sd_sntr<-focal(clad, w=window, fun=sd)

To see the variabilities of the pixels
pairs(clad)

Let us do the PCA-analysis of clad
First recall the library: RStoolbox
library(RStoolbox)

Let us make a useful name of the image: cladpca
The function to do a pca is: rasterPCA()
Do it of: clad
cladpca<-rasterPCA(clad)

To see all the information of the data
cladpca

You have the call
The function we used, and linked it to the image
The model in which you can see the output, to see the correlation
The map - different principle components: PC1 PC2 PC3
Attr (=attribute): class
The end - which library used = RStoolbox

To see how much of the information is carried out in the PC1
summary(cladpca$model)

The correlation in the first principle component = 98%

To plot cladpca 
plotRGB(cladpca$map, 1, 2, 3, stretch="lin")

Now let us make the measurements in the clad image
We already set the size of the window (3 by 3 pixels)
Now we need to make use of the function: focal
Linking the map to the cladpca, and linking it to the first principle window
Using the window we already set: w=window
Assign it the name: sd_clad 
Function: sd (standard derivation)
sd_clad<-focal(cladpca$map$PC1, w=window, fun=sd)

If it is not visible (because too large)
We can aggregate the image
To do so, make use of function: aggregate()
Put the file you want to aggregate:
Assign it the name PC1_agg
Aggregate it with factor 10: fact=10
PC1_agg<-aggregate(cladpca$map$PC1, fact=10)

Make the new measurements
sd_clad_agg<-focal(PC1_agg, w=window, fun=sd)

Let us make a color ramp palette
Let the ramp palette change from yellow to violet to black
Assign the new color ramp palette the name: cl
cl<-colorRampPalette(c('yellow','violet','black'))(100)

Compare the two images. The original one with the aggregated one
By using the par function with multifunctional row: par(mfrow=c
The number of rows: 1
The number of columns: 2
par(mfrow=c(1,2))

To see the two images ( sd_clad and sd_clad_agg) next to each other 
we have to plot them, by using the function: plot
plot(sd_clad, col=cl)
plot(sd_clad_agg, col=cl)

What is the meaning of the new image?
Structural measurements - the structural complexity
If we aggregate the image - we get something similar to a mosaic 

Make a comparison of the original image and the standard deviation image
par(mfrow=c(1,2))
cl <- colorRampPalette(c('yellow','violet','black'))(100) 
plotRGB(clad, 1,2,3, stretch="lin")
plot(sd_clad, col=cl)

close everything and save workspace
dev.off()
q()

######################## Thirteenth code ####################
#############################################################
#############################################################
Set my working directory
setwd("C:/lab/")

Put the downloaded dataset into Lab folder
The name of the file: c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc
The file is now in the Lab folder

Let us import the file from Lab folder into R
We need to recall some libraries: raster and ncdf4
ncdf4 in order to import the ncd-files. 
Most Copernicus data are in this form
Sometimes it is included in the raster package, but we will install the new package
install.packages("ncdf4")

Now recall the libraries we need:
library(raster)
library(ncdf4)

raster function = going to import one single layer 
brick function = going to import several layers

Import the image
We will make use of the function: raster()
Put the name of the file that should be imported
To find the name of the file
Go to Lab folder, and right click on properties: 
Assign it a new name: snowmay 
snowmay<-raster("c_gls_SCE_202005260000_NHEMI_VIIRS_V1.0.1.nc")

Warning message
The image is covering the whole world map
But we were only downloading a part of the whole world map (Europe)
-180  top left until 180 top right = latitude
-90 bottom left until 90 top left = longitude

Now we can plot the data
Let us make a color ramp palette that is nice for snow coverage : dark blue - light blue
cl<-colorRampPalette(c('darkblue','blue','light blue'))(100)

### Exercise: To make a plot of the image with the color ramp palette
plot(snowmay, col=cl)

How to see the numbers of pixels in the image
Just put the name of the image
snowmay

Continue next lecture
----------------------------------------------

How to apply a function to a set of data
Go to iol site
Download the folder called snowdata.zip
Unzip it and put in Lab folder

Now we are going to play with this data
To import all the data together
The first thing we should do is to create a new folder in Lab called: snow
Copy the files and put into the new folder Snow

The first thing we should do is to set the correct working director
Since the data is in the folder called snow
setwd("C:/lab/snow/")

How to import the data
Make use of the function: raster ("")
Put the name of the file: snow2000.tif
Assign it the name: snow2000
snow2000<-raster("snow2000r.tif")

How to import several data at once
(In a slow manner)
snow2000 <- raster("snow2000r.tif")
snow2005 <- raster("snow2005r.tif")
snow2010 <- raster("snow2010r.tif")
snow2015 <- raster("snow2015r.tif")
snow2020 <- raster("snow2020r.tif")

To plot all the images together with the color ramp palette we created last time
We will make use of the function: par()
multiframe row: mfrow=
series of number: c()
Two rows and 3 columns
par(mfrow=c(2,3))

plot(snow2000, col=cl)
plot(snow2005, col=cl)
plot(snow2010, col=cl)
plot(snow2015, col=cl)
plot(snow2020, col=cl)

##########################
Now let us import data in a fast manner

We will make use of a function called: lapply
Apply function over a list or vector
List of data
And want to apply a function
What function do we want to apply: raster
That is the function we use to import single layers
But we will apply the function 

First of all, make a list of the files we want to import
The function we will use is: list.files()
It will make list of the files in a certain place
We need to state the pattern we want them to be listed
For our case the patter is: snow20
Then after snow20 the pattern of the images change
Patter = the common letters of the files we want to import in the list
Assign it the name: rlis
rlist<-list.files(pattern="snow20")

See the output (the images) of the function
rlist

Now we have the list of the files that have the common patter
In total 5 images

Now we want to make use of the function: lapply
And to all the files (rlist) we want to apply the function raster over the list
Assign it the name: import
import<-lapply(rlist, raster)

Now we can make a sort of stack of the images
So it looks like a satellite image
So the images became set together

Make use of the function: stack()
The name of the files: import
Assign it the name: snow.multitemp
snow.multitemp<-stack(import)

Plot the images with the color ramp palette
plot(snow.multitemp, col=cl)

Let us make a prediction
Make use of the function: source()

First go to the iol site
Download the file called prediction.r
Save it as a link, and save it in the Lab => Snow folder

Then we can make a model by putting one line of code: source("")
The name of the file: prediction.r
source("prediction.r")

#((I had some problems with importing my files, so I could not make the prediction. So I only took notes from this lecture. Professor helped me after the lecture))
-------------- 2020-06-03 ---------------
Set my working directory
We are going to change the traditional working directory
This is because the data we are going to make use of in the folder called snow
The folder snow is located in the folder lab
setwd("C:/lab/snow/")

### Exercise: import the snow cover images all together (as we did previous time)
Firstly, we want to apply the raster function to a certain list of files
Then we want to stack all of the images into one single image
We assigned the name to the new file: snow.multitemp
In order to plot the dataset we made
We need to make a color ramp palette
In that manner we can plot everything all together

library(raster)
library(ncdf4)
rlist<-list.files(pattern="snow20")
rlist
import<-lapply(rlist, raster)
snow.multitemp<-stack(import)
cl<-colorRampPalette(c('darkblue','blue','light blue'))(100)
plot(snow.multitemp, col=cl)

Let us see the previous prediction we made
Let us load the prediction that we saved. Alternative download the data from iol
The data is called predicted.2025.norm
Put the data in the snow folder inside lab

Let us import the image
In order to import images, we have two possibilities: raster or brick
Raster import a single layer
Brick import several bands/images all together

We are just going to import one image, so we will make use of: raster() 
The name of the raster is called: 
Assign it the name: prediction
prediction<-raster("predicted.2025.norm.tif")

Let us plot the imported data
Let us make us of the function: plot ()
The name of the data: prediction
Plot it with the previous used color ramp palette: col=cl
plot(prediction, col=cl)

By importing the snow images from the different years (2000-2020)
We were able to calculate the correlation between the snow coverage and the years. 
And by doing so we can make a prediction of the snow coverage by year 2025

First of all
Let us export the output
We made the calculation
And we want to send the output to a college
How to export the prediction output
The function is: writeRaster
It is writing the entire raster object into a file as you chose
The name of the file is: prediction
The name of the final outcome: final.tif

writeRaster(prediction,"final.tif")
Creating the new data into the format tif. 
Importing the data to our snow folder outside of R

Let us make a final stack
Let us assign it the name: final.stack
Let us make use of the function: stack
The name of the file is called: snow.multitemp
Give it a new name: prediction
final.stack<-stack(snow.multitemp, prediction)

Let us plot the final stack
By using the color ramp palette
plot(final.stack, col=cl)

Let us make the data into pdf file
Make us of the function: pdf
Give it the name: my_final_exciting_graph.pdf
pdf("my_final_exciting_graph.pdf")
plot(final.stack, col=cl)
dev.off()

Using " because we are going to export something outside of R
Let us make the data into png file
Make us of the function: pnf
Give it the name: my_final_exciting_graph.pnf
png("my_final_exciting_graph.png")
plot(final.stack, col=cl)
dev.off()
How to increase the resolution of the pnf image?
Change the dimension of the pnf file
The point per pixels

######################## Fourteenth code ####################
#############################################################
#############################################################
Download the data from iol
The data is called NO2 data

Open the downloaded file
It contains 13 different images
The images are ranging from January - March
Showing the NO2 concentration

Create a new folder NO2 into the lab folder
Extract + import all the different images from the downloaded folder into the NO2 folder

Let set my working directory
Which should be different from usual
Since we want to make use of data from our new folder
setwd("C:/lab/NO2/")

First check the Lab folder
To see if I have a NO2 folder inside it
Check so I have all the downloaded data inside

Go to the previous repositories about the R code script called snow
This is to check how we previously imported several images

We applied the raster function to all the images
By using the function: lapply
Apply a function over a list of images
We made a list of the several images - a list based on the patter snow
Then we made a stack, which make it easier to plot all the images at once
Instead of using par function

### Exercise - import all the images in the NO2 folder into R, with the lapply function
Import them in the same way we did with the images of snow

Set my working directory
setwd("C:/lab/NO2/")

Now recall the libraries we need:
library(raster)  = we are only importing the first layer
library(ncdf4)

First of all, make a list of the files we want to import
The function we will use is: list.files()
It will make list of the files in a certain place
We need to state the pattern we want them to be listed
For our case the patter is: EN
Then after EN the pattern of the images change
Patter = the common letters of the files we want to import in the list
Assign it the name: rlis
rlist<-list.files(pattern="EN")

See the output (the images) of the function
rlist

Now we have the list of the files that have the common patter
In total 13 images

Now we want to make use of the function: lapply
And to all the files: rlist
 And we want to apply the function raster over the list: raster
Assign it the name: import
import<-lapply(rlist, raster)

Now we can make a sort of stack of the images
So it looks like a satellite image
So the images became set together

Make use of the function: stack()
The name of the files: import
Assign it the name: NO2.multitemp
NO2.multitemp<-stack(import)
# ((EN<-stack(import) professor assigned this name. so I changed mine too, to more easily follow the next steps))

Plot the images with a color ramp palette
cl<-colorRampPalette(c('yellow','orange','red','darkred'))(100)
plot(NO2.multitemp, col=cl)
# plot(EN, col=cl)

Let us make a plot of only the first (EN_0001) and the last (EN_0013) images
The January and March images
Make use of the function: par(mfrow=c()
Make 1 row and 2 columns
par(mfrow=c(1,2))
plot(EN$EN_0001, col=cl)
plot(EN$EN_0013, col=cl)
In case I would face any problem
dev.off()
                              
 What is the meaning?
The computer is showing color in images in the RGB space
 If there are higher values in the image 13 it will become blue
 If there are higher values in the image 1 it will become red
                              
  Make an RGB plot of 3 images in the stack                          
 0001 is the first image in the stack 
 r=1
 0007 is middle image in the stack is 
 g=7
 0013 is the last image in the stack
 b=13
 plotRGB(EN, r=1, g=7, b=13, stretch="lin")
                              
 If we have red values = high values in the first image = January
 We can see few blue spots because not so many higher values in March

Let us make a different map
Where we subtract the differences from image 1 of image 13
Let us assign it the name: dif
Making use of the $ to link the images to the stack
Let us make a new color ramp palette: cld
dif<-EN$EN_0013-EN$EN_0001
cld<- colorRampPalette(c('blue','white','red'))(100) # 
plot(dif, col=cld)

Let us see how to make some statistics
Different statistics to compare data
Let us make a boxplot
It is one of the easiest functions to use in order to compare data
What is a boxplot? - It is a statistical function
Mean(c(22,23,24,24,24))

Now we are going to make a boxplot
Let us make use of the function: boxplot()

# quantitative estimate
Take all the data from the first image and the last image
boxplot(EN)
Remove the outlines
Make us of the function: outline = false
boxplot(EN,outline=F)

Let us put the boxes horizontally
Make use of the function: horizontal = true
boxplot(EN,outline=F, horizontal=T)

boxplot(EN,outline=F, horizontal=T, axes=T)

We can plot the data of the first image with the data of the last image
plot(EN$EN_0001, EN$EN_0013)

What if we put the 01 image at the y axis, and the 13 image at the x axis
See how one image have changed with respect to the other
In our hypothesis the values in image 13 should be lower than with respect to image 1

First of all let us plot the images
plot(EN$EN_0001, EN$EN_0013)

Then we should plot the 1 to 1 line
Make use of the function: abline()
Change the color to the line: col=”red”
abline(0,1,col="red")

#### 1:1 (abline) line with the snow data
Set my working directory
setwd("C:/lab/snow/") 

Let us make a list 
List with the pattern = snow20
rlist<-list.files(pattern="snow20")
rlist
 
import<-lapply(rlist, raster)
snow.multitemp<-stack(import)
 
import<-lapply(rlist, raster)
snow.multitemp<-stack(import)

Let us make comparisons between 2010 and 2020
plot(snow.multitemp$snow2010r, snow.multitemp$snow2020r)
Let us plot the abline
abline(0,1,col="red")
                              
Comparison between 2000 and 2020
plot(snow.multitemp$snow2000r, snow.multitemp$snow2020r)
abline(0,1,col="red")
                              
Since the points are under the line = a decrease in snow cover
This is to show the difference in snow in different times                                                

######################## Fifteenth code #####################
#############################################################
#############################################################
Set my working directory
Set it to the Lab folder
Since we are going to make use of data in that folder
setwd("C:/lab/")

Now we are going to see two possibilities on how to make use of a specified part of a downloaded data
Images downloaded from Copernicus, we can use a particular part (instead of global perspective) 
The two functions: zoom or crop
First import the image

Check what is the name of the image
The name is: c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc

We need some libraries to work with the image
Recall the libraries we need: raster and ncdf4
library(raster)
library(ncdf4)

Import the data: c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc
Assign the imported data the name: snow
Use the library: raster
Make use the " ", since we are going outside of R to import the data into R
snow<-raster("c_gls_SCE_202005260000_NHEMI_VIIRS_V1.0.1.nc")

Let us make a color ramp palette: ranging from dark blue to light blue
Assign the color ramp palette the name: cl
cl<-colorRampPalette(c('darkblue','blue','light blue'))(100)

Firstly we need to specify which extent we want to zoom in, in the data/image
(here we wanted to zoom in on Italy - so the numbers correspond to the size of Italy)
The first two numbers are ranging in longitude 
The last two numbers are ranging in latitude
Assign it the name: ext
ext<-c(0, 20, 35, 50)

Now we will make use of the function: zoom()
First state which image you want to zoom
The one we previously imported: snow
State the extension: ext= (same name as the extension you previously made) ext
zoom(snow, ext=ext)

Now we will make use of the function: crop()
Assign it a name: snowitaly
State which image you want to apply the function onto: snow
State the previously made extension: ext
snowitaly<-crop(snow, ext)

Now we should plot the image: plot()
State the name of the image we want to plot: snowitaly
Make use of the color ramp palette we created: col=cl
plot(snowitaly, col=cl)

Another example with the function zoom
Re-put the zoom function: zoom()
Instead of putting the previously made extension 
We will draw an extension: ext=drawExtent()
zoom(snow, ext=drawExtent())

Click on a certain point in the image and draw your own rectangular
This will be the zoom you make

Save the working space
q()

######################## Sixteenth code #####################
#############################################################
#############################################################
Install the package: for Species Distribution Modelling = sdm
install.packages("sdm")

Recall the package
library(sdm)

Recall some other libraries
library(raster)
library(rgdal)

We are going to import the data
We are going to make use of the function: system.file()
State the name of the data that should be imported: external/species.shp
Assign it the name: file
file <- system.file("external/species.shp", package="sdm")

Now we are going to use the graphical part of the file
Coupling the graphical points with the data inside
To create a shapefile make use of the function: shapefile()
State the name of the data we want to apply the function on: file
Assign it the name: species
species <- shapefile(file)

Now plot the image
Make use of the function: plot()
State the name of the data we want to plot: species
plot(species)

To see the information of the data
species

Let us see the latitude
We are somewhere in Spain (professor could tell by the coordinates)

Let us link Occurrence with species
species$Occurrence

Let us plot the dataset species
A condition is put by using [ ]
By putting double == you state it has to be present
We want to make sure that the species occur: 1
The comma state that the condition finish
Make the points into color: blue
Point character to layout: 16
plot(species[species$Occurrence == 1,],col='blue',pch=16)

Now let us plot the points of the absence
No species occur: 0
Make the points in red color
points(species[species$Occurrence == 0,],col='red',pch=16)

Let us make use of system file function: system.file()
path<- system.file("external", package="sdm")

Let us make a list
The data is inside the external folder called: external
We have to state the path: path
We have to state the patter or the files we want to make the list of: asc$
We have to state that we want to make use of the full name: full.name=T
lst <- list.files(path=path,pattern='asc$',full.names = T)

What are the files into the list?
To see the list, simply type
lst

Look at the path of the files
C -> Users -> iidag -> OneDrive -> Dokument

Let us make a stack of the files we made the list of:
Elevation
Precipitation
Temperature
Vegetation
Assign it the name: preds
preds<-stack(lst)

Plot the stack
plot(preds)

We are going to change the color ramp palette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

Now we are going to make use of the predictions
To see the distribution of animals

We are going to plot every single predicter
Plot where the species are present
Link preds with the elevation
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer low latitudes

Do the same with the temperature
plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer high temperatures

Do the same with the precipitation
plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer medium precipitation

Does this species like to be covered by other plants on top?
Does this species like to not be in shadow of other species?
plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer not fully cover, or not absent of other plants

Now we are going to create a data object by using: sdmData
State which data we want to apply the function on (the shapefile): train=species
Put the predictors as preds: predictors=preds
Assign it the name: d (data)
d<-sdmData(train=species, predictors=preds)

To see all the information
d

Now we can make the model
We are going to make a linear model
The data we are going to make use of: d
Assign it the name: m1 (model one)
We are going to make use of the function: sdm
We are going to see the occurrence: Occurrence ~ 
State to the model that we make use of the predictors: elevation + precipitation + temperature + vegetation
The data is equal to d
The methods we are using it: methods="glm"
glm is used to fit generalized linear models. It gives a linear prediction
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods = "glm")

Let us make the map
The map can be mad, by using the function: predict()
State which model you want to make use of: m1
We are going to base the model of the predictions: newdata=preds
Assign it the name: p1 (prediction one)
p1 <- predict(m1, newdata=preds)

Let us plot the prediction: plot(p1)
Make us of the color ramp palette: col=cl
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

Stack the predictions and prediction map: preds and p1
Assign it the name: s1
s1< stack(preds,p1)

Let us plot the maps of the predictions and the final prediction model
Make use of the color ramp palette: col=cl
plot(s1, col=cl)

######################## Seventeenth code ###################
#############################################################
#############################################################
