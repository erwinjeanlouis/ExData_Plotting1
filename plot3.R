plot3 <- function() {
    
    png("plot3.png", width=480, height=480)
    
    colClasses  <- c("character", "character", "character", "character", "character", "character",
                     "character", "character", "character")
    electricPowerConsumption <- read.csv("household_power_consumption.txt", 
                                         colClasses = colClasses, sep=";")
    
    
    feb2007ElectricPowerConsumption <- subset (electricPowerConsumption, Date == "1/2/2007" | Date == "2/2/2007")
    feb2007ElectricPowerConsumption[, "Global_active_power"] <- as.numeric(feb2007ElectricPowerConsumption[, "Global_active_power"])
    feb2007ElectricPowerConsumption$DateTime <- paste(feb2007ElectricPowerConsumption$Date, feb2007ElectricPowerConsumption$Time, sep =" ")
    feb2007ElectricPowerConsumption[, "DateTime"] <- as.POSIXct(feb2007ElectricPowerConsumption[, "DateTime"], format="%d/%m/%Y %H:%M:%S")
    feb2007ElectricPowerConsumption[, "Sub_metering_1"] <- as.numeric(feb2007ElectricPowerConsumption[, "Sub_metering_1"])
    feb2007ElectricPowerConsumption[, "Sub_metering_2"] <- as.numeric(feb2007ElectricPowerConsumption[, "Sub_metering_2"])
    feb2007ElectricPowerConsumption[, "Sub_metering_3"] <- as.numeric(feb2007ElectricPowerConsumption[, "Sub_metering_3"])
    
    meteringRange <- range (feb2007ElectricPowerConsumption$Sub_metering_1, 
                            feb2007ElectricPowerConsumption$Sub_metering_2,
                            feb2007ElectricPowerConsumption$Sub_metering_3)
    
    plot (feb2007ElectricPowerConsumption$DateTime, 
          feb2007ElectricPowerConsumption$Sub_metering_1,
          type="l", ylab="Energy sub metering ", xlab="", col="black", ylim = meteringRange)
    
    par ( new = TRUE)

    plot (feb2007ElectricPowerConsumption$DateTime, 
          feb2007ElectricPowerConsumption$Sub_metering_2,
          type="l", ylab="Energy sub metering ", xlab="", yaxt="n", col="red", ylim = meteringRange)
    
    par ( new = TRUE)
    
    plot (feb2007ElectricPowerConsumption$DateTime, 
          feb2007ElectricPowerConsumption$Sub_metering_3,
          type="l", ylab="Energy sub metering ", xlab="", yaxt="n", col = "blue", ylim = meteringRange)
    
    legend ("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
            lty=1,col=c("black", "blue","red"), bty='n', cex=.75) 
    
    dev.off() ## Don't forget to close the PNG device!   
}
