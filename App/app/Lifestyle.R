#Changes to the general lifestyle due to COVID-19 in selected countries 2020


library(readxl)
library(ggplot2)
library(ggthemes)
library(tidyverse)

Lifestyle<-read.csv("Statista_data/Lifestyle.csv", sep=";")
colnames(Lifestyle)<-c("Change","China","Germany","UK","USA","Value")
Lifestyle<-Lifestyle[-6]



Lifestyleplot<-Lifestyle %>%
  gather(key, value, -Change) %>%
  ggplot(aes(x=key, y=value, fill=key)) +
  geom_col(position = "dodge") +
  facet_wrap(~Change)+
  scale_fill_manual(values=rep(c("red","gold","darkblue","darkgreen"),2))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)



