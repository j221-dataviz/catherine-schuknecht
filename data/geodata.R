library(rgdal)
library(dplyr)

roads <- readOGR("2017_us_primaryroads","tl_2017_us_primaryroads")

View(roads@data)

# sample join
roads@data <- left_join(roads@data, other_file, by=c("x"="y"))

# filtering by feature
i80 <- roads [ which(roads@data$FULLNAME == "I- 80"), ]

i40 <- roads [ which(roads@data$FULLNAME == "I- 40"), ]

plot(i80)

plot(i40)
