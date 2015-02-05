plot1 <- function() {

##Read in the file, selecting only needed dates

data <- read.csv.sql("household_power_consumption.txt",header=TRUE, 
         sep=";", sql="Select * from file where Date='1/2/2007' 
          OR Date='2/2/2007'")

## Create the histogram
hist(data$Global_active_power, breaks=12,xaxt="n",col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
axis(side=1,at=seq(0,6,by=2))

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

}
