# Creating plot 1

# Read in data filtering for just the required subset and set the column names
# Install package data.table if it is not already installed
# install.packages("data.table")
library(data.table)
DT <- fread("household_power_consumption.txt", skip="1/2/2007", nrows = rowsToRead, na.strings = c("?", ""))
setnames(DT, colnames(fread(dataFile, nrows=0)))

# Create a datetime field to be able to plot values over time series
DT$datetime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

# Plot to a .png file
library(datasets)

png(file="plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "transparent")
	hist(DT$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power", cex.lab=0.95, cex.axis=0.95)
dev.off()
