R code for remote sensing data analysis

install.packages("raster")
install.packages("RStoolbox")
or use: install.packages(c("rasteer","RStoolnox"))
----------------------------------------------------

2020-02-22
Unzip the downloaded file into the Lab folder. Make sure they are unpacked.

Set my working directory
setwd("C:/lab/")

We are going to make use of the dataset raster
Raster is the format of pixels
Pixels = the quadrates forming the images

Recall the dataset raster
library(raster)

Go to the Lab folder. And find the data we downloaded (last time) it is called (p224r63...)
path: 224 row: 63
The files are from 2011 and 1988. In these years the images have been taken

Import the images from the lab folder
The funkction to import images into R is called : brick
Importing all of the packs of bands

Go to the lab folder - .grd extension are the images (the extension cannot be seen in windows)
grd = grid (easy way to store information)
Import one of the images
Start with the one from 2011
brick("p224r63_2011_masked.grd")

Give a name to this file
p224r63_2011<-brick("p224r63_2011_masked.grd")

Lets plot it into R
plot(p224r63_2011)

Vegetation is reflected by the Near Infrared (NIR) 
High reflection in Green light, very little reflection in RED and BLUE due to photosynthesis

Change the color ramp palletes of the plots
The color ramp is now from white to green colors
We are going to change it into a grey scale ramp

Assign the color ramp pallet to the name: cl
cl<-colorRampPalette(c("black","grey","light grey"))(100)
plot(p224r63_2011,col=cl)

Bands of landset
First band B1: Blue
Second band B2: Green
Third band B3: Red
Fourht band B4: NIR
Fifht band B5: Medium Infra Red
Sixth band B6: Thermal Infra Red
Seveneht band B7: Medium Infra Red

Lets make a different plot of the image
Plot the single band. Just one of them
Each of them can be colored with a single color ramp palette

Make us of the function: par
Make a multifram row: mfrow
Explain the amount of rows and colums you want: 2,2
To put the number of colums and graphs into the graph. Make a series of charachter (c)
par(mfrow=c(2,2))

To see all the colors availiable in R
color()

We are going to plot the B1 band. 
Assign the color ramp pallet to the name: clb
clb<-colorRampPalette(c("dark blue","blue","light blue"))(100)
Use the $ symbol to link all the bands to the images 
The name of the band B1 = B1_sre
plot(p224r63_2011$B1_sre,col=clb)

### Exercies - do the same for green band. Which is band B2
clg<-colorRampPalette(c("dark green", "green","light green"))(100)
plot(p224r63_2011$B2_sre,col=clg)

### Exercies - do the same for red band. Which is band B3
clr<-colorRampPalette(c("dark red", "red","pink"))(100)
plot(p224r63_2011$B3_sre,col=clr)

### Exercise - do the same for the NIR band. Which is band B4
cln<-colorRampPalette(c("red", "orange","yellow"))(100)
plot(p224r63_2011$B4_sre,col=cln)

NIR band reveals that there is a lot of vegetation 
White parts in the image has no value. It is water coming from the nearby river

Make a graph with 4 rows and 1 column and plot all the previous images
par(mfrow=c(4,1))
clb<-colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre,col=clb)
clg<-colorRampPalette(c("dark green", "green","light green"))(100)
plot(p224r63_2011$B2_sre,col=clg)
clr<-colorRampPalette(c("dark red", "red","pink"))(100)
plot(p224r63_2011$B3_sre,col=clr)
cln<-colorRampPalette(c("red", "orange","yellow"))(100)
plot(p224r63_2011$B4_sre,col=cln)

To close the window
dev.off()

Show a plot - RGB
R-red =3, G-green =2, B-blue=1
The function is called: plotRGB

Stretch to see the colors, by making a liniar stretching. 
The function is called: stretch="Lin"
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")

Change the bands scheme
We are going to make us of our NIR (=4)
Remove the blue band (=1)
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")

Plants are reflecting much in NIR light spectrum
NIR - is now set to the red color. The red color is the forest
Pink/violet parts - related to the agricultural fields 
White/grey parts - open areas

### Exercise: plot NIR on top of the G component of the RGB
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")

We have now simply inversed the red and the green bands
NIR - is now set to the green color = the forest
Dark green = high amount of water coming. Can measure the amount of humidity
Pink/violet parts- related to the agricultural fields 
White/grey parts - open areas

### Exercise: plot NIR on top of the B component of the RGB
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")

NIR - is now set to blue color = the forest
Yellow = related to the agricultural fields
White/grey parts - open areas

Save the workspace into lab folder
I called it remote_sensing
---------------------------------------------

2020-04-24
Set my working directory
setwd("C:/lab/")

