
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
