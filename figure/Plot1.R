## Step 1: read data from the household_power_consumption.csv by sqldf package: 
## If you did not have a sqldf packaged install it and load it to library
 
## Step 2: read the data from 1/2/2007 to 2/2/2007. This data format d/m/yyyy. 
library(sqldf)

projectData <- read.csv.sql("household_power_consumption.txt",
sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", 
header = TRUE, sep=";", stringsAsFactors = FALSE)
## Using closeAllConnections() function to close unused connections. 
closeAllConnections()
## Step 3: Graph by hist funtions by choose the colum Global_ative_power in projectData dataframe. 

## create 'plot1.png' in my working directory
## create a PNG file to save the plot1.R to file with 
## a width of 480 pixels and a heigth of 480 pixels. 
png(file = "./Project1_EXDATA/plot1.png")

Global <- hist(projectData$Global_active_power, col = "red",
main ="Global Active Power", sub = "Global Active Power (kilowatts)", xlab = "")

dev.off() ## Close the PNG file device 