import numpy as np

'''
    df: Dataframe que será usado para os cálculos
    coluna: Coluna do Dataframe que será usada para os cálculos. Deve estar entre aspas ('')
'''

# Cria o array para os cálculos posteriores
def cria_array(df, coluna):
    return np.array(df[coluna].dropna())

# Calcula a média da coluna enviada
def calc_media(df, coluna):
    array = cria_array(df, coluna)
    return np.mean(array)

# Calcula a mediana da coluna enviada
def calc_mediana(df, coluna):
    array = cria_array(df, coluna)
    return np.median(array)

# Calcula a distância entre média e mediana da coluna enviada
def calc_distancia(df, coluna):
    media = calc_media(df, coluna)
    mediana = calc_mediana(df, coluna)
    return (media - mediana) / mediana

# Calcula os quartis da coluna enviada. Retorna uma lista
def calc_quartis(df, coluna):
    array = cria_array(df, coluna)
    q1 = np.percentile(array, 25)
    q3 = np.percentile(array, 75)
    return [q1, q3]

# Calcula o IQR da coluna enviada
def calc_iqr(df, coluna):
    quartis = calc_quartis(df, coluna)
    return quartis[1] - quartis[0]

# Calcula o limite inferior e limite superior da coluna enviada. Retorna uma lista
def calc_limites(df, coluna):
    quartis = calc_quartis(df, coluna)
    lim_inf = quartis[0] - (1.5 * calc_iqr(df, coluna))
    lim_sup = quartis[1] + (1.5 * calc_iqr(df, coluna))
    return [lim_inf, lim_sup]
