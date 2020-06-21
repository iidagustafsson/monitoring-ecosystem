2020-05-27 – focal on Cladonia

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
