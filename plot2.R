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

#Plot2

with(subpower, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
})


title(main="Global Active Power Vs Time")
