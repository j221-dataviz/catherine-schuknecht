
#load plugins
library(treemap)
library(dplyr)
library(readr)

  #read csv
  sums_less <- read_csv("sums_less.csv")

# treemap
sums_less_map <- treemap(sums_less,
                         index="billboard_number", 
                         vSize="billboard_number",
                         type="index",
                         vColor= "message_audience",
                         palette = c("#f46d43","#abd9e9","#939393"),
                         title = "Messaging breakdown in the less bible-minded market areas", 
                         border.col="white",
                         fontsize.labels= 13,
                         fontcolor.labels = "white",
                         bg.labels="transparent",
                         fontfamily.title = "Georgia",
                         fontfamily.labels = "Georgia"
)
