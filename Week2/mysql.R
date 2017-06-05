ucscDb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu") 
result<-dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);

result

hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTables<-dbListTables(hg19)
length(allTables)
allTables[1:5]
