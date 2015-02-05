plot4 <- function() {



## as.Date(data$Date,"%d/%m/%Y")

	##Read in the file, selecting only needed dates
	data <- read.csv.sql("household_power_consumption.txt",header=TRUE, 
         sep=";", sql="Select * from file where Date='1/2/2007' 
          OR Date='2/2/2007'")


	## Combine data and time into one column 
	temp <- paste(data$Date,data$Time)
	data$combined <- strptime(temp, "%d/%m/%Y %H:%M:%S")

	## 2 by 2 column
	par(mfrow=c(2,2),mar = c(4,4,2,4))

	## Create graph datetime global active power graph
	plot(data$combined,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")

	## Create datetime by voltage graph
	plot(data$combined,data$Voltage,type="l",xlab="datetime",ylab="Voltage")	

	## Create line histogram and add all three metering levels
 	plot(data$combined,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
	points(data$combined,data$Sub_metering_2,type="l",col="red")
	points(data$combined,data$Sub_metering_3,type="l",col="blue")

	## Add a legendary legend
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=.5)

	## Create datetime by reactive power
	plot(data$combined,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")	

	dev.copy(png,file="plot4.png",width=480,height=480)
	dev.off()
	

}