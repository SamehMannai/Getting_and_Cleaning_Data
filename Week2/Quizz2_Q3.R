require(httr)
require(XML)

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
lines <- readLines(con)
close(con)
c(nchar(lines[10]), nchar(lines[20]), nchar(lines[30]), nchar(lines[100]))