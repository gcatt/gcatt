library(dplyr)
library(ggplot2)

mobility <- daily_distance

colnames(mobility)

names(mobility)[names(mobility) == "ï..Datum"] <- "DATE"
names(mobility)[names(mobility) == "Beschreibung"] <- "DESCRIPTION"
names(mobility)[names(mobility) == "AusprÃ.gung"] <- "PECULARITY"
names(mobility)[names(mobility) == "Kanton_ZÃ.rich_Ja"] <- "CANTON_ZURICH_YES"
names(mobility)[names(mobility) == "Kanton_ZÃ.rich_Nein"] <- "CANTON_ZURICH_NO"
names(mobility)[names(mobility) == "Alter_15.29"] <- "AGE_BTW_15_29"
names(mobility)[names(mobility) == "Alter_30.64"] <- "AGE_BTW_30_64"
names(mobility)[names(mobility) == "Alter_65.79"] <- "AGE_BTW_65_79"
names(mobility)[names(mobility) == "MÃ.nnlich"] <- "MALE"
names(mobility)[names(mobility) == "Weiblich"] <- "FEMALE"
names(mobility)[names(mobility) == "StÃ.dtisch"] <- "URBAN"
names(mobility)[names(mobility) == "LÃ.ndlich"] <- "RURAL"
names(mobility)[names(mobility) == "ErwerbstÃ.tig"] <- "EMPLOYED"
names(mobility)[names(mobility) == "In_Ausbildung"] <- "STUDYING"
names(mobility)[names(mobility) == "Nicht_ErwerbstÃ.tig"] <- "NOT_WORKING"


mobility$DATE <- as.Date(mobility$DATE, format = "%d.%m.%y")
head(mobility)


### 2km-10km Filter
dist_2_10km <- filter(mobility, DESCRIPTION == "Distanz", PECULARITY == "2 - 10 Kilometer")

### 10km-20km Filter
dist_10_20km <- filter(mobility, DESCRIPTION == "Distanz", PECULARITY == "10 - 20 Kilometer")

### 20km-50km Filter
dist_20_50km <- filter(mobility, DESCRIPTION == "Distanz", PECULARITY == "20 - 50 Kilometer")

### 50km-100km Filter
dist_50_100km <- filter(mobility, DESCRIPTION == "Distanz", PECULARITY == "50 - 100 Kilometer")

### 100km Filter
dist_100km <- filter(mobility, DESCRIPTION == "Distanz", PECULARITY == "100++ Kilometer")


### select Studying
dist_100km_stud <- select(dist_100km, "STUDYING", "DATE")
dist_100km_empl <- select(dist_100km, "EMPLOYED", "DATE")
dist_100km_female <-select(dist_100km, "FEMALE", "DATE")
dist_100km_gender <- select(dist_100km, "MALE", "FEMALE", "DATE")
dist_100km_young <-select(dist_100km, "AGE_BTW_15_29", "DATE")
dist_100km_middle <-select(dist_100km, "AGE_BTW_30_64", "DATE")
dist_100km_old <- select(dist_100km, "AGE_BTW_65_79", "DATE")

dist_100km_old


#ggplot age

ggplot() +
  geom_line(data = dist_100km_young, aes(x = DATE, y = AGE_BTW_15_29)) +
  geom_line(data = dist_100km_middle, aes(x = DATE, y = AGE_BTW_30_64), color ="red") +
  geom_line(data = dist_100km_old, aes(x = DATE, y = AGE_BTW_65_79), color = "blue")+
  labs(x = "Datum",
       y = "Prozenzsatz",
       title = "Anteil aller die über 100km pro Tag zurücklegen")



#ggplot employed

ggplot(data = dist_100km_empl, aes(x = DATE, y = EMPLOYED)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Arbeitstätigen",
       title = "Anteil an Arbeitstätigen die über 100km pro Tag zurücklegen")

#ggplot students

ggplot(data = dist_100km_stud, aes(x = DATE, y = STUDYING)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Studenten",
       title = "Anteil an Studenten die über 100km pro Tag zurücklegen")

#ggplot female

ggplot(data = dist_100km_female, aes(x = DATE, y = FEMALE)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Frauen",
       title = "Anteil an Frauen die über 100km pro Tag zurücklegen")


#ggplot male

ggplot(data = dist_100km_male, aes(x = DATE, y = MALE)) +
  geom_point() +
  labs(x = "Datum",
       y = "Prozenzsatz aller Männer",
       title = "Anteil an Männer die über 100km pro Tag zurücklegen")

#ggplot gender comparison

ggplot() +
  geom_line(data = dist_100km_male, aes(x = DATE, y = MALE)) +
  geom_line(data = dist_100km_female, aes(x = DATE, y = FEMALE), color ="red") +
  geom_line(data = dist_100km_stud, aes(x = DATE, y = STUDYING), color = "blue")+
  labs(x = "Datum",
       y = "Prozenzsatz",
       title = "Anteil aller die über 100km pro Tag zurücklegen")
  












