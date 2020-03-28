library(dplyr)
library(ggplot2)



mobility <- read.csv('Mobility/Distanzkategorien_in_Prozent_pro_Tag.csv', sep = ';')

colnames(mobility)

str(mobility)

# names(mobility)[names(mobility) == "?..Datum"] <- "DATE"
# names(mobility)[names(mobility) == "Beschreibung"] <- "DESCRIPTION"
# names(mobility)[names(mobility) == "Auspr?.gung"] <- "PECULARITY"
# names(mobility)[names(mobility) == "Kanton_Z?.rich_Ja"] <- "CANTON_ZURICH_YES"
# names(mobility)[names(mobility) == "Kanton_Z?.rich_Nein"] <- "CANTON_ZURICH_NO"
# names(mobility)[names(mobility) == "Alter_15.29"] <- "AGE_BTW_15_29"
# names(mobility)[names(mobility) == "Alter_30.64"] <- "AGE_BTW_30_64"
# names(mobility)[names(mobility) == "Alter_65.79"] <- "AGE_BTW_65_79"
# names(mobility)[names(mobility) == "M?.nnlich"] <- "MALE"
# names(mobility)[names(mobility) == "Weiblich"] <- "FEMALE"
# names(mobility)[names(mobility) == "St?.dtisch"] <- "URBAN"
# names(mobility)[names(mobility) == "L?.ndlich"] <- "RURAL"
# names(mobility)[names(mobility) == "Erwerbst?.tig"] <- "EMPLOYED"
# names(mobility)[names(mobility) == "In_Ausbildung"] <- "STUDYING"
# names(mobility)[names(mobility) == "Nicht_Erwerbst?.tig"] <- "NOT_WORKING"


mobility$Datum <- as.Date.factor(mobility$Datum, tryFormats = "%d.%m.%Y")

head(mobility)



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

dist_100km_old
head(dist_100km_stud)


#ggplot age

plot_age <- ggplot() +
  geom_line(data = dist_100km_young, aes(x = Datum, y = Alter_15.29)) +
  geom_line(data = dist_100km_middle, aes(x = Datum, y = Alter_30.64), color ="red") +
  geom_line(data = dist_100km_old, aes(x = Datum, y = Alter_65.79), color = "blue")+
  labs(x = "Datum",
       y = "Prozenzsatz",
       title = "Anteil aller die ?ber 100km pro Tag zur?cklegen")




#ggplot employed

plot_employed <- ggplot(data = dist_100km_empl, aes(x = Datum, y = Erwerbstätig)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Arbeitst?tigen",
       title = "Anteil an Arbeitst?tigen die ?ber 100km pro Tag zur?cklegen")

#ggplot students

plot_students <- ggplot(data = dist_100km_stud, aes(x = Datum, y = In_Ausbildung)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Studenten",
       title = "Anteil an Studenten die ?ber 100km pro Tag zur?cklegen")

#ggplot female

plot_female <- ggplot(data = dist_100km_female, aes(x = Datum, y = Weiblich)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Frauen",
       title = "Anteil an Frauen die ?ber 100km pro Tag zur?cklegen")


#ggplot male

plot_male <- ggplot(data = dist_100km_male, aes(x = Datum, y = Männlich)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller M?nner",
       title = "Anteil an M?nner die ?ber 100km pro Tag zur?cklegen")

#ggplot gender comparison

plot_gender <- ggplot() +
  geom_line(data = dist_100km_male, aes(x = Datum, y = Männlich)) +
  geom_line(data = dist_100km_female, aes(x = Datum, y = Weiblich), color ="red") +
  geom_line(data = dist_100km_stud, aes(x = Datum, y = In_Ausbildung), color = "blue")+
  labs(x = "Datum",
       y = "Prozenzsatz",
       title = "Anteil aller die ?ber 100km pro Tag zur?cklegen")
  












