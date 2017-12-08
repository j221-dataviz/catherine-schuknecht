
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
        title = "Messaging breakdown in the top 100 bible-minded market areas", 
        border.col="white",
        fontsize.labels= 13,
        fontcolor.labels = "white",
        bg.labels="transparent",
        fontfamily.title = "Georgia",
        fontfamily.labels = "Georgia"
        )
        

# make it interactive ("rootname" becomes the title of the plot):
inter=d3tree2( top_100_map ,  rootname = "top_100_map" )


top_100_sums$label <- paste(top_100_sums$message_audience, top_100_sums$billboard_number, sep = "\n")




factor(c("Christians", "Non-Christians", "Message Not Available")

treemap(dat, index="letters", vSize="x", vColor="y", type="manual", palette="RdYlBu")

tree_map <- treemap(top_100_sums,
                    index=c("message_audience"),
                    vSize = "billboard_number",
                    vColor= "message_audience",
                    palette = values=c("#d73027","#97959c", "#4575b4"))

,
                    title=" ",
                    fontsize.title = 12 #Change the font size of the title,
                    font_family_exists("Georgia"))


billboards_sums <- read_csv("billboards_sums.csv")

tree_map <- treemap(billboards_sums,
        index=c("markets"),
        vSize = "billboard_number",
        vColor= "message_audience",
        type="categorical",
        palette = values=c("#d73027","#4575b4", "#97959c"))

,
        title=" ",
        fontsize.title = 12 #Change the font size of the title,
        font_family_exists("Georgia"))
