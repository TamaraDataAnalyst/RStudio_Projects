require(babynames) #US baby names from 1880 - 2013
require(data.table)
require(scales)

#Data manipulation with data.table

sbn <- babynames[sample(nrow(babynames),100),]# show sample of 100 obs.

babynames = as.data.table(babynames) # 1825433 obs. 5 variables
babynames$prop = percent(babynames$prop) # proportion in percent
summary(babynames) #R returns some basic statistics like the column mean, median and interquartile ranges

str(babynames)#Provide an insight into each column data type

#What is the most popular name for a boy in 2013?
babynames[year ==2013 & sex =="M", list(year,sex,name,prop)]

#what is the most popular name for a girl between 2010 and 2013?
babynames[year >=2010 & sex =="F", list(year,sex,name,prop)]

#What are the most popular names for girls and boys for the past 10 years? 
summarized.year = babynames[year >=2003, list(sex,name,Maximum=max(n)), by="year"][order(-Maximum)]

#What are the least and the most popular names for girls and boys for the past 10 years?
babynames[ year>=2003,list(Min=min(n),Max=max(n)), by =c("year","name")]


summarized.year


