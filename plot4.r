setwd("C:\\Users\\Marketelligent\\Desktop\\R_Exploratory_Analysis")
ds <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
head(ds)
ds$Time <- paste(ds$Date, ds$Time, sep = " ")
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
ds$Time <- strptime(ds$Time, format = "%d/%m/%Y %H:%M:%S")
lapply(ds,class)
dsReqdDates <- ds[ds$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
head(dsReqdDates)

png("./plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(dsReqdDates,{
	plot(Time,Global_active_power, pch='l', xlab="", ylab = "Global Active Power")
	plot(Time,Voltage, pch='l', xlab="datetime", ylab = "Voltage")
	plot(Time,Sub_metering_1, pch='l', xlab="", ylab = "Energy sub metering", col="Black")
	lines(Time,Sub_metering_2, pch='l', xlab="", ylab = "", col="Red")
	lines(Time,Sub_metering_3, pch='l', xlab="", ylab = "", col="Blue")
	legend("topright", lty=1, bty = "n", col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(Time,Global_reactive_power, pch='l', xlab="datetime", ylab = "Global_reactive_power")
	
})
dev.off()