getwd()

#read files and parse headers into columns#
list.files()
unzip("./exdata_data_household_power_consumption.zip")
epc_data <- read.csv("./household_power_consumption.txt", header = T, sep = ';', na.strings="?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

#format dates#
epc_data$NewDate <- strptime(as.character(epc_data$Date), "%d/%m/%Y")
epc_data$NewDate <- as.Date(epc_data$NewDate, format = "%d/%m/%Y")
epc_data$Datetime <- strptime(paste(epc_data$Date, epc_data$Time), "%d/%m/%Y %H:%M:%S")


#subset data#
epc_datasubset <- subset(epc_data, subset = (epc_data$NewDate >= "2007-02-01" & epc_data$NewDate <= "2007-02-02"))

#Plot 5#

plot(epc_datasubset$Datetime, epc_datasubset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#Save .png#

dev.copy(png,file="plot5.png", height=480, width=480)
dev.off()
                   