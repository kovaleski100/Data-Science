import pandas as pd
import seaborn as srn
import statistics as sts

data = pd.read_csv("tempo.csv", sep=";")
print(data)

agrupado = data.groupby(["Aparencia"]).size()
print(agrupado)

agrupado.plot.bar(color = "gray")

agrupado = data.groupby(["Vento"]).size()
print(agrupado)
agrupado.plot.bar(color="grey")

agrupado = data.groupby(["Jogar"]).size()
agrupado.plot.bar(color="gray")

print(data.isnull().sum())


data.loc[data["Aparencia"] == "menos", "Aparencia"] = "Sol"
agrupado = data.groupby(["Aparencia"]).size()
print(agrupado)


data.loc[(data["Temperatura"] < -130) | (data["Temperatura"] > 130)]
median = sts.median(data["Temperatura"])
data.loc[(data["Temperatura"] < -130) | (data["Temperatura"] > 130), "Temperatura"] = median

print(data["Temperatura"])


data["Umidade"].isnull()
median = sts.median(data["Umidade"])
print(median)
data["Umidade"].fillna(median, inplace=True)

data.loc[(data["Umidade"]< 0) | (data["Umidade"]> 100), "Umidade"] = median
print(data["Umidade"].describe())


data["Vento"].isnull().sum()

agrupamento = data.groupby(["Vento"]).size()
print(agrupamento)

data["Vento"].fillna("FALSO", inplace=True)
print(data["Vento"].isnull().sum())