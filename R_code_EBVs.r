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

Plot them 
par(mfrow=c(1,2))
plotRGB(snt,4,3,2, stretch="lin", main="original image") 
plot(sd_snt, col=cl, main="diversity")


#######################Next lecture##########################
2020-05-27
Download the data from the iol site
The image called: cladonia_stellaris_calaita.JPG
Save the image into the Lab-folder

Let us load the image into R
Set my working directory in order to do so
setwd("C:/lab/")

Now import the file
There are two different functions to import files
Two functions into the library: raster or brick
Raster function : import one single layer - one single band
Brick function: import several layers - several bands

There are 3 differnt layers in this image
Therefore we should use brick

First recall the library
library(raster)

Now we can make use of the function: brick
And use the name of the file
To see the name of the file press properties: clad
Assign a name to the file: clad
clad <- brick("cladonia_stellaris_calaita.JPG")

Now we should plot the image in order to see it
We will use the RGB plot: plotRGB (R=red G=gree B=blue)
We will plot it in the same bands : 1- red, 2-green and 3-blue
plotRGB(clad, 1,2,3, stretch="lin")

We will create a moving window, in order to make calculations
First we need to decide on the size of the window
By moving the window we will calculate a new standard derivation

First build the window
We will assign it the name window
It is a matrix, and we will put the number 1
We will make a window of 3 by 3 pixels (3 rows and 3 columns)
window <- matrix(1, nrow = 3, ncol = 3)

To recall it, and to see the information
window

Now we will do the calculation
We will make use of the function: focal
It will calculate the neighboorhood.....

The focal function will be 

To see the viaribilities of the pixels
pairs(clad)

Let us do the PCA-analysis
First recall the library: RStoolbox
library(RStoolbox)

Lets make a useful name of the image: cladpca
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

Now let us make the measurments in the clad image
We already set the size of the window (3 by 3)
Now we need to make use of the function: focal
Linking the map to the cladpca, and linking it to the first principle window
Using the window we already set: w
Assign it the name: sd_clad 
Function: sd (standard derivation)
sd_clad<-focal(cladpca$map$PC1, w=window, fun=sd)

If it is not visable (because too large)
We can aggregate the image
To do so, make use of function: aggregate()
Put the file you want to aggregate:
Assign it the name PC1_agg
Aggregate it with factor 10: fact=10
PC1_agg<-aggregate(cladpca$map$PC1, fact=10)

Make the new measurements
sd_clad_agg<-focal(PC1_agg, w=window, fun=sd)

Lets make a color ramp palette
Let the ramp palette change from yellow to violet to black
Assign the new color ramp palette the name: cl
cl<-colorRampPalette(c('yellow','violet','black'))(100)

Compare the two images. To original one with the aggregated one
By using the function with multifunctional row: par(mfrow=c
The number of rows: 1
The number of columns: 2
par(mfrow=c(1,2))

To see the two images ( sd_clad and sd_clad_agg) next to each other 
we have to plot them, by using the function: plot
plot(sd_clad, col=cl)
plot(sd_clad_agg, col=cl)

What is the meaning of the new image?
Structural measurements - the structual complexity
If we aggregate the image - we get something similar to a mosaique 

Make a comparison of the original image and the standard deviation image
par(mfrow=c(1,2))
cl <- colorRampPalette(c('yellow','violet','black'))(100) 
plotRGB(clad, 1,2,3, stretch="lin")
plot(sd_clad, col=cl)

We are going to make a matrix by 3 by 3 pixels



