How to import downloaded files from Copernicus into R

Set my working directory
setwd("C:/lab/")

Put the downloaded dataset into Lab folder
The name of the file: c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc
The file is now in the Lab folder

Let us import the file from Lab folder into R
We need to recall some libraries: raster and ncdf4
ncdf4 in order to import the ncd-files. 
most copernicus data are in this form
sometimes it is included in the raster package, but we will install the new package
install.packages("ncdf4")

Now recall the libraries we need:
library(raster)
library(ncdf4)

raster function = going to import one single layer 
brick function = going to import several layers

Import the image
we will make use of the function: raster()
Put the name of the file that should be imported
To find the name of the file
Go to Lab folder, and right click on properties
Assign it a new name: snowmay 
snowmay<-raster("c_gls_SCE_202005260000_NHEMI_VIIRS_V1.0.1.nc")

Warning message
The image is covering the whole world map
But we were only downloading a part of the whole world map (europe)
-180  top left until 180 top righ = latitude
-90 bottom left until 90 top left = longitude

Now we can plot the data
Let us make a color ramp palettet that is nice for snowcoverage : darkblue - light blue
cl<-colorRampPalette(c('darkblue','blue','light blue'))(100)

### Exercise: To make a plot of the image with the color ramp palette
plot(snowmay, col=cl)

How to see the numbers of pixles in the image
Just put the name of the image
snowmay


How to apply a function to a set of data
Go to iol site
Download the folder called snowdata.zip
Unzip it an put in Lab folder

Now we are going to play with this data
To import all the data together
The first thing we should do is to create a new folder in Lab called: snow
Copy the files and put into the new folder Snow

First of all
How to import several data at once
In a slow manner to import the set

The first thing we should to is to set the correct working director
Since the data is in the folder called snow
setwd("C:/lab/snow/")

How to import the data
Make use of the function: raster ("")
Put the name of the file: snow2000.tif
Assign it the name: snow2000
snow2000<-raster("snow2000r.tif")

To import all of the data
snow2000 <- raster("snow2000r.tif")
snow2005 <- raster("snow2005r.tif")
snow2010 <- raster("snow2010r.tif")
snow2015 <- raster("snow2015r.tif")
snow2020 <- raster("snow2020r.tif")

To plot all the images together
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

First of all make a list of the files we want to import
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
So it looks like a satallite image
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
In order top plot the dataset we made
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
In order to import images, we have to possibilites: raster or brick
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
we were able to calculate the correlation between the snowcoverage and the years. 
And by doing so we can make a prediction of the snowcoverage by year 2025

First of all
Let us export the output
We made the calculation
And we want to send the output to a collegue
How to export the prediction output
The function is: writeRaster
It is writing the entire raster object into a file as you chose
The name of the file is: prediction
The name of the final outcome: final.tif

writeRaster(prediction,"final.tif")
Creating the new data into the format tif. 
Importing the data to our snow folderoutside of R

Let us make a final stack
Let us assing it the name: final.stack
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
The point per pixles
