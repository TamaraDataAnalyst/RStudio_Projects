 #Read table directly from the web Top Consulting Firms

require(XML)
require(dplyr)

url <-"http://www.stormscape.com/inspiration/website-lists/consulting-firms/"
httr::BROWSE(url)

topconsulting <- readHTMLTable(url,as.data.frame = T, which = 1,stringsAsFactors=F)

topconsulting <- topconsulting %>% rename(Firms =`Consulting Firm`)

topconsulting$Firms <- gsub("http.+$", replacement = "", x= topconsulting$Firms)

topconsulting[topconsulting=="-"]=NA

View(topconsulting)

head(topconsulting)


