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
