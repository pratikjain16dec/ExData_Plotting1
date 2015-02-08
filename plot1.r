setwd("C:\\Users\\Marketelligent\\Desktop\\R_Exploratory_Analysis")
ds <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
head(ds)
ds$Time <- paste(ds$Date, ds$Time, sep = " ")
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")
ds$Time <- strptime(ds$Time, format = "%d/%m/%Y %H:%M:%S")
lapply(ds,class)
dsReqdDates <- ds[ds$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
head(dsReqdDates)

png("./plot1.png", width=480, height=480)
hist(dsReqdDates$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()