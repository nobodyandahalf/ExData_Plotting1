## Constructing plot 3

## Reading the subset of data for 2007-02-01 and 2007-02-02
library(sqldf)
assignmentdata<-read.csv.sql("./data/exdata_data_household_power_consumption/household_power_consumption.txt",sql='select * from file where Date == "1/2/2007" or Date == "2/2/2007"',sep=";")
assignmentdata$Date<-as.Date(assignmentdata$Date,"%d/%m/%Y")

## Creating a readable time format
assignmentdata$NewTime<-paste(assignmentdata$Date,assignmentdata$Time,sep=" ")
assignmentdata$NewTime<-strptime(assignmentdata$NewTime,"%Y-%m-%d %H:%M:%S")

## Constructing the Energy sub metering line chart
png(file="plot3.png",bg="transparent")
with(assignmentdata,plot(NewTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(assignmentdata,lines(NewTime,Sub_metering_1))
with(assignmentdata,lines(NewTime,Sub_metering_2,col="red"))
with(assignmentdata,lines(NewTime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()