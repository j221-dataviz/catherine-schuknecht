
#load plugins
library(treemap)
library(dplyr)
library(readr)

#read csv
top_100_sums <- read_csv("top_100_sums.csv")

# treemap
top_100_map <- treemap(top_100_sums,
        index="billboard_number", 
        vSize="billboard_number",
        type="index",
        vColor= "message_audience",
        palette = c("#f46d43","#abd9e9","#939393"),
        title = "Messaging breakdown in the top 100 bible-minded market areas (Total: 355)", 
        border.col="white",
        fontsize.labels= 13,
        fontcolor.labels = "white",
        bg.labels="transparent",
        fontfamily.title = "Georgia",
        fontfamily.labels = "Georgia"
        )
        