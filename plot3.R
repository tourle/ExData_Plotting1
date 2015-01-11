# Creating plot 3

# Read in data filtering for just the required subset and set the column names
# Install package data.table if it is not already installed.
# install.packages("data.table")
library(data.table)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
setnames(DT, colnames(fread(dataFile, nrows=0)))

# Create a datetime field to be able to plot values over time series
DT$datetime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

# Plot to a .png file
library(datasets)

png(file="plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")

	plot(DT$Sub_metering_1~DT$datetime, type="l", xlab = "", ylab = "Energy sub metering", cex.lab=0.95, cex.axis=0.95)
		lines(DT$Sub_metering_2~DT$datetime, type="l", col="red")
		lines(DT$Sub_metering_3~DT$datetime, type="l", col="blue")
		# add a legend
		legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=1,bg = "transparent", pt.cex=0.95)
dev.off()
