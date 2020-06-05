Download the data from iol
The data is called NO2 data

Open the downloaded file
It contains 13 different images
The images are ranging from January - March
Showing the NO2 concentration

Create a new folder NO2 into the lab folder
Extract + import all the different images from the downloaded data into the NO2 folder

Let set my working directory
Which should be different
Since we want to make use of data from our new folder
setwd("C:/lab/NO2/")

First check the Lab folder
To see if I have a NO2 folder inside it
Check so I have all of the data inside

Go to the previous repositories about the R code script called snow
This is to check how we previously imported several images

We applied the raster function to all of the images
By using the function: lapply
Apply a function over a list of 
We made a list of the several images - a list based on the patter snow
Then we made a stack, which make it easier to plot all of the images at once
Instead of using par function

### Exercise - import all the images in the NO2 folder into R, with the lapply function
Import them in the same way we did with the images of snow

Set my working directory
setwd("C:/lab/NO2/")

Now recall the libraries we need:
library(raster)  = we are only importning the first layer
library(ncdf4)

First of all make a list of the files we want to import
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
And to all the files (rlist) we want to apply the function raster over the list
Assign it the name: import
import<-lapply(rlist, raster)

Now we can make a sort of stack of the images
So it looks like a satallite image
So the images became set together

Make use of the function: stack()
The name of the files: import
Assign it the name: snow.multitemp
NO2.multitemp<-stack(import)
# EN<-stack(import)

Plot the images with the color ramp palette
cl<-colorRampPalette(c('yellow','orange','red','darkred'))(100)
plot(NO2.multitemp, col=cl)
# plot(EN, col=cl)

Let us make a plot of only the first and the last images
The january and march images
Make use of the function: par(mfrow=c()
Make use 1 row and 2 columns
par(mfrow=c(1,2))
plot(EN$EN_0001, col=cl)
plot(EN$EN_0013, col=cl)
In case I would face any problem 
                              dev.off()
 What is the meaning 
                              The computer is showing color in images in the RGB space
                              If there are higher values in the image 13 it will become blue
                              If there are higher values in the image 1 it will become red
                              
                              
