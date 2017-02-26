source("load_data.R")

df <- LoadElectricPowerConsumptionData()

plot3 <- function() {
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
         c("Sub_metering_1       ","Sub_metering_2       ", "Sub_metering_3       "),
         lty=1, 
         lwd=2)

  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  
  cat("Plot3.png has been successfully saved in", getwd())
}

plot3()