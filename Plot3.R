

getwd()  # checks the working directory and file location. Downloaded file should be here.

elecpower <- read.csv(file ="household_power_consumption.txt", sep=";", na.strings="?")
        # read the dataset into r




elecpower$Date <- as.Date(elecpower$Date, format = "%d/%m/%Y")
        #convert the Date column class to 'Date' format

elecpower2 <- elecpower %>% filter(Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
        #select only the rows that match a given date
        


elecpower2$Time <- strftime(paste(elecpower2$Date, elecpower2$Time), format = "%y/%m/%d %H:%M:%S")

elecpower2$Time <- strptime(elecpower2$Time, format = "%y/%m/%d %H:%M:%S")
        #convert Time column to posix format



##   Plot3

par(mfrow = c(1,1))

plot(elec5$Time, elec5$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")

lines(elec5$Time, elec5$Sub_metering_2, type = "l", col = "red")

lines(elec5$Time, elec5$Sub_metering_3, type = "l", col = "blue")

legend("topright", cex = 0.5, col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

