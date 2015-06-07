# Step 1: read data from the household_power_consumption.csv by sqldf package: 
## If you did not have a 'sqldf and tlctk' packaged install it and load it to library

## Step 2: read the data from 1/2/2007 to 2/2/2007. This data format d/m/yyyy. 
library(sqldf)
projectData <- read.csv.sql("household_power_consumption.txt",
                            sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
                            header = TRUE, sep=";", stringsAsFactors = FALSE)
## Using closeAllConnections() function to close unused connections. 
closeAllConnections()

## Step 3: Extract Date time from projectData. I use funciont as.POSIXlt and as.Date 
## to concatenate Date and Time of projecData. Then use this dateTime to
## make an argument of plot 2. 
dateTime <- as.POSIXlt(paste(as.Date(projectData$Date, format="%d/%m/%Y"), 
                             projectData$Time, sep=" "))


## Step 4: Use dateTime and projectData to create an empty plot first,
## then add data of three Sub_metering_x variable. I have to use ' type="n" '
## create 'plot3.png' in my working directory
## create a PNG file to save the plot1.R to file with 
## a width of 480 pixels and a heigth of 480 pixels. 
png(file = "./Project1_EXDATA/plot3.png")

plot(dateTime, projectData$Sub_metering_1,type = "n", ylab = "Energy sub metering", xlab = "")
lines(dateTime, projectData$Sub_metering_1)
lines(dateTime, projectData$Sub_metering_2,col="red")
lines(dateTime, projectData$Sub_metering_3,col="blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black", "red","blue"), xjust = 1, yjust = 1)




dev.off() ## Close the PNG file device 
