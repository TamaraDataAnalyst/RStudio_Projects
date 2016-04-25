require(dplyr)

#Data Manupulation and Analysis with dplyr 

setwd("~/RProjects/Reading_Large_Dataset")

download.file ("http://stat-computing.org/dataexpo/2009/2008.csv.bz2", destfile = "2008.csv.bz2")

#Read csv file
flights <- read.table(gzfile("2008.csv.bz2"), header = T, fill = TRUE, sep = ",",stringsAsFactors=FALSE)

#Having a pick at the data structure

dim(flights)
#1398226 observations     29 variables

names(flights)
# View the column names 

#remove NA
na.omit(flights)

head(flights, n=100)
#View the first hundred rows

tail(flights, n=100)
#View the last hundred rows

str(flights)
#Provide an insight into each column data type

summary(flights)
#R returns some basic statistics like the column mean, median and interquartile ranges

#Querying the flights2008 dataset

# Remove unnecessary columns
flights2008 <- flights %>%
  select(-(Cancelled:LateAircraftDelay))

flights2008 %>%
  filter(UniqueCarrier %in% c("UA","YV")) %>%
  select(FlightNum, UniqueCarrier, Dest) %>% distinct()

flights2008 %>%
  select(Origin, Dest, contains("Taxi"))

flights2008 %>%
  group_by(Month, DayofMonth) %>%
  top_n(5, DepDelay) %>%
  arrange(desc(DepDelay)) %>%
  select(UniqueCarrier,Month, DayofMonth, DepDelay) 

flights2008 %>%
  group_by(UniqueCarrier) %>%
  summarise_each(funs(sum(., na.rm=TRUE), mean (., na.rm=TRUE),min(., na.rm=TRUE), max(., na.rm=TRUE)), matches("Delay")) %>%
  arrange(desc(ArrDelay_sum))



  
  








  


