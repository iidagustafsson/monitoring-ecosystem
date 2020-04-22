R code for remote sensing data analysis

install.packages("raster")
install.packages("RStoolbox")
install.packages(c("rasteer","RStoolnox"))

Unzip the downloaded file into the Lab folder. Make sure they are unpacked.

Set my working directory
setwd("C:/lab/")

We are going make use of the library Raster
Raster is the format of pixelses
Pixelse = the quadrates forming the images
library(raster)

Go to the Lab folder. And find the data we downloaded last time. (p224r63...)
path: 224 row: 63
The files are from 2011 and 1988. In these days the images have been taken

Import the images from the lab folder
The funkction to import is called : brick
Importing all of the packs of bands

Go to the labfoder - .grd extension are the images (cannot be seen in windows)
grd = grid (easy way to store information)
Import one of the images
brick("p224r63_2011_masked.grd")

give a name to this file
p224r63_2011<-brick("p224r63_2011_masked.grd")

Lets plot it into R
plot(p224r63_2011)

Vegetation is reflected by the NIR. 
High reflection in Green, very little refecltion in RED and BLue due to photosynthesis

Change the color range of the plots
The color ramp is now from white to green
We are going to change it into a grey scale ramp

Assign the color ramp pallet to the name: cl
cl<-colorRampPalette(c("black","grey","light grey"))(100)
plot(p224r63_2011,col=cl)

Bands of landset
First band, B1: blue
Second band B2: green
Third band B3: Red
Fourht band B4: NIR
Fifht B5: Medium Infra Red
Sixth B6: Thermal Infra Red
Seveneht B7: Medium Infra Red

Lets make a different plot of the image
Plot the single band, one of them
Each of them can be colored with a single color ramp palette

Make us of the function: par
Make a multifram row: mf
Explain the amount of rows and colums: row 2,2
Put the number of colums and graphs into the graph 
Make a series of charachter (c)
par(mfrow=c(2,2))

To see all the colors availiable in R
color()

We are going to plot the B1 band
clb<-colorRampPalette(c("dark blue","blue","light blue"))(100)
Use the $ symbol to link all the bands to the images. 
The name of the band B1 = B1_sre
plot(p224r63_2011$B1_sre,col=clb)

Exercies - do the same for green band. Which is band B2
clg<-colorRampPalette(c("dark green", "green","light green"))(100)
plot(p224r63_2011$B2_sre,col=clg)

Exercies - do the same for red band. Which is band B3
clr<-colorRampPalette(c("dark red", "red","pink"))(100)
plot(p224r63_2011$B3_sre,col=clr)

Exercise - do the same for the NIR band. Which is band B4
cln<-colorRampPalette(c("red", "orange","yellow"))(100)
plot(p224r63_2011$B4_sre,col=cln)

NIR reveal there is a lot of vegetation. 
White parts in the image has no value. It is water coming from the river

Make a graph with 4 rows and 1 column
par(mfrow=c(4,1))

par(mfrow=c(4,1))
clb<-colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(p224r63_2011$B1_sre,col=clb)
clg<-colorRampPalette(c("dark green", "green","light green"))(100)
plot(p224r63_2011$B2_sre,col=clg)
clr<-colorRampPalette(c("dark red", "red","pink"))(100)
plot(p224r63_2011$B3_sre,col=clr)
cln<-colorRampPalette(c("red", "orange","yellow"))(100)
plot(p224r63_2011$B4_sre,col=cln)

Close the window
dev.off()

Show a plot - RGB
r-red =3, g-green =2, b-blue=1
plotRGB
Stretch to see the colors, by making a liniar stretching
stretch="Lin"
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")

Change the bands mountain scheme
We are going to make us of our NIR
Remove the blue band
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")

Plants are reflecting much in NIR
NIR - is now set to the red color = the forest
Pink/violet parts - related to the agricultural fields 
White/grey parts - open areas

Exercise NIR on top of the G component of the RGB
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
We are now simply inverse the red and green bands
NIR - is now set to the green color = the forest
Dark green = high amount of water coming. Can measure the amount of humidity
Pink/violet parts- related to the agricultural fields 
White/grey parts - open areas

Put the NIR into the blue component
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
NIR - is now set to blue color = the forest
Yellow = related to the agricultural fields
White/grey parts - open areas

Save the workspace into lab folder
called it remote_sensing
