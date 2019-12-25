

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



##  Plot2
par(mfrow = c(1,1))

plot(elecpower2$Time, elecpower2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

