############Code for plot 1,Course Project 1,"Exploratory Data Analysis"
############Author:SHIVIN SINGH
######Set working Directory#######
setwd("C:/dataScience/data")
######Downloading zip File########
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip_file <- "household_power_consumption"
download.file(url, destfile = zip_file)
#Extracting the zipped file
unzip(zip_file)
#File household_power_consumption.txt created
txt_file<-file("household_power_consumption.txt")
#Reading Required Data
data <- read.table(text = grep("^[1,2]/2/2007", readLines(txt_file), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(data$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()