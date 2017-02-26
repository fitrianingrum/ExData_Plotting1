# Data Loading and Preprocessing

LoadElectricPowerConsumptionData <- function(){
  if (!file.exists("household_power_consumption.txt")) {
    fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(fileUrl, 'exdata_data_household_power_consumption.zip')
    unzip('exdata_data_household_power_consumption.zip')
  }
  
  data <- read.table("household_power_consumption.txt", header = T, sep = ";", na="?")
  
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  # Filter only the data from the dates 2007-02-01 and 2007-02-02
  df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
  
  # Set to appropriate data types
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  
  return(df)
}
