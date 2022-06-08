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
# esto quiere decir que no se debe colocar los paréntesis, ejemplo:

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

## tapply ----

# Usando tapply
tapply(
  X = flores$Largo.Sepalo,
  INDEX = flores$Especies,
  FUN = mean
)

# Equivalente usando dplyr
flores %>% 
  group_by(Especies) %>% 
  summarise(Premio_Largo_sepalo = mean(Largo.Sepalo))

## lapply ----
# Aplicamos una función para cada elemento de una lista

Lista = list("Elemento 1" = 1:10,
             "Elemento 2" = 11:20,
             "Elemento 3" = 21:30)

lapply(X = Lista, FUN = median)

## sapply ----
Lista = list("Elemento 1" = 1:10,
             "Elemento 2" = 11:20,
             "Elemento 3" = 21:30)

sapply(X = Lista[c(1,3)], FUN = median)

# Paquete purrr ----

Lista = list("Elemento 1" = 1:10,
             "Elemento 2" = 11:20,
             "Elemento 3" = 21:30)

map_dbl(Lista, median)
map_dfc(Lista, median)

# Actividad de ejemplo ----

asignaturas <- readxl::read_excel('Clase 07//Alumnos por asignatura.xlsx')

asignaturas %>% 
  select(`2015-1-APR`,`2015-2-APR`)

names(asignaturas) %>% str_subset('2015-1')

asignaturas %>% 
  select(str_subset(names(.),'2015-1')) %>% 
  mutate(TOTAL = apply(., MARGIN = 1, FUN = function(x){sum(x,na.rm = TRUE)}))
