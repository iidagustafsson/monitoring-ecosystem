Install the package: for Species distribution measurments = sdm
install.packages("sdm")

Recall the package
library(sdm)

Recall some other libraries
library(raster)
library(rgdal)

We are going to import the data
We are going to make use of the function: system.file()
State the name of the data that should be imported: external/species.shp
Assign it the name: file
file <- system.file("external/species.shp", package="sdm")

Now we are going to use the graphical part of the file
Coupling the graphical points with the data inside
To create a shapefile make use of the function: shapefile()
State the name of the data we want to apply the function on: file
Assign it the name: species
species <- shapefile(file)

Now plot the image
Make use of the function: plot()
State the name of the data we want to plot: species
plot(species)

To see the information of the data
species

Let us see the latitude
We are somewhere in Spain (professor could tell by the coordinates)

Let us link Occurrence with species
species$Occurrence

Let us plot the dataset species
A condition is put by using [ ]
By putting double == you state it has to be present
We want to make sure that the species occur: 1
The comma state that the condition finish
Make the points into color: blue
Point character to layout: 16
plot(species[species$Occurrence == 1,],col='blue',pch=16)

Now let us plot the points of the absence
No species occur: 0
Make the points in red color
points(species[species$Occurrence == 0,],col='red',pch=16)

Let us make use of system file function: system.file()
path<- system.file("external", package="sdm")

Let us make a list
The data is inside the external folder called: external
We have to state the path: path
We have to state the patter or the files we want to make the list of: asc$
We have to state that we want to make use of the full name: full.name=T
lst <- list.files(path=path,pattern='asc$',full.names = T)

What are the files into the list?
To see the list, simply type
lst

Look at the path of the files
C -> Users -> iidag -> OneDrive -> Dokument

Let us make a stack of the files we made the list of:
Elevation
Precipitation
Temperature
Vegetation
Assign it the name: preds
preds<-stack(lst)

Plot the stack
plot(preds)

We are going to change the color ramp palette
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

Now we are going to make use of the predictions
To see the distribution of animals

We are going to plot every single predicter
Plot where the species are present
Link preds with the elevation
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer low latitudes

Do the same with the temperature
plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer high temperatures

Do the same with the precipitation
plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer medium precipitation

Does this species like to be covered by other plants on top?
Does this species like to not be in shadow of other species?
plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)
=> the species prefer not fully cover, or not absent of other plants

Now we are going to create a data object by using: sdmData
State which data we want to apply the function on (the shapefile): train=species
Put the predictors as preds: predictors=preds
Assign it the name: d (data)
d<-sdmData(train=species, predictors=preds)

To see all the information
d

Now we can make the model
We are going to make a linear model
The data we are going to make use of: d
Assign it the name: m1 (model one)
We are going to make use of the function: sdm
We are going to see the occurrence: Occurrence ~ 
State to the model that we make use of the predictors: elevation + precipitation + temperature + vegetation
The data is equal to d
The methods we are using it: methods="glm"
glm is used to fit generalized linear models. It gives a linear prediction
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods = "glm")

Let us make the map
The map can be mad, by using the function: predict()
State which model you want to make use of: m1
We are going to base the model of the predictions: newdata=preds
Assign it the name: p1 (prediction one)
p1 <- predict(m1, newdata=preds)

Let us plot the prediction: plot(p1)
Make us of the color ramp palette: col=cl
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

Stack the predictions and prediction map: preds and p1
Assign it the name: s1
s1< stack(preds,p1)

Let us plot the maps of the predictions and the final prediction model
Make use of the color ramp palette: col=cl
plot(s1, col=cl)
