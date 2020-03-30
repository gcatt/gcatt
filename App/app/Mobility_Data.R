library(dplyr)
library(ggplot2)



mobility <- read.csv('Mobility/Distanzkategorien_in_Prozent_pro_Tag.csv', sep = ';')




mobility$Datum <- as.Date.factor(mobility$Datum, tryFormats = "%d.%m.%Y")





### 2km-10km Filter
dist_2_10km <- filter(mobility, Beschreibung == "Distanz", Ausprägung == "2 - 10 Kilometer")

### 10km-20km Filter
dist_10_20km <- filter(mobility, Beschreibung == "Distanz", Ausprägung == "10 - 20 Kilometer")

### 20km-50km Filter
dist_20_50km <- filter(mobility, Beschreibung == "Distanz", Ausprägung == "20 - 50 Kilometer")

### 50km-100km Filter
dist_50_100km <- filter(mobility, Beschreibung == "Distanz", Ausprägung == "50 - 100 Kilometer")

### 100km Filter
dist_100km <- filter(mobility, Beschreibung == "Distanz", Ausprägung == "100++ Kilometer")


### select Studying
dist_100km_stud <- select(dist_100km, "In_Ausbildung", "Datum")
dist_100km_empl <- select(dist_100km, "Erwerbstätig", "Datum")
dist_100km_female <-select(dist_100km, "Weiblich", "Datum")
dist_100km_male <-select(dist_100km, "Männlich", "Datum")
dist_100km_gender <- select(dist_100km, "Männlich", "Weiblich", "Datum")
dist_100km_young <-select(dist_100km, "Alter_15.29", "Datum")
dist_100km_middle <-select(dist_100km, "Alter_30.64", "Datum")
dist_100km_old <- select(dist_100km, "Alter_65.79", "Datum")




#ggplot age

plot_age <- ggplot() +
  geom_line(data = dist_100km_young, aes(x = Datum, y = Alter_15.29, color = "Generation Y")) +
  geom_line(data = dist_100km_middle, aes(x = Datum, y = Alter_30.64, color ="Generation X")) +
  geom_line(data = dist_100km_old, aes(x = Datum, y = Alter_65.79, color ="Boomer")) +
  labs(x = "Date",
       y = "Ratio",
       title = "People travelling more than 100km a day") +
  scale_color_manual(name = "Legend", labels = c('Generation Y' , 'Genereation X', 'Boomer'), values=c("darkgreen", "red", 'blue'))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)
 




#ggplot employed

plot_employed <- ggplot(data = dist_100km_empl, aes(x = Datum, y = Erwerbstätig), color = white) +
  geom_point() +
  labs(x = "Date",
       y = "Ratio",
       title = "Employees travelling more than 100km a day")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)

#ggplot students

plot_students <- ggplot(data = dist_100km_stud, aes(x = Datum, y = In_Ausbildung)) +
  geom_point() +
  labs(x = "Date",
       y = "Ratio",
       title = "Students travelling more than 100km a day")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)
#ggplot female

plot_female <- ggplot(data = dist_100km_female, aes(x = Datum, y = Weiblich)) +
  geom_point() +
  labs(x = "Date",
       y = "Ratio",
       title = "Women travelling more than 100km a day")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)


#ggplot male

plot_male <- ggplot(data = dist_100km_male, aes(x = Datum, y = Männlich)) +
  geom_point() +
  labs(x = "Date",
       y = "Ratio",
       title = "Men travelling more than 100km a day")+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)


#ggplot gender comparison


plot_gender <- ggplot(color = 'white') +
  geom_line(data = dist_100km_male, aes(x = Datum, y = Männlich, color = "Male")) +
  geom_line(data = dist_100km_female, aes(x = Datum, y = Weiblich, color ="Female")) +
  labs(x = "Date",
       y = "Ratio",
       title = "Gender Comparison of people travelling more than 100km a day")+
  scale_color_manual(name = "Legend", values=c('red', 'darkgreen'))+
  theme(
    panel.background = element_rect(fill = 'white', colour = 'lightgrey', size = 0.5, linetype = "solid"), 
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "lightgrey"),
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "lightgrey"),# Background of the entire plot
    legend.position="right",)












