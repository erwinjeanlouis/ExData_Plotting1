plot2 <- function() {

    png("plot2.png", width=480, height=480)
    
    colClasses  <- c("character", "character", "character", "character", "character", "character",
                     "character", "character", "character")
    electricPowerConsumption <- read.csv("household_power_consumption.txt", 
                                         colClasses = colClasses, sep=";")
    
    
    feb2007ElectricPowerConsumption <- subset (electricPowerConsumption, Date == "1/2/2007" | Date == "2/2/2007")
    feb2007ElectricPowerConsumption[, "Global_active_power"] <- as.numeric(feb2007ElectricPowerConsumption[, "Global_active_power"])
    feb2007ElectricPowerConsumption$DateTime <- paste(feb2007ElectricPowerConsumption$Date, feb2007ElectricPowerConsumption$Time, sep =" ")
    feb2007ElectricPowerConsumption[, "DateTime"] <- as.POSIXct(feb2007ElectricPowerConsumption[, "DateTime"], format="%d/%m/%Y %H:%M:%S")
    
    plot (feb2007ElectricPowerConsumption$DateTime, 
          feb2007ElectricPowerConsumption$Global_active_power,
          type="l", ylab="Global Active Power(kilowatts)", xlab="")
    dev.off() ## Don't forget to close the PNG device!       
}
