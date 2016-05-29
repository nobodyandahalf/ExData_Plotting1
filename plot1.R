## Constructing plot 1

## Reading the subset of data for 2007-02-01 and 2007-02-02
library(sqldf)
assignmentdata<-read.csv.sql("./data/exdata_data_household_power_consumption/household_power_consumption.txt",sql='select * from file where Date == "1/2/2007" or Date == "2/2/2007"',sep=";")
assignmentdata$Date<-as.Date(assignmentdata$Date,"%d/%m/%Y")

## Constructing the Global Active Power histogram
png(file="plot1.png",bg="transparent")
hist(assignmentdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()