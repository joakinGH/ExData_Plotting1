# Open Data
dataF <- read.table("./household_power_consumption.txt", 
                      na.strings = "?", sep = ";", header = T)
# Transform to date/time.
dataF$Time <- strptime(paste(dataF$Date,dataF$Time),"%d/%m/%Y %H:%S:%M")
dataF$Date <- as.Date(dataF$Date,"%d/%m/%Y")

# Filter the dataset 
dataF <- dataF[dataF$Date>=as.Date("2007-02-01","%Y-%m-%d") & dataF$Date<=as.Date("2007-02-02","%Y-%m-%d"),]

# Device PNG
png(file="plot2.png", width = 480, height = 480)

plot(1:nrow(dataF), dataF$Global_active_power,main="", xlab="", 
     ylab="Global Active Power (kilowatts)", xaxt="n", type="l")
axis(1, at=seq(1,nrow(dataF),length.out=3), labels=format(seq(dataF$Date[1],dataF$Date[nrow(dataF)]+1,length.out=3), "%a"))

dev.off()

