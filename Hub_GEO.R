install.packages("devtools")
library("devtools")
library(plotly)
library(maps)
HUB <- read.csv("C:/Users/lobanion/Desktop/R Projects/Geocoder/pharmacy-details.CSV",header=TRUE)
library(ggmap)
trace1 <- list(x=map("state")$x,
               y=map("state")$y)
trace2 <- list(x= HUB$Longitude,
               y=HUB$Latitude,
               text=HUB$Pharmacy,
               type="scatter",
               mode="markers",
               marker=list(
                 "size"=10,
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

