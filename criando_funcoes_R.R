
# Criando Funções no R ------------------------------------------------------------------------
# Autora do script: Jeanne Franco -------------------------------------------------------------
# Data: 31/08/22 ------------------------------------------------------------------------------
# Referência: https://www.youtube.com/watch?v=kuMXSi1KlGc -------------------------------------

# A estrutura básica de uma função ---------------------------------------------------------------------------------------------------------

### 1. Componentes: nome da função, argumentos e 'receita'

potencia <- function(x, e) {
  res <- x^e
  return(res)
}

potencia(x = 2, e = 10)

### 2. Argumentos nomeados e não-nomeados

##### Quando o argumento não é nomeado (x, e), deve-se colocar
##### os valores na ordem da função, ou seja, primeiro o valor
##### de 'x' e depois o valor de 'e'. Caso ocorra a nomeação dos
##### valores a ordem não importa. Exemplo:

# - Argumentos não-nomeados

potencia(5, 2) # Lê-se potencia de 5 elevado a 2, primeiro deve-se
# colocar o valor da base 'x' que é 5.

# - Argumentos nomeados

potencia(e = 2, x = 5) # A ordem não importa, o resultado é o mesmo.

### 3. Estabelecendo valores default para os argumentos

potencia <- function(x, e = 2) { # Estabelece o expoente 2 como padrão
  res <- x^e
  return(res)
}

potencia(10)
potencia(3)

### 4. Construindo uma função para análise descritiva

library(dplyr)

dados <- iris

dados %>%
  group_by(Species) %>%
  summarise(Media = mean(Sepal.Length),
            DP = sd(Sepal.Length),
            Minimo = min(Sepal.Length),
            Maximo = max(Sepal.Length))

desc_num <- function(df, grupo, vd) {
  
  library(dplyr)
  
  res <- df %>%
  group_by({{grupo}}) %>%
  summarise(Media = mean({{vd}}),
            DP = sd({{vd}}),
            Minimo = min({{vd}}),
            Maximo = max({{vd}}))
  
  return(res)
}

desc_num(iris, Species, Petal.Width)
desc_num(iris, Species, Sepal.Width)
desc_num(iris, Species, Petal.Length)
desc_num(iris, Species, Sepal.Length)

### 5. Construindo uma função para gráficos

library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3, shape = 15, alpha = 0.7) +
  labs(x = "Comprimento de Sáplas (cm)", 
       y = "Comprimento de Pétalas (cm)",
       color = "Espécies") +
  theme_bw(base_size = 14)

graph <- function(df, grupo, vd1, vd2, xlab, ylab, tlegend) {
  
  library(ggplot2)
  
  res <- ggplot(df, aes(x = {{vd1}}, y = {{vd2}}, color = {{grupo}})) +
  geom_point(size = 3, shape = 15, alpha = 0.7) +
  labs(x = xlab, 
       y = ylab,
       color = tlegend) +
  theme_bw(base_size = 14)
  
  return(res)
}

graph(iris, Species, Sepal.Width, Petal.Length, "Comprimento de Sáplas (cm)",
      "Comprimento de Pétalas (cm)", "Espécies")

### 6. Salvar as funções em um documento separado 

##### Isso facilita e organiza o projeto, dessa forma, basta rodar as 
##### funções do documento separado para fazer as análises.

source("/Users/jeann/Documents/pRaticando-Softawer-R")




  