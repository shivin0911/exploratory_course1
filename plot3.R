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
data <- fread("household_power_consumption.txt")
#Chnaging Format of Date Variable
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Extracting Required Data
data_sSet <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]
#Converting to Data Frame
data_sSet <- data.frame(data_sSet)
#Converting to Numeric
for(i in c(3:9)) {data_sSet[,i] <- as.numeric(as.character(data_sSet[,i]))}
#Coverting to Date_Time to usable Format
data_sSet$Date_Time <- paste(data_sSet$Date, data_sSet$Time)
data_sSet$Date_Time <- strptime(data_sSet$Date_Time, format="%Y-%m-%d %H:%M:%S")
#plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(data_sSet$Date_Time, data_sSet$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(data_sSet$Date_Time, data_sSet$Sub_metering_1, col = "black", type = "S")
lines(data_sSet$Date_Time, data_sSet$Sub_metering_2, col = "red", type = "S")
lines(data_sSet$Date_Time, data_sSet$Sub_metering_3, col = "blue", type = "S")
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()