> setwd("~/Documents/UCBSOJ/Fall classes/cat-schuknecht/data")

# load packages to read, write and manipulate data
library(readr)
library(dplyr)
library(raster)
library(rgdal)

# read data 
bible_minded_cities <- read.csv("us_bible_minded_cities.csv")
dms <- shapefile("dma_2008/DMAs.shp")

# merge on common variable, here called 'key'
dms_join <- merge(x=bible_minded_cities, y=dms, by.x = 'market', by.y = 'NAME,C,30')
