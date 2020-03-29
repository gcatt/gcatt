#Changes to the general lifestyle due to COVID-19 in selected countries 2020

install.packages("tidyverse")
library(readxl)
library(ggplot2)
library(ggthemes)
library(tidyverse)

Lifestyle<-read.csv("C:/Users/MrGaM/Desktop/StatistaPlots/Lifestyle.csv", sep=";")
colnames(Lifestyle)<-c("Change","China","Germany","UK","USA","Value")
Lifestyle<-Lifestyle[-6]



Lifestyleplot<-Lifestyle %>%
  gather(key, value, -Change) %>%
  ggplot(aes(x=key, y=value, fill=key)) +
  geom_col(position = "dodge") +
  facet_wrap(~Change)+
  scale_fill_manual(values=rep(c("red","gold","darkblue","darkgreen"),2))+
  theme_dark()

Lifestyleplot

