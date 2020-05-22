R_code_radiance.r

Recall the raster library
library(raster)

We are not going to import any data
So no need to set our working directory
We are going to make the data ourselves

We are going to create a new raster
Two columns and two rows
Assign it the name: toy
toy<-raster(ncol=2,nrow=2,xmn=1,xmx=2,ymn=1,ymx=2)

We are going to put these numbers into the raster
Series of values - c () function
Assign it the name: values(toy)
values(toy) <- c(1.13,1.44,1.55,3.4)

Put the data in each pixle
First pixle (upper left) 1.13, second (lower left) 1.44 
third (upper right) 1.55 and fourth (lower right) 3.4

Now we can plot toy
We can also put the values of toy, by putting text of toys
Using two decimals: digits=2
plot(toy)
text(toy, digits=2)

this is an example of an radiance image
How much energy is reflecting by the object
And arrives to the satallite
This is calculated by watts or square meter

You can most of the times download the radiance image = the numbers

Four potential values
An image with 2 bits (2^2)
How would such an image looks like?

We assign a code , a value of the ranging (from 0 to 3)
We have four possible values

Let us make a image
Minimun: 0
Maximum: 3
Make use of the function: stretch (which stretch values)
Assign it the name: toy2bits
toy2bits<-stretch(toy,minv=0,maxv=3)
storage.mode(toy2bits[]) = "integer"

Plot the image
plot(toy2bits)
text(toy2bits, digits=2)

We change the radiance image
The lower amount of bits = the lower amount of biodiversity

Let us make a image of four bits
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
toy8bits <- stretch(toy,minv=0,maxv=255)
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

The storage mode is to put as integer
Making use of integer values
If we make use of the stretch they are direclty integer
This is used to ensure, that toy the different images, are storing integer values


Regression model between faPar and NDVI
Amount of erision in a certain area presented in kilogram per square meter
erosion<-c(12, 14, 16, 24, 26,40, 55, 67)

assigne the heavy metelas to a certain of numbers
presented in ppm
hm<-c(30, 100, 150, 200, 260, 340, 460, 600)

lot the relatinship between the values
change the color: col
change the point character: pch
x-axis as erosion 
y-axis as heavy metals
plot(erosion, hm, col="red", pch=19, xlab="erosion", ylab="heavy metals")

lets make the model between the function
make use of the function: lm
Lets give a name to the model : model1
model1<-lm(hm~erosion)

We can see the summary of the model
By using the function: summry
And the name of the model
summary(model1)

what is the value of the R square
These values are signifialnty related
The pattern we observe is far away from being random

Now we can put into the plot, the line between the two virables
How to do so?
One is a- intercept, b-slope of the curve
If you have two virables that are exact equal to each other = the value will be 1

The function is called: abline
The line discribed by a and b (multiple the erosion)
abline(model1)

We want to make the same estimations by the faPAR and NDVI
Go to iol site => code  => R code faPAR

Set my working directory
setwd("C:/lab/")

load the library raster
library(raster)

load the faPAR10 image
faPAR10 <- raster("faPAR10.tif")

load the library rasterdiv
library(rasterdiv)

Plot the faPAR10 image
plot(faPAR10)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA), right=TRUE)

We want to see how much the faPAR10 is related to the copNDVI

To know how many cells are inside the faPAR10. Just put the name
faPAR10

Recall the library sf
It is a function that select random points
Directly select random points from a image

assign it the name: pts
the name of the image: faPAR10
the number of pints: 1000
pts <- random.points(faPAR10,1000)

library(sf) # to call st_* functions
random.points <- function(x,n)
{
lin <- rasterToContour(is.na(x))
pol <- as(st_union(st_polygonize(st_as_sf(lin))), 'Spatial') # st_union to dissolve geometries
pts <- spsample(pol[1,], n, type = 'random')
}


pts <- random.points(faPAR10,1000)


extraction of 
the function is called: extract
what do we want to extract: copNDVI 
We want to out each values on top of the point
Every single point will have the value: pts
assign it the name: COPNDVIp

faPAR10p <- extract(faPAR10, pts, 

pts <- random.points(faPAR10,1000)
copNDVIp <- extract(copNDVI, pts)
faPAR10p <- extract(faPAR10,pts)


We have put the values of the NDVIp
                    
               pts <- random.points(faPAR10,1000)
copNDVIp <- extract(copNDVI, pts)
faPAR10p <- extract(faPAR10,pts)

 
