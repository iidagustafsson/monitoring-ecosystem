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

Now we can plot the image
plot(sntpca$map)

Plot the RGB image
plotRGB(sntpca$map, 1, 2, 3, stretch="lin")

############## BIODIVERSITY MEASUREMENT ###################

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
