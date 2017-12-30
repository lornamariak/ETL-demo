#import excel file 
library(readr)
 
n <- as.integer(readline(prompt="choose file extension : 1.csv,2.txt"))
if (n==1){
  datafile <- read.table(file.choose(),header = TRUE ,sep=",")
  View(datafile)
}else if (n==2){
  datafile <- read.table(file.choose(),header = TRUE ,sep="\t")
  View(datafile)
}else {
  print("choose valid output")
  }

# insert analysis here
#You can use dplyr here from tidyverse


#export data
#install.packages("RSQlite")

library("RSQLite")
sqlite    <- dbDriver("SQLite")
mydb <- dbConnect(sqlite, dbname="my.db")
dbListTables(mydb)
getwd()
dbWriteTable(mydb,"table1",datafile)
dbListFields(mydb, "table1")
