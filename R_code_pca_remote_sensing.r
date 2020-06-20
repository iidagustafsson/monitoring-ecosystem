R code for PCA remote sensing data analysis (principal component analysis)

Set my working directory to lab folder
setwd("C:/lab/")

We are going to look at the path 224 and the row 63 
The image we are going to make use of is from that area - Amazon Forest
We have two different dates; one image is from year 1988 and the other is from 2011

Import one of the images from Lab folder
We are going make use of two datasets: Raster and RStoolbox
library(raster)
library(RStoolbox)

To import all of the data from a satellite picture into R
Make us of brick function: brick
State the data which we want to import: p223r63_masked.grd
Use “ “ since we are going outside R
Assign the function to the new name: p224r63_2011
p224r63_2011<-brick("p224r63_2011_masked.grd")

graphical file 
header- explaining the names (.hdr)
linking the graphical 

Make use of 3 different landsat band sets
First Band B1: Blue
Second Band B2: Green
Third Band B3: Red
Fourth Band B4: NIR
Fifth Band B5: (Short-wave) Medium Infra-Red (different range of wavelength within spectrum)
Sixth Band B6: Thermal infrared
Seventh Band B7: (Short-wave) Medium Infra-Red (different range of wavelength within spectrum)
Eight Band B8 Panchromatic

We can plot in different ways: plotRGB, GGplot
Stretch to see the colors, by making a linear stretching. 
The function is called: stretch="Lin"
We want to describe the different bands (Medium infra-red, NIR, RED) by using the primary colors: RED, GREEN, BLUE
plotRGB(p224r63_2011,r=5,g=4,b=3,stretch="Lin")

We need an additional library to plot GGplot
Recall the library
library(ggplot2)
The function is called: ggRGB()
State which data to use: p224r63_2011
State which bands to use - Medium infra-red, NIR, RED: 5,4,3
ggRGB(p224r63_2011,5,4,3)

### Exercise - Produce the same procedure but with the 1988 image
Upload the image into R
Give it the name
Plot it into the software

p224r63_1988<-brick("p224r63_1988_masked.grd")
plotRGB(p224r63_1988,r=5,g=4,b=3,stretch="Lin")
ggRGB(p224r63_1988,5,4,3)

To see both the images at the same time. 
Make use of the function: par
par(mfrow=c(1,2))
plotRGB(p224r63_1988,r=5,g=4,b=3,stretch="Lin")
plotRGB(p224r63_2011,r=5,g=4,b=3,stretch="Lin")

The pink part has increased a lot = agricultural lands. The main forest is in dangerous
We used the band 5 = Medium Infra-Red, band 4= NIR and band 3= Red

How to see all the bands together? All the information together in one plot
Let us see if the bands are correlated to each other or not
First of all, what does it mean correlated?
Being correlated - means you are following the pattern of another variable
Example the number of trips and the number of infected by covid are related 

Let us see if B1 and B3 are corelated to each other
Blue and Red should have a high correlation. Because this light is used to fixate photosynthesis
Make to plots. Band 1 x-axis and band 3 y-axis
We need to know the names of the bands
How to know the names of anything in R?
Make use of the function: names
State the name of the data we want to see the names of: p224r63_2011
names(p224r63_2011)

Here you have the names of the different bands: B1_sre and B3_sre
We are interested in plotting the band 1 and band 3


Make us of the image from 2011
Linking different parts
By using the $ symbol

To close the window
dev.off()

Now linking the image to B1 and B3
plot(p224r63_2011$B1_sre, p224r63_2011$B3_sre)
High correlation. 

Positive correlation between variables. Both variables are increasing with respect to the other
Negative correlation between variables. One variable is decreasing with respect to the other
No correlation - flat curve/line

We can apply
Principal component = PC1 - accounting for 90% 
Principal component = PC2 - accounting for 10%

We need to decrease the resolution of the image.
Why? The PCA is a hard. We have a huge amount of data
Decrease it by a factor of 10. Passing from 4 M of data -> into 40K of data
Decreasing on the linear dimension
Make use of the function: aggregate() 
Assign the image a new name: <-
Associate the image by: res (resolution)
p224r63_2011_res<-aggregate(p224r63_2011,fact=10)

Raster PCA is the function that performs Principal Component Analysis
Assign the image a new name: <-
Associate the image by: pca
p224r63_2011_pca<-rasterPCA(p224r63_2011_res)

In order to see all the information within the dataset run the name of the image
p224r63_2011_pca

The different components: call, model, map
Let us plot the map
The dollar symbol is linking the different outputs together with the map
plot(p224r63_2011_pca$map)

Let us make a new color ramp palette
Assign the image a new name: <-
Give it the name: cl
cl<-colorRampPalette(c('dark grey','grey','light grey'))(100)
plot(p224r63_2011_pca$map, col=cl)

The PC1 - is accounting for almost all the information of the variations (99,83%)

Let us see how the variations of each component in the model. 
We are interest in the information of the model. We want to see the output of the model
Make use of the function: summary
summary(p224r63_2011_pca$model)

Let us see how much the different bands are correlating to each other
pairs(p224r63_2011)

Band 4 (NIR) has a lower correlation with respect to the other bands

Let us plot the first 3 components
Make use of 3 different colors (Blue, Green and Red)
The first component accounting for 99,83%
The second component accounting for 0,146 %
The third component accounting for 0,0157%

We are going to plot each principle components into the bands
Principle component 1, 2 and 3. Red=PC1, Green=PC2 and Blue=PC3
plotRGB(p224r63_2011_pca$map,r=1,g=2,b=3, stretch="Lin")


### Repeat the same procedure for 1988 image
First decrease the amount of data by factor 10: fact=10
Make use of the function: aggregate()
Second make use the pca: rasterPCA()
Third: plot in RGB our map. By using the color ramp palette cl
And linking the outputs with the map
p224r63_1988_res<-aggregate(p224r63_1988,fact=10)
p224r63_1988_pca<-rasterPCA(p224r63_1988_res) 
plot(p224r63_1988_pca$map, col=cl)

summary(p224r63_1988_pca$model)

Very high correlation between the bands
99,56% by PC1 (the image from 2011 has 99,83%)
0,38% by PC2 and 0,048 by PC3

Make us of the function pairs to make a scatterplot by the variables in 1988
pairs(p224r63_1988)
Very high correlation between the bands. 

Now make a difference between these two pca maps
Plot the difference between the two images
Let us take the map from 2011 subtracted by the map from 1988
For each pixel we have two different maps. 
Assign it the name: <-
Give it the name: difpca  (different pca)
difpca<-p224r63_2011_pca$map-p224r63_1988_pca$map

plot these differences among the single components. 
plot(difpca)

We will change the color ramp palette
Assign it the name: <-
Give it the name: cldif
cldif<-colorRampPalette(c('blue','black','yellow'))(100)

Now we are going to only plot the Principle Component 1 PC1
To see the name, just run the name
difpca

Lets link the differences in the first component
plot(difpca$PC1,col=cldif)

This is showing the highest the possible variations between two images
Where there have been the highest variations - yellow part
Where there have been the lowest variations - blue part

What we did today:
First, we decreased the complexity of the images by factor 10 to make it easier to plot
We took all the differences in the bands of 1988
Put it into one principle component
The same for image in 2011
Then subtracted the two principle components with each other, to see the differences
