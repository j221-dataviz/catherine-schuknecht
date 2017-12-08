
# load required packages
library(ggplot2)
library(readr)
library(dplyr)
library(ggiraph)

# load disease and democracy data
top_15_data <- read_csv("top_15_bible_minded.csv")

# Plot the basic frame of the stacked bar chart.
top_15_chart <- ggplot(data = top_15_data, aes(x = market_name, y = count_total, fill = message_audience)) +
  geom_bar(stat = "identity", alpha = 0.7) + 
  coord_flip()

# Reorder the chunks so that they represent the logical order of stage
# progression.
top_15_data$message_audience <- factor(top_15_data$message_audience, levels = c("Christians", "Non-Christians", "Message Not Available"))

# Plot the basic frame of the stacked bar chart.
top_15_chart <- ggplot(data = top_15_data, aes(x = market_name, y = count_total, fill = message_audience)) +
  geom_bar(stat = "identity", alpha = 0.8) + 
  coord_flip()

#add styling
top_15_chart +
  scale_fill_manual(name= "Billboard Target Audience",values=c("#f46d43", "#abd9e9", "#939393")) +
  theme_minimal(base_size = 12, base_family = "Georgia") +
  xlab(" ") +
  ylab("Number of Billboards") +
  ggtitle("Top 15 bible-minded market areas") + 
  theme(panel.grid.major = element_blank(), 
                         panel.grid.minor = element_blank(), 
                         panel.border = element_blank(),
                         axis.ticks = element_blank())