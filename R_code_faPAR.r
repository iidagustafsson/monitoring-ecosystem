Chemical cycling from Satellite images

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
