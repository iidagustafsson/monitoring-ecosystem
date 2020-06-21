Chemical cycling from Satellite images

We are going to make use of raster, rasterVis and rasterdiv
Recall the libraries
library(raster)
library(rasterVis)
library(rasterdiv)

Take a look at the latest data. The data we used last time
Dealing with worldwide

copNDVI - Copernicus reflectance in the NIR, and small reflection in Red (due to photosynthesis)
We will measure the difference between these values

Let us plot the NDVI
plot(copNDVI)

Blue color represent the water
reclassifying 
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

Make a level plot of this NDVI: levelplot()
To see the NDVI values with respect to the world map
State which data to level plot: copNDVI
levelplot(copNDVI)

The value of NDVI is larger within the equator - mainly primary forest = increasing the biomass
The value of NDVI is lower 30 degrees around the equator – mainly because of deserts
Another peak in the NDVI. At the top of the graph. This is due to the broad leaf and conifer forest
The equator forest is longitudinal structured. While the conifer forest is latitudinal structured
The taiga is not structured in 3 dimensions. The individuals/species are very similar to each other 
The vertical structure is very poor. The individuals are very similar
No plants on top of each other. Usually just one species at one place

Set my working directory
setwd("C:/lab/")

Now we can enter the faPAR
The faPAR is called faPAR10
Go to the lab folder

Let us import the data
Make us of the function: raster
Give it the name: faPAR10
10 meaning we used the factor 10 aggregated the data (professor already did for us)
faPAR10 <- raster("faPAR10.tif")

Make the same level plot we did, but with the faPAR10 instead of the 
Important to have PAR in cap - because R is sensitive. To not risk any misunderstandings
levelplot(faPAR10)

High NDVI in the north hemisphere and around the equator
What is happening to the faPAR?
The equator has a very high amount of photosynthesis in this area
Not all sunlight that is incoming, is reaching the soil
Most light is used by the plants
In top of the norther part. The faPAR is not as high as the NDVI
We are not only considering the energy
We are considering the chemical cycling by plants
In the conifer forest most light is going into the soil. All incoming light is not used by plants
Conifer forest: one individual after one an another. next to each other. very similar. and much light not used by plant = can easily reach the soil
Tropical forest: the opposite - many different individuals next to one and another, complex structures and almost no sunlight reaches the soil

Save as pdf, both NDVI image and faPAR10
Use the pdf function: pdf("")
Use the " - since we are going to save it outside of R
Give it the name copNDVI.pdf and faPAR10.pdf

pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()

pdf("faPAR.pdf")
levelplot(faPAR10)
dev.off()
