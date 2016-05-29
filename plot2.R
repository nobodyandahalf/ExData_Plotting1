## Constructing plot 2

## Reading the subset of data for 2007-02-01 and 2007-02-02
library(sqldf)
assignmentdata<-read.csv.sql("./data/exdata_data_household_power_consumption/household_power_consumption.txt",sql='select * from file where Date == "1/2/2007" or Date == "2/2/2007"',sep=";")
assignmentdata$Date<-as.Date(assignmentdata$Date,"%d/%m/%Y")

## Creating a readable time format
assignmentdata$NewTime<-paste(assignmentdata$Date,assignmentdata$Time,sep=" ")
assignmentdata$NewTime<-strptime(assignmentdata$NewTime,"%Y-%m-%d %H:%M:%S")

## Constructing the Global Active Power line chart
png(file="plot2.png",bg="transparent")
with(assignmentdata,plot(NewTime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(assignmentdata,lines(NewTime,Global_active_power))
dev.off()