# format OkCupid Data for processing

data <- read.csv("./OkCupid.csv", stringsAsFactors=FALSE)
data$essay_0 <- gsub("\\t", " ", data$essay_0)
data$essay_0 <- gsub(": )", ":)", data$essay_0)

library(stringr)
data$city <- word(data$location, sep=", ")
data$region <- word(data$location, sep=", ", start=-1)
data <- data[,c(1:4, 22:23, 6:21)]

data$Religion.intense <- word(data$Religion, sep=" (and|but) ", start=-1)
data$Religion.intense <- ifelse(data$Religion.intense%in%c("Agnosticism", "Atheism", "Buddhism", "Catholicism", "Christianity", "Hinduism", "Islam", "Judaism"), NA, data$Religion.intense)
data$Religion <- word(data$Religion, sep=" (and|but) ")

data$Sign.intense <- word(data$Sign, sep=" (and|but) ", start=-1)
data$Sign.intense <- ifelse(!grepl(" ", data$Sign.intense), NA, data$Sign.intense)
data$Sign <- word(data$Sign, sep=" (and|but) ")
data <- data[,c(1:14, 23, 15, 24, 16:22)]

data$Height2 <- data$Height
data$Height<- as.numeric(word(data$Height, sep="ft"))+as.numeric(word(word(data$Height, sep="in"), start=-1))/12

sample <- unique(
  c(sample(which(data$gender=="F" & !is.na(data$Height) & !is.na(data$gender)), 2000), 
    sample(which(data$gender=="M" & !is.na(data$Height) & !is.na(data$gender)), 2000)))

subdata <- data[sample,1:24]
write.csv(subdata, "./OkCupidSmall.csv", row.names=F)
