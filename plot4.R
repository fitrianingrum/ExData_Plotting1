source("load_data.R")

df <- LoadElectricPowerConsumptionData()

plot4 <- function() {
  par(mfrow=c(2,2))
  
  # Plot 1
  plot(df$Time,
       df$Global_active_power, 
       type="l", 
       xlab="", 
       ylab="Global Active Power")
  
  # Plot 2
  plot(df$Time,
       df$Voltage, 
       type="l", 
       xlab="datetime", 
       ylab="Voltage")
  
  # Plot 3
  plot(df$Time,
       df$Sub_metering_1, 
       type="l", 
       xlab="", 
       ylab="Energy sub metering")
  
  lines(df$Time,
        df$Sub_metering_2,
        col="red")
  
  lines(df$Time,
        df$Sub_metering_3,
        col="blue")
  
  legend("topright", 
         col=c("black","red","blue"), 
         # Added spaces so that it is displayed fully in legend
         c("Sub_metering_1       ","Sub_metering_2       ", "Sub_metering_3       "),  
         lty=c(1,1), 
         bty="n", 
         cex=.5) 
  
  # Plot 4
  plot(df$Time,
       df$Global_reactive_power, 
       type="l", 
       xlab="datetime", 
       ylab="Global_reactive_power")
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  
  cat("plot4.png has been successfully saved in", getwd())
}

plot4()