# Creating plot 4

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
png(file="plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")

par(mfcol=c(2,2))
  plot(DT$Global_active_power~DT$datetime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)",cex.lab=0.95, cex.axis=0.95)
  
  plot(DT$Sub_metering_1~DT$datetime, type="l", xlab = "", ylab = "Energy sub metering")
 	 lines(DT$Sub_metering_2~DT$datetime, type="l", col="red")
 	 lines(DT$Sub_metering_3~DT$datetime, type="l", col="blue")
 	 legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       		  lty=1, box.col = "transparent", cex = 0.95)
  
  plot(DT$Voltage~DT$datetime, type="l", xlab = "datetime", ylab = "Voltage")
  
  plot(DT$Global_reactive_power~DT$datetime, type="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
