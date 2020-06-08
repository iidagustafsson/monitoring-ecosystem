Set my working directory
Set it to the Lab folder
Since we are going to make use of data in that folder
setwd("C:/lab/")

Now we are going to see two possibilities on how to make use of a specified part of a downloaded data
Images downloaded from Copernicus, we can use a particular part (instead of global perspective) 
The two functions: zoom or crop
First import the image

Check what is the name of the image
The name is: c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc

We need some libraries to work with the image
Recall the libraries we need: raster and ncdf4
library(raster)
library(ncdf4)

Import the data: c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc
Assign the imported data the name: snow
Use the library: raster
Make use the " ", since we are going outside of R to import the data into R
snow<-raster("c_gls_SCE500_202005180000_CEURO_MODIS_V1.0.1.nc")

Let us make a color ramp palette: ranging from dark blue to light blue
Assign the color ramp palette the name: cl
cl<-colorRampPalette(c('darkblue','blue','light blue'))(100)

Firstly we need to specify which extent we want to zoom in, in the data/image
(here we wanted to zoom in on Italy - so the numbers correspond to the size of Italy)
The first two numbers are ranging in longitude 
The last two numbers are ranging in latitude
Assign it the name: ext
ext<-c(0, 20, 35, 50)

Now we will make use of the function: zoom()
First state which image you want to zoom
The one we previously imported: snow
State the extension: ext= (same name as the extension you previously made) ext
zoom(snow, ext=ext)

Now we will make use of the function: crop()
Assign it a name: snowitaly
State which image you want to apply the function onto: snow
State the previously made extension: ext
snowitaly<-crop(snow, ext)

Now we should plot the image: plot()
State the name of the image we want to plot: snowitaly
Make use of the color ramp palette we created: col=cl
plot(snowitaly, col=cl)

Another example with the function zoom
Re-put the zoom function: zoom()
Instead of putting the previously made extension 
We will draw an extension: ext=drawExtent()
zoom(snow, ext=drawExtent())

Click on a certain point in the image and draw your own rectangular
This will be the zoom you make

Save the working space
q()
