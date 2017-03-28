# Load required packages
library(ggplot2)
library(dplyr)
library(reshape2)
library(choroplethr)
library(choroplethrMaps)
library(gridExtra)
library(knitr)
library(ggthemes)

# Read in Data from Data.World and Data4Democracy
elections <- read.csv("https://query.data.world/s/bzsc60lex3f5ou5mibupgc9ac",header=T);

# Change the column name to be compatible with choroplethr package
colnames(elections)[1]<-"region"

# Create a column that contains is a factor value clinton or trump based on who took the largest 
#       percentage of the vote in each county in the 2016 election. 
elections$value <-  as.factor(ifelse(elections$dPct > elections$rPct, "Clinton", "Trump")) # Set the desired 'value' column for choroplethr

# Create a map
choro_election <- county_choropleth(elections, num_colors = 2)

# view map. 
choro_election + scale_fill_manual(values = c("Blue", "red"))
