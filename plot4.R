## Constructing plot 4

## Reading the subset of data for 2007-02-01 and 2007-02-02
library(sqldf)
assignmentdata<-read.csv.sql("./data/exdata_data_household_power_consumption/household_power_consumption.txt",sql='select * from file where Date == "1/2/2007" or Date == "2/2/2007"',sep=";")
assignmentdata$Date<-as.Date(assignmentdata$Date,"%d/%m/%Y")

## Creating a readable time format
assignmentdata$NewTime<-paste(assignmentdata$Date,assignmentdata$Time,sep=" ")
assignmentdata$NewTime<-strptime(assignmentdata$NewTime,"%Y-%m-%d %H:%M:%S")

## Setting up the construction of the four charts
png(file="plot4.png",bg="transparent")
par(mfrow=c(2,2),cex=0.8)

## Top left Global Active Power line chart
with(assignmentdata,plot(NewTime,Global_active_power,type="n",xlab="",ylab="Global Active Power"))
with(assignmentdata,lines(NewTime,Global_active_power))

## Top right Voltage line chart
with(assignmentdata,plot(NewTime,Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(assignmentdata,lines(NewTime,Voltage))

## Bottom left Energy sub metering line chart
with(assignmentdata,plot(NewTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(assignmentdata,lines(NewTime,Sub_metering_1))
with(assignmentdata,lines(NewTime,Sub_metering_2,col="red"))
with(assignmentdata,lines(NewTime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

## Bottom right Global reactive power line chart
with(assignmentdata,plot(NewTime,Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power"))
with(assignmentdata,lines(NewTime,Global_reactive_power))

dev.off()