library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "Quizz2_Q2_data.csv")

acs <- read.csv("Quizz2_Q2_data.csv")

sqldf("select pwgtp1 from acs where AGEP < 50")