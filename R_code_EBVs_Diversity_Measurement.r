############## BIODIVERSITY MEASUREMENT ###################

Explain to the software we are going to make use of moving window
By making use of the function: matrix
First set the moving window
We are going to make a window by 5 rows and 5 columns
Assign it the name: window
window<-matrix(1, nrow = 5, ncol = 5)

Then right window to see the five rows and columns
window

We will calculate the new value of the standard variation
The function we are going to make use of: focal
focal = calculation of certain values in a neighbourhood

Give it the name: sd_snt 
Make use of the function: focal
Make use of the first principle component in the sntpca image
Make us of the map. Link it to the first PC1
w should be the size of the moving window we created
Put the function to be standard deviation: sd
sd_snt<-focal(sntpca$map$PC1,w=window,fun=sd)

Make use of a color ramp palette (going from dark blue to red)
Assign it the name: cl
cl<-colorRampPalette(c('dark blue','green','orange','red'))(100)  

Plot the image by using the color ramp palette
plot(sd_snt,col=cl)

Put the two images next to each other: snt and sd_snt
By making use of the function: par
One row and two columns: 1,2
And give the plots the title: original image and diversity
par(mfrow=c(1,2))
plotRGB(snt,4,3,2, stretch="lin", main="original image") 
plot(sd_snt, col=cl, main="diversity")

(main is to give a name to the different images. 
But raster does not make use of the function
So it is not visible in the images)
