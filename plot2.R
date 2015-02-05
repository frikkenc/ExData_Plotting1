plot2<- function() {
## as.Date(data$Date,"%d/%m/%Y")

	##Read in the file, selecting only needed dates
	data <- read.csv.sql("household_power_consumption.txt",header=TRUE, 
         sep=";", sql="Select * from file where Date='1/2/2007' 
          OR Date='2/2/2007'")


	## Combine data and time into one column 
	temp <- paste(data$Date,data$Time)
	data$combined <- strptime(temp, "%d/%m/%Y %H:%M:%S")

	## Create line histogram
	plot(data$combined,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

	dev.copy(png,file="plot2.png",width=480,height=480)
	dev.off()

}