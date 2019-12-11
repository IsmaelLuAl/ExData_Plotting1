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

#Plot1

hist(subpower$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
