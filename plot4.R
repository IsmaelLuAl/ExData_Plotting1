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

#Plot4

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(subpower, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})