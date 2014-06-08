plot1 <- function() {
    
    ## Read outcome data
    png("plot1.png", width=480, height=480)
    
    fromDate <- as.Date("2007/02/01", format="%Y/%m/%d")    
    toDate <- as.Date("2007/02/02", format="%Y/%m/%d")
    #colClasses  <- c("date", "POSIXct", "numeric", "numeric", "numeric", "numeric",
    #        "numeric", "numeric", "numeric")
    colClasses  <- c("character", "character", "character", "character", "character", "character",
                     "character", "character", "character")
    electricPowerConsumption <- read.csv("household_power_consumption.txt", 
                                 colClasses = colClasses, sep=";")
    feb2007ElectricPowerConsumption <- subset (electricPowerConsumption, Date == "1/2/2007" | Date == "2/2/2007")

    feb2007ElectricPowerConsumption[, "Date"] <- as.Date(feb2007ElectricPowerConsumption[, "Date"], format="%d/%m/%Y")
    
    feb2007ElectricPowerConsumption[, "Global_active_power"] <- as.numeric(feb2007ElectricPowerConsumption[, "Global_active_power"])
    hist (feb2007ElectricPowerConsumption$Global_active_power, 
          main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="frequency", col = "red")
    
    #dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
    dev.off() ## Don't forget to close the PNG device!    
}