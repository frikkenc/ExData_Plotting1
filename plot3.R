plot3<-function() {

	##Read in the file, selecting only needed dates
	data <- read.csv.sql("household_power_consumption.txt",header=TRUE, 
         sep=";", sql="Select * from file where Date='1/2/2007' 
          OR Date='2/2/2007'")


	## Combine data and time into one column 
	temp <- paste(data$Date,data$Time)
	data$combined <- strptime(temp, "%d/%m/%Y %H:%M:%S")

	## Create line histogram and add all three metering levels
 	plot(data$combined,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
	points(data$combined,data$Sub_metering_2,type="l",col="red")
	points(data$combined,data$Sub_metering_3,type="l",col="blue")

	## Add a legendary legend
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
 
	dev.copy(png,file="plot3.png",width=480,height=480)
	dev.off()
}
