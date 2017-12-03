> setwd("~/Documents/UCBSOJ/Fall classes/cat-schuknecht/data")

# load packages to read, write and manipulate data
library(readr)
library(dplyr)
library(raster)
library(rgdal)

# read data 
bible_minded_cities <- read.csv("us_bible_minded_cities.csv")
dma <- shapefile("2008_nielsen_dmas/DMAs.shp")

# merge on common variable, here called 'key'
dma_join <- merge(x=bible_minded_cities, y=dma, by.x = 'market', by.y = 'NAME,C,30')
