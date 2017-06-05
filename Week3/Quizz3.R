#Q1

setwd("/home/smannai/Dropbox/CV-Anglais/Industrie/coursera/Getting_and_Cleaning_Data/Week3/")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="idaho_housing.csv",mode="w",method="curl")

data <- read.csv("idaho_housing.csv")

head(data[which(data$AGS==6 & data$ACR==3), ],n=3)
#OR
agricultureLogical <- data$AGS==6 & data$ACR==3
which(agricultureLogical) 
head(which(agricultureLogical),3)


#Q2
setwd("/home/smannai/Dropbox/CV-Anglais/Industrie/coursera/Getting_and_Cleaning_Data/Week3/")
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(URL, destfile="jeff.jpg", mode = "w", method = "curl")
data_image = readJPEG("jeff.jpg", native = TRUE)
quantile(data_image, probs = c(0.3, 0.8))

#Q3

1
ArrangedData<-arrange(MergedData,desc(V2))
ans1<-nrow(MergedData)
ans1
ans2<-ArrangedData$V4[13]
ans2

#Q4

Selected_data_1<-filter(ArrangedData,Income.Group=="High income: OECD")
Selected_data_2<-filter(ArrangedData,Income.Group=="High income: nonOECD")
answer1<-mean(Selected_data_1$V2)
answer1
answer2<-mean(Selected_data_2$V2)
answer2

#Q5

factor<-quantile(ArrangedData$V2,c(0.2,0.4,0.6,0.8,1))

q1 <- ArrangedData$V2 <= 38
xtabs(q1 ~ ArrangedData$Income.Group)





