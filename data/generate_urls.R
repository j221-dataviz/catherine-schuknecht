library(readxl)
library(readr)
library(dplyr)

billboards <- read_excel("20171009_BillboardLocationList.xlsx", sheet=1)

billboards <- billboards %>%
  mutate(url = paste0("https://www.google.com/maps/place/@",Latitude,",",Longitude,",17z"))

write_csv(billboards, "billboards.csv", na="")
