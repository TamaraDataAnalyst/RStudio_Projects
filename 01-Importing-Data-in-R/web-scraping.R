#Best Restaurants in Montreal
#Inspired by Hadley Wickham, Chief Scientist, RStudio

require(rvest) #rvest: easy web scraping 
require(dplyr) #data manipulation


url <- "https://www.tripadvisor.ca/Restaurants-g155032-Montreal_Quebec.html"
httr::BROWSE(url)

Classement <- url %>%
read_html() %>%
html_nodes(".shortSellDetails")
length(Classement)

xml_structure(Classement[[1]])

.title <- Classement %>%
  html_node(".property_title") %>%
  html_text()
  
.popIndex <- Classement %>%
  html_node(".popIndexDefault") %>%
  html_text()

rating <- Classement %>%
  html_node(".rating .sprite-ratings") %>%
  html_attr("alt") %>%
  gsub(" of 5 stars", "", .) %>%
  as.integer()

reviews <- Classement %>%
  html_node(".review_stubs_item+ .review_stubs_item a") %>%
  html_text()

date <- Classement %>%
  html_node(".review_stubs_item+ .review_stubs_item .date") %>%
  html_text

df <- data_frame(.title, .popIndex, rating,reviews,date) 
df$date <- strptime(df$date,"%d/ %m/ %Y", tz="EST") 
View(df)











