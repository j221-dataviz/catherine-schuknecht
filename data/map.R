
# load packages to read, write and manipulate data
library(rgeos)
library(sp)
library(rgdal)
library(raster)
library(ggplot2)
library(ggiraph)
library(sp)
library(leaflet)

# read data 
billboards <- read.csv("billboards_all.csv")
dma <- readOGR("dma_2008","DMAs")
roads <- readOGR("2017_us_primaryroads","tl_2017_us_primaryroads")

# load the dma data into a leaflet map
dma_map <- leaflet(data=dma)

# set color palette (TK)

# make leaflet map centered on Berkeley with Carto tiles
dma_map %>%
  setView(lng = -98.5795, lat = 39.828175, zoom = 4) %>%
  addProviderTiles("CartoDB.Positron")
#add dma polygons
  addPolygons(
    data = dma,
    stroke = FALSE,
    smoothFactor = 0.1,
    weight = 0.5,
    color ="#F1AA70",
    fillOpacity = 0.75
    ) %>%
#add billboard markers (interactivity w/ images TK)
  addMarkers(
      data = billboards,
      lng = "longitude", lat = "latitude",
      label = "messages",
      labelOptions = labelOptions(noHide = T, direction = "bottom",
      style = list(
        "color" = "red",
        "font-family" = "serif",
        "font-style" = "italic",
        "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
        "font-size" = "12px",
        "border-color" = "rgba(0,0,0,0.5)"
        )) %>%
#add primary roads
  addPolylines(
    map, data = roads, polyline = "LINEARID")

# print
print(dma_map)

