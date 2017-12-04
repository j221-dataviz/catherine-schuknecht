> setwd("~/Documents/UCBSOJ/Fall classes/cat-schuknecht/data")

# load packages to read, write and manipulate data
library(readr)
library(dplyr)
library(raster)
library(rgdal)
library(maptools)
library(sp)

# read data 
bible_minded_cities <- read.csv("us_bible_minded_cities.csv")
dma <- shapefile("2008_nielsen_dmas/DMAs.shp")

# merge on common variable, here called 'key'
dma_join <- merge(bible_minded_cities, dma, by.x = 'market', by.y = 'NAME')

write.csv(dma_join)


#convert merged data frame to shapefile
dma_join_shp <-  dma_join
coordinates(dma_join_shp)=~"Dcp"+"Rcp"
proj4string(dma_join_shp)<- CRS("+proj=longlat +datum=WGS84")

dma_join_lng_lat<-spTransform(dma_join_shp,CRS("+proj=longlat"))

> raster::shapefile(LLcoor, "MyShapefile.shp")