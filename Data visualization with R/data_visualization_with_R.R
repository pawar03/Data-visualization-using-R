library(ggplot2)
library(tidyverse)
library(reshape)

options(repr.plot.width = 18, repr.plot.height = 8)

data <- read.csv(file = "Crop_recommendation.csv")
head(data)

print(paste("Number of records: ", nrow(data)))
print(paste("Number of features: ", ncol(data)))


summary(data)


colnames(data) 


unique(data$label)


sum(is.na(data))


dplyr::count(data, data$label, sort = TRUE)


library(lessR)
d <- Read("Crop_recommendation.csv")


crop.pivot <- pivot(d, mean, c(N,P,K,temperature,humidity,ph,rainfall), label)
head(crop.pivot)


dfm <- melt(crop.pivot[,c('label','N','P','K')],id.vars = 1)

ggplot(dfm,aes(x = label,y = value)) + 
    geom_bar(aes(fill = variable),stat = "identity",position = "dodge") + 
    theme_classic() +
    labs(y="Values", 
       x="Crops", 
       title="Comparision of N, P, K") + 
    theme(text = element_text(size=25),
        axis.text.x = element_text(angle=90, hjust=1))



df <- data.frame(label = crop.pivot['label'], N=crop.pivot['N'])
df <- df[order(-df$N),]
df <- head(df)
head(df)


ggplot(df, aes(x=label, y=N)) + 
  geom_bar(stat = "identity") +
  coord_flip() +
theme_classic() +
    labs(x="Crops", 
       y="N", 
       title="Nitrogen") + 
    theme(text = element_text(size=20))




