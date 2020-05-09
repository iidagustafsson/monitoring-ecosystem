Chemical cycling from Satallite images

We are going to make use of raster, rasterVis and rasterdiv
Recall the libraries
library(raster)
library(rasterVis)
library(rasterdiv)

Take a look at the latest data whe used last time
Dealing with workwide 

copNDVI - copernicus reflectense in the NIR, and small reflection in Red (due to photosysnthesis)
Then do the difference between these values

Lets plot the NDVI
plot(copNDVI)

blue color is a code - it represent the water
reclassigying 
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

level plot of this NDVI
restart from here
levelplot(copNDVI)

The value of NDVI is larger around the equator - main primary forest = increasing the biomass
The value of NDVI is lower around the equator 
Another peak in the NDVi. At the top of the graph. This is due to the broad leaf and cornifor forest
The equator forest is vertically structured. While the cor
The taiga is not structured in 3D. The individuals are very similar to each other
The vertical structure os very poor. The individuals are very similar
No plants on top of each other. Usually just one species at one place

Set my working directory
setwd("C:/lab/")

Now we can enter the faPAR
The faPAR is called faPAR10
Go to the lab fodler
Copy the name f2

Let us inport the data
Make us of the function: raster
Give it the name: faPAR10
10 meaning we used the factor 10 aggregated the data
faPAR10 <- raster("faPAR10.tif")

Make the same level plot with the faPAR10 instead of the 
PAR in cap - because R is sensative
levelplot(faPAR10)

High NDVI in the north hemisphere and aroudn the equator
What is happening to the faPAR
The equator has a very high amount of photosyntheis in this area
Not all sunlight that is coming, is not going to the soik
Most light is used by the plants
In top of the norther part. The faPAR is not as high as the NDVI
We are not only considering of the energy
We are considering the chemical cycling by plants
In the conifer forest most light is going into the soil. the light is not used
The main point: one individual after one an another. next to each other. very similar. and much light not used
Tropical forest: the opposite - many different individuals, complext structure


Save as pdf, both NDVI image and faPAR10
Use the pdf function: pdf("")
Use the " - since we are going to save it ouside of R
Give it the name copNDVI.pdf and faPAR10.pdf

pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()

pdf("faPAR.pdf")
levelplot(faPAR10)
dev.off()














