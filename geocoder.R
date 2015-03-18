install.packages("devtools")
library("devtools")
library(plotly)
library(maps)
FACILITY_CHAIN <- read.csv("C:/Users/lobanion/Desktop/R Projects/Geocoder/FACILITY_CHAIN.CSV",header=TRUE)
library(ggmap)

FACILITY_CHAIN$Concate <- paste(FACILITY_CHAIN$ADDR1,FACILITY_CHAIN$ADDR2,FACILITY_CHAIN$CITY,FACILITY_CHAIN$STATE,FACILITY_CHAIN$ZIP)
loc <- geocode(as.character(FACILITY_CHAIN$Concate))

FACILITY_CHAIN$lon<-loc$lon
FACILITY_CHAIN$lat<-loc$lat

trace1 <- list(x=map("state")$x,
               y=map("state")$y)

trace2 <- list(x= FACILITY_CHAIN$lon,
               y=FACILITY_CHAIN$lat,
               text=FACILITY_CHAIN$FACILITY_NAME,
               type="scatter",
               mode="markers",
               marker=list(
                 "size"=sqrt(FACILITY_CHAIN$TOTAL_BEDS/max(FACILITY_CHAIN$TOTAL_BEDS))*10,
                 "opacity"=0.5)
)


library("devtools")
install_github("ropensci/plotly")
devtools::install_github("ropensci/plotly")
library(plotly)
set_credentials_file("Lobanion", "ufa2r31zpe")

p <- plotly(username="Lobanion", key="ufa2r31zpe") 

response <- p$plotly(trace1,trace2)

url <- response$url

filename <- response$filename

browseURL(response$url)