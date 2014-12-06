# Open Data
dataF <- read.table("./household_power_consumption.txt", 
                      na.strings = "?", sep = ";", header = T)
# Transform to date/time.
dataF$Time <- strptime(paste(dataF$Date,dataF$Time),"%d/%m/%Y %H:%S:%M")
dataF$Date <- as.Date(dataF$Date,"%d/%m/%Y")

# Filter the dataset 
dataF <- dataF[dataF$Date>=as.Date("2007-02-01","%Y-%m-%d") & dataF$Date<=as.Date("2007-02-02","%Y-%m-%d"),]

# Device PNG
png(file="plot1.png", width = 480, height = 480)
hist(dataF$Global_active_power, col="firebrick2", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
