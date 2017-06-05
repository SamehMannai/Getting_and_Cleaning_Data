con <- url("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
lines <- readLines(con, n=10)
widths <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
data <- read.fwf(con, widths, header = FALSE, skip = 4)
head(data)
sum(fixed$V8)

#OR

data <- read.fwf(file = "http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", skip = 4, widths = c(12, 7,4, 9,4, 9,4, 9,4))
sum(data[, 4])