Load previous workingspace
Load the file called remote_sensing into R

Now load to see all the dataset we used last time
ls()

Which are: "cl" "clb" "clg" "cln" "clr" "landuse" "meuse" "p224r63_2011" "soiltype"  

Recall the dataset raster. Raster means that it contains of pixels
library(raster)

Import the other image. The one from 1988
brick("p224r63_1988_masked.grd")

Give a name to this file
p224r63_1988<-brick("p224r63_1988_masked.grd")

Lets plot it into R
plot(p224r63_1988)

Bands of landset (same as for 2011)
First band B1: blue
Second band B2: green
Third band B3: Red
Fourht band B4: NIR
Fifht band B5: Medium Infra Red
Sixth band B6: Thermal Infra Red
Seveneht band B7: Medium Infra Red

### Exercise: plot in visible RGB 3 2 1 both the images. So plot in 2 rows and 1 column
par(mfrow=c(2,1))
plotRGB(p224r63_1988,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")

We are going to make use of the NIR, RED and BLUE
### Exercise: plot in false color (NIR) RGB 4 3 2 both images
par(mfrow=c(2,1))
plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")

By using the NIR, it is the most powerful band in order to monitore ecosystems 
Here you can see how much humans have opened up the forest. Humas have fragmenteted the forest
Which have created problems for the people living in the forest 
But also creating problems for animals and plants
Creating new niches for alien species to adapt to. Will compete with the endemic species.

Use another stretch
Lets make us of a histogram stretch: "hist"
This function enhances the 'noise'. 
In this case it is mainly related to humidity. The evapotranspiration process of the forest will be visable. 
Put the both images in the same plot, but underneeth one and another. Still using RGB 4 3 2 in both images
par(mfrow=c(2,1))
plotRGB(p224r63_1988,r=4,g=3,b=2,stretch="hist")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="hist")

The most important ecological process - evapotranspiration. 
Much higher humidity in 1988, compared to 2011. 
If there is a high amount of humidity - means the forest was more alive in 1988 compared to 2011

What we want to do is comparing the vegetation index. Between the two images
NIR is highly reflective. RED is very absorbed by chloroplasts 
A healthy plant, has a very high reflection in NIR light while low reflection in RED light
The difference between these index will give us the Vegetation Index.
DVI (Difference Vegetation Index) = NIR-RED
A dying plant, has less reflection in NIR light while higher reflection of RED light

Bands of landset
First band B1: blue
Second band B2: green
Third band B3: Red
Fourht band B4: NIR
Fifht band B5: Medium Infra Red
Sixth band B6: Thermal Infra Red
Seveneht band B7: Medium Infra Red

Lets give it the name to the index : dvi2011
To link the band to the image, make use of $.  
dvi2011<-p224r63_2011$B4_sre-p224r63_2011$B3_sre

Lets use a differnt color ramp palette
cl<-colorRampPalette(c("darkorchid3", "light blue","lightpink4"))(100)
plot(dvi2011,col=cl)

Try another color ramp palette
cl<-colorRampPalette(c("darkorchid3","light blue","lightpink4"))(100) 
plot(dvi2011,col=cl)

### Exercise: dvi for 1988
dvi1988<-p224r63_1988$B4_sre-p224r63_2011$B3_sre
cl<-colorRampPalette(c("darkorchid3", "light blue","lightpink4"))(100)
plot(dvi1988,col=cl)

To make the differences from one year to another
Make it the name : diff
Assign the differences to this name: <-
The differences: dvi2011 - dvi1988
diff<-dvi2011 - dvi1988
plot(diff)

Green parts = where the DVI changes alot
Brown parts = negativly affected. By random events. 
Yellow parts = ?

See the affects of changing the grain
Grain - the dimensions of the pixels. 
By changing the grain (dimension of pixle), you will change the capability to cover a certain property
Higher dimensions - hard to discover single plants. You will only see the forest
Small dimensions - you can see a single tree/plant within the forest

Lets change the grain of the images
When changing the dimensions of the pixels it is called resempling: res
The function is: aggregate()
Aggregate our image: aggregate(p224r63_2011)
We need to express how much we want to aggregate it. How much we want to increase the factor

We are going to rename it to: p224r63_2011res
p224r63_2011res10<-aggregate(p224r63_2011,fact=10)
p224r63_2011res100<-aggregate(p224r63_2011,fact=100)

Now we want to make the par of the different dimensions. 
The original, the dimensions with factor 10 and with the dimension of factor 100
Putting them in three rows and in one column
par(mfrow=c(3,1))
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011res10,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011res100,r=4,g=3,b=2,stretch="Lin")

Save the workspace into lab folder
I called it remote_sensing_new
