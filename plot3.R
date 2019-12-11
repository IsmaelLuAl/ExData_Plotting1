#Read, Names and Subset

power <- read.csv("household_power_consumption.txt",
                  header = T,
                  sep = ';',
                  na.strings = "?",
                  check.names = F,
                  stringsAsFactors = F,
                  comment.char = "",
                  quote = '\"')

subpower <- subset(power, Date %in% c("1/2/2007","2/2/2007"))

subpower$Date <- as.Date(subpower$Date, format = "%d/%m/%Y")

#Transform Date and Time into objects 

datetime <- paste(as.Date(subpower$Date), subpower$Time)
subpower$Datetime <- as.POSIXct(datetime)

#Plot3

with(subpower, {
    plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


