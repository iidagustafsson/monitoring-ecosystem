We are going to make use of data from two students in class, make some tests on it
Point patterns in the field, that we can analyse in different ways
For example, we can measure the density and creating a density map
We can estimate the diameter and the height 
We are going to make measures of the coverage of the tree (Canopy)
We can make an estimation of the ecosystem services - such as the income of light

Go to iol and download the data called: dati_plot55_LAST3.csv
Save the file into the lab folder
Enter the folder and check you have the data in the folder

Set my working directory 
Set it to lab folder
Since we are going to make use of data from that folder
setwd("C:/lab/")

Now we are going to import the data
The data is just a table, so we do not need to use the function raster or brick
Instead we will make use of the function: readtable()

We are going to make use of the library: spatstat
Recall the library: library(spatstat)

Now we are going to read the table in R
Now we should make use of the function: readtable()
State which data you want to read: dati_plot55_LAST3.csv
The separation between the columns in the table is made of ;
State for R that this is the separation: sep=";"
In the table there is a header. Explain for R there is a header: head=T (TRUE)
Assign a name/title to the imported data: inp
inp <- read.table("dati_plot55_LAST3.csv", sep=";", head=T)

To see the first 6 rows of the table
head(inp)

We are going to attach the dataset we imported
attach(inp)

By attaching the dataset, we can work directly in it
We can now make use of the columns directly: X and Y
Instead of writing dollar symbol and link to each other etc, we can simply just plot it 
plot(X,Y)

Now we are going to make some estimations
Now we have seen the different points in the area
First of all, what we should do in the spatstat library is to make us of: ppp function
We should explain the x-value and the y-value
What is the range of x, and range of y?
In order to know the minimum and maximum values make use of the function: summary()
By using it we can read the minimum and maximum values of both X and Y
State which data you want to see the summary of: inp
summary(inp)

Make use of the function: ppp
x-value = X
y-value = Y
The range of X = 716000 to 718000
The range of Y = 4859000 to 4861000
Assign it the name: inppp
inppp<-ppp(x=X, y=Y, c(716000,718000),c(4859000,4861000))

 
To see the name of the columns
names(inp)

We want to make estimations of the tree coverage
The Canopy coverage is called: Canopy.cov

Now we can make use of the function: marks()
State which data you want to apply the function on: inppp
marks(inppp)<-Canopy.cov

Now we are going to make use of the function: Smooth()
Smooth means interpolation. Estimate/see data where it has not yet been measured
State which data you want to smooth: inppp
Assign it the name: canopy
canopy<-Smooth(inppp)

We are going to see the distance - the difference between the points and the line
Now we are going to plot the canopy: plot(canopy)
Add the points of inppp: points(inppp)
Make the points in the color green: col="green"
Since we are going outside of R, make use of “ “
plot(canopy)
points(inppp, col="green")

We measured the density value of each point
The southern part of the forest is more dense
While the northern east is less dense
(see colors in the plot)

marks(inppp) <- cop.lich.mean
lichs <- Smooth(inppp)
plot(lichs)
points(inppp)

Now we should plot the two maps together.
To compare them both
Let us make use of the function: par(mfrow)
State how many rows: 1
State how many columns: 2
State which data you want to plot: canopy and lichs
Put the points on the maps: inppp

par(mfrow=c(1,2))
plot(canopy)
points(inppp)
plot(lichs)
points(inppp)

We should now plot the three maps together and the differences between them
Let us make use of the function: par(mfrow)
State how many rows: 1
State how many columns: 3
Make use of the original names: Canopy.cov and cop.lich.mean
The color of the points: col="red"
point character: pch=19
Scale up the points: cex=2
par(mfrow=c(1,3))
plot(canopy)
points(inppp)
plot(lichs)
points(inppp)
plot(Canopy.cov, cop.lich.mean, col="red", pch=19, cex=2)

---------------------------
Go to iol site
And download the data called: dati_psammofile.csv
Put the data into lab folder

First we are going to read the table/dataset
We are going to make use of the function: read.table()
State the name of the dataset we want to import: dati_psammofile.csv
The separator is: sep=";"
The header is true: head=T
Assign it the name: inp.psam
inp.psam<-read.table("dati_psammofile.csv",sep=";", head=T)

Attach the dataset
attach(inp.psam)

To remove previous maps (from previous exercise)
dev.off()

To see the first rows of the dataset
head(inp.psam)

By reading the coordinates we can see that we are in the north east of Italy
X-value is in the table called: E 
Y-value is in the table called: N

Plot the dataset: plot()
Plot the X value: E
Plot the Y value: N
plot(E,N)

We can see that the points are clustered
Spatstat might have problems to estimate the measurements where there are no points
When we apply the function: Smooth()

To see the values of X and Y
Summary(inp.psam)

Make use of the coordinates. That we have points with coordinates
The function to make use of is: ppp
We have to state the name of X and Y: x=E  and y=N
We have to state the range of X and Y value
Assign it the name: inp.psam.ppp
inp.psam.ppp<-ppp(x=E,y=N,c(356450,372240),c(5059800,5064150))

Explain which variable we are going to make use of (organic carbon)
Put the value of organic carbon: C_org
Let us make use of the function: marks()
State that we are going to apply the marks function on: inp.psam.ppp
Indicate the spatstat that we are going to make use of organic carbon: C_org
marks(inp.psam.ppp) <- C_org

Now let us make use of the function: Smooth()
To estimate the values of the points we do not have any measured values
Now we are going to estimate the organic carbon values
State which data we want to apply the function smooth on: inp.psam.ppp
Assign it the name: C (for carbon)
C<-Smooth(inp.psam.ppp)

Warning: Underflow 
= Lower amount of data in some parts. This is due to the clustered points

Let us plot it
Let us put the points on the map
plot(C)
points(inp.psam.ppp)

Rather than having a clustered effect of the points
We will make a mean value of the clustered points
By doing so, it will be more simple to estimate the distances between the points
