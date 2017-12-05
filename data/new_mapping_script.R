# load required packages
library(readr)
library(dplyr)
library(rgdal)
library(leaflet)
library(raster)
library(htmlwidgets)

# read data 
dmas <- readOGR("2008_nielsen_dmas","DMAs")
roads <- readOGR("2017_us_primaryroads","tl_2017_us_primaryroads")
bible_minded_cities <- read.csv("us_bible_minded_cities.csv")
billboards <- read_csv("billboards_all.csv")

# join DMA data to inlude bible-mindedness
dmas@data <- left_join(dmas@data, bible_minded_cities, by = c("NAME" = "market"))

# assign projection and check
crs(dmas) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0" 
dmas@proj4string

# assign same projection to roads and check
roads <- spTransform(roads, CRS = "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
roads@proj4string

# process joined data
dmas@data <- dmas@data %>%
  mutate(bible_minded = if_else(!is.na(percent_pop_bible_minded), "Yes","No"),
         percent_pop_bible_minded = as.numeric(gsub("%","",percent_pop_bible_minded)),
         percent_pop_bible_minded = ifelse(!is.na(percent_pop_bible_minded),percent_pop_bible_minded,0))
# view data
View(dmas@data) 

# convert billboards to spatial data frame
xy <- billboards[,c(3,2)]
billboards <- SpatialPointsDataFrame(coords = xy, data = billboards, proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))

# spatial join of billboards to dmas, so we know whuch DMA they are in, and whether it is a bible-minded area
billboards <- raster::intersect(billboards,dmas)

# view data
View(billboards@data)

##################
# make leaflet map

# colors for DMAS

breaks <- c(0,10,20,30,40,50,60)

# set palette for DMAS
binpal <- colorBin("Reds", dmas$percent_pop_bible_minded, breaks)

# set palette for billboards

pal <- colorFactor(c("gray","blue"), billboards$bible_minded)

dma_map <- leaflet() %>%
  setView(lng = -98.5795, lat = 39.828175, zoom = 4) %>%
  addProviderTiles("Stamen.TonerLite") %>%
#add dma polygons
addPolygons(
  data = dmas,
  stroke = 0.1,
  smoothFactor = 0.1,
  weight = 0.5,
  color = ~binpal(dmas$percent_pop_bible_minded),
  fillOpacity = 0.75
) %>%
#add primary roads
addPolylines(
    data = roads,
    weight = 0.3,
    color = "#000000"
  ) %>%
  #add billboard markers (interactivity w/ images TK)
  addCircles(
    data = billboards, 
    radius = 25000, 
    color = "#000000",
    weight = 1,
    fillColor = ~pal(billboards$bible_minded),
    fillOpacity = 0.3,
    popup = paste0("<strong>Message: </strong>", billboards$message, "</br>",
                   "<strong>Bible-minded: </strong>", billboards$bible_minded)
  ) 
    
# print
print(dma_map)

# save
# save the map
saveWidget(dma_map, "dma_billboards.html", selfcontained = TRUE, libdir = NULL, background = "white")
    




