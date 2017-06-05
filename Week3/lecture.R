library(dplyr)
options(width = 105)
chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)
names(chicago)
head(select(chicago, city:dptp))
head(select(chicago, -(city:dptp)))
i<-match("city", names(chicago))
j<-match("dplyr", names(chicago))
head(chicago[,-(i,j)])

chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f, 10)

chicago <- arrange(chicago, date)
head(chicago)

chicago <- arrange(chicago, desc(date))
head(chicago)

chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)

chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))

chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold","hot")))
hotcold <- group_by(chicago, tempcat)
hotcold
summarize(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
years <- group_by(chicago, year)
summarize(years,pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

       
chicago %>% mutate(month = as.POSIXlt(date)$mon +1) %>% group_by(month) %>% summarize(pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))

