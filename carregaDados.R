# Carrega dados
carregaDados <- function() {
    arquivo <- "household_power_consumption.txt"
    df <- read.table(arquivo,header=TRUE,sep=";",
                     colClasses=c("character", "character", rep("numeric",7)),
                     na="?")
    # converte data e hora
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    # somente usa os dados dos dias 01 e 02 de fevereiro de 2007
    datas <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% datas)
    
    return(df)
}