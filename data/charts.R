# load required packages
library(ggplot2)
library(readr)
library(dplyr)

# load disease and democracy data
points_data <- read_csv("points_in_polygons.csv")

# calculate total number of billboards by bible mindedness...

# ...number of N billboardsby bible mindedness
bible_minded_N_sum <- points_data %>%
  group_by(top_bible_minded_y_n) %>%
  summarize(n_billboard_count = sum(point_count_n))

# map N billboards in bible minded areasv
points_N_data_chart <- ggplot(bible_minded_N_sum, aes(x = top_bible_minded_y_n, y = n_billboard_count)) +
  xlab("Bible Minded") +
  ylab("Number of Billboards") +
  theme_minimal(base_size = 14, base_family = "Georgia")

# Make a column chart
points_N_data_chart +
  geom_bar(
    stat = "identity", 
    color = "#888888", 
    aes(fill = bible_minded_N_sum)) +
  ggtitle("Billboards targeting non-Christians")

# set color and fill
points_Y_data_chart +
  geom_bar(stat = "identity", 
           color = "#888888", 
           fill = "#CCCCCC", 
           alpha = 0.5) +
  ggtitle("Billboards targeting Christians")

# plot saved chart template
plot(points_Y_data_chart)

#------------------------------

# calculate total number of billboards by bible mindedness...

# ...number of N billboardsby bible mindedness
bible_minded_N_sum <- points_data %>%
  group_by(top_bible_minded_y_n) %>%
  summarize(n_billboard_count = sum(point_count_n))

# map N billboards in bible minded areasv
points_N_data_chart <- ggplot(bible_minded_N_sum, aes(x = top_bible_minded_y_n, y = n_billboard_count)) +
  xlab("Bible Minded") +
  ylab("Number of Billboards") +
  theme_minimal(base_size = 14, base_family = "Georgia")

# Make a column chart
points_N_data_chart +
  geom_bar(
    stat = "identity", 
    color = "#888888", 
    aes(fill = bible_minded_N_sum)) +
  ggtitle("Billboards targeting non-Christians")

# set color and fill
points_N_data_chart +
  geom_bar(stat = "identity", 
           color = "#888888", 
           fill = "#CCCCCC", 
           alpha = 0.5) +
  ggtitle("Column chart")

# plot saved chart template
plot(points_Y_data_chart)
