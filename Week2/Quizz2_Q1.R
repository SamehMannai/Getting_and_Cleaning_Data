library(httr)
require(httpuv)
require(jsonlite)
y<-GET("https://api.github.com/repos/jtleek/datasharing")
json1=content(y)
json2=jsonlite::fromJSON(toJSON(json1))
json2
repo <- json2[5]
names(repo)
repo$created_at