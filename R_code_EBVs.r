# R_code_EBVs.r

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
