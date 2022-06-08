# Clase 7 -----
# install.packages('datos')
# install.packages('data.table')

library(tidyverse)
library(datos)
library(data.table)


# Familia de funciones apply -----
## Apply() ----

# Aplica una función sobre las filas o columnas de un data.frame

flores %>% tibble()

# La función apply recibe una función la cual no debe estar ejecutada
# esto quiere decir que no se debe colocar los parentesis, ejemplo:

# Forma incorrecta
apply(flores[,1:4], MARGIN = 2, FUN = sum())
# Forma correcta
apply(flores[,1:4], MARGIN = 2, FUN = sum)


# Que pasaría si quiero activar el argumento na.rm = TRUE

# Forma 1
apply(flores[,1:4], MARGIN = 2, FUN = function(x){sum(x,na.rm = TRUE)})

# Forma 2
my_suma <- function(x){
  # valor_suma = sum(x,na.rm = TRUE)
  # return(valor_suma)
  
  sum(x,na.rm = TRUE) %>% return()
}

apply(flores[,1:4], MARGIN = 2, FUN = my_suma)

