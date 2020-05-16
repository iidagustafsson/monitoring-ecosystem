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








