R code to view biomass over the world map and calculate changes in ecosystem functions and services

We are going to use Raster
Raster is the format of pixels - all data based on pixels

Install the packages rasterdiv (diversity) and rasterVis (visualisation)
install.packages("rasterdiv") 
install.packages("rasterVis") 

Recall the dataset rasterdiv and rasterVis
library(rasterdiv)
library(rasterVis)

Attach the data copNDVI
data(copNDVI)

Plot the dataset
plot(copNDVI)

We can now make additional graphs on the world map
We should remove some values by using: cbind 
We want to remove the values from the 253 to 255
Put this data as NA value
Reclassify the data into copNDVI
copNDVI<-reclassify(copNDVI,cbind(253:255,NA)

Levelplot is simple but powerful function to plot data
(If we want to impress our supervisor :) )
levelplot(copNDVI)
Now we have plotted the biomass functions and services that we have had during the last 30 years (from 1999)

The graph on the right side. What does it show us?
It shows us the DVI values of the biomass. Shows us the ecosystem services/functions
The main functions of Earths concerning biomass
In the north - mainly the conifer forest = high value
In the equatorial region - the rainforest = high value
On the 30 degrees north latitude - mainly desert/savanna = low value

The graph on the top side. What does it show us?
The variabilities are much lower over the longitudes. 
This is due to the latitudinal location of the biomes
The top graph considers high and low values all over the longitudes (=small variabilities)

Let us change the grain of the images
Let us aggregate the NDVI
The function is: aggregate()
Increase the pixle dimension by factor of 10: fact=10
Let us give a new name to the image: copNDVI10
copNDVI10<-aggregate(copNDVI,fact=10)

The map becomes a bit smoother, because the pixels are now bigger than before 

Let us see what happens when we aggregate with the factor 100 
And change the name of the new image into: copNDVI100
copNDVI100<-aggregate(copNDVI,fact=100)

The map becomes now very blurry, because the pixels are now very big. Cannot see much details 
Fun fact: Most of climate change maps are made by this resolution

#########################################################
Extra code (not included in this lecture!! just for fun)
library(ggplot2)

myPalette <- colorRampPalette(c('white','green','dark green'))
sc <- scale_colour_gradientn(colours = myPalette(100), limits=c(1, 8))

ggR(copNDVI, geom_raster = TRUE) +
scale_fill_gradientn(name = "NDVI", colours = myPalette(100))+
labs(x="Longitude",y="Latitude", fill="")+
#   theme(legend.position = "bottom") +
  NULL
# +
# ggtitle("NDVI")
#########################################################

Move to another example 
See how much the plants are losing their chemical cycling and energy flow, due to human activities
See how much we have converted the previous forest into agricultural lands

Download the data defor1_ and defor2_ images from iol
Save them into Lab-folder
        
Take a look at the images:
Everything that is red in the defor1_ image is forest
Everything that is grey in the defor2_ image is agricultural land

Set the working directory
setwd("C:/lab/")

Recall the raster packages
library(raster)

Import the data we saved in lab folder (defor1_ + defor2_)
The function to import images into R is called : brick
Go to the lab folder - .jpg extension are the images (the extension cannot be seen in windows)
brick("defor1_.jpg")
Put the name of the data. Give it the name defor1
defor1<-brick("defor1_.jpg")

Now let us also brick the second raster
Put the name of the data. Give it the name defor2
defor2<-brick("defor2_.jpg")

Now both the images are imported
Let us plot them into R
First check the landset bands:

Bands of landset 
First band B1: NIR
Second band B2: RED
Third band B3: GREEN

Show a plot - RGB
R-red =3, G-green =2, B-blue=1
The function is called: plotRGB
Change the bands scheme (r=1, g=2, b=3)

Stretch to see the colors, by making a linear stretching 
The function is called: stretch="Lin"
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
What we see: our forest before the changes in land use

Now do the same fow defor2
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
What we see: our forest has undergone large changes in land use

Make use of the function: par
Make a multiframe row: mfrow
Explain the number of rows and columns you want: 1,2
To put the number of columns and graphs into the graph. Make a series of character (c)
Now we can see the images next to each other
Par is creating a multiframe of rows. The numbers indicate: 1 row 2 columns
par(mfrow=c(1,2))

Calculate the DVI between the different images
We need to know the name of the bands:
defor1
Bands of landset 
First band B1: NIR, defor_.1
Second band B2: RED, defor_.2
Third band B3: GREEN 

defor2
Bands of landset 
First band B1: NIR, defor2_.1
Second band B2: RED, defor2_.2
Third band B3: GREEN 

We should link the bands of the data 
To link the band to the image, make use of $.
dvi1<-defor1$defor1_.1-defor1$defor1_.2
dvi2<-defor2$defor2_.1-defor2$defor2_.2

Change the color ramp palette of the plots
Assign the color ramp pallet to the name: cl
cl<-colorRampPalette(c("darkblue","yellow","red","black"))(100) 

Plot both of them with the new colorRamp Palette
par(mfrow=c(1,2))
plot(dvi1,col=cl)
plot(dvi2,col=cl)

difdvi<-dvi1-dvi2
ERROR! The raster objects have different extents. 

Shut down the specified device
dev.off()

Change the color ramp palette of the plots
Assign the color ramp pallet to the name: cld
cld<-colorRampPalette(c("blue","white","red"))(100) 
plot(difdvi, col=cld)

Showing the difference of the previous forest to the current forest
Red parts/color = agricultural land
Light parts/color = forest
Shows the loss of ecosystem functions/services
All red parts have loss biomass and its services/functions

Use another stretch
Let us make us of a histogram stretch: "hist"
This function enhances the 'noise' 
hist(difdvi)
The bars show several values that are greater than 0 
Meaning that there is a high loss of DVI/biomass
