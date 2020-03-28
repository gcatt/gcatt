import pandas as pd
import matplotlib.pyplot as plt

pd.DataFrame()

df1 = pd.read_csv("Distanzkategorien_in_Prozent_pro_Tag.csv", sep = ';', header=0)




is_distanz = df1["Beschreibung"]=="Distanz"

df_distanz = df1[is_distanz]


pd.







