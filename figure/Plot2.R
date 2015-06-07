# Step 1: read data from the household_power_consumption.csv by sqldf package: 
## If you did not have a sqldf packaged install it and load it to library

## Step 2: read the data from 1/2/2007 to 2/2/2007. This data format d/m/yyyy. 
library(sqldf)

projectData <- read.csv.sql("household_power_consumption.txt",
                            sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                            header = TRUE, sep=";", stringsAsFactors = FALSE)
## Using closeAllConnections() function to close unused connections. 
closeAllConnections()

## Step 2: Extract Date time from projectData. I use funciont as.POSIXlt and as.Date 
## to concatenate Date and Time of projecData. Then use this dateTime to
## make an argument of plot 2. 
dateTime <- as.POSIXlt(paste(as.Date(projectData$Date, format="%d/%m/%Y"), 
                             projectData$Time, sep=" "))

## Step 3: plot the Global_active_power by subsetting dateTime with Global_active_power. Use 
## argument: ' type = "l" ' to make the cirlce become a line chart. 

## create 'plot2.png' in my working directory
## create a PNG file to save the plot1.R to file with 
## a width of 480 pixels and a heigth of 480 pixels. 
png(file = "./Project1_EXDATA/plot2.png")

plot(dateTime, projectData$Global_active_power,type = "l",
ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off() ## Close the PNG file device 


