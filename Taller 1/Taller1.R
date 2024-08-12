
## Andrés Silva
## Juan Andrés Roldan
## Camilo Carrascal

rm(list=ls())

require(pacman)
p_load(tidyverse, rio, 
       arrow, ## read parque files
       broom, # tidy-coefficients
       mfx, # marginal effects
       margins,  # marginal effects
       estimatr, # robust standard errors
       lmtest, # HAC (Newey-West) standard errors
       fixest, # hdfe regressions (feols)
       modelsummary, # Coefplot with modelplot
       stargazer, # export tables to latex 
       xtable #exportar a latex
) 

setwd(dir = "C:/Users/silva/OneDrive/Escritorio/2024-II/Economia Urbana/EconomiaUrbana1") # fijamos el directorio

df <- import("Taller 1/dataTaller1.rds") # llamamos a la base de datos

# ?lm

df <- mutate(.data = df, lconsumo = log(df$consumo))
df <- mutate(.data = df, lingreso = log(df$ingreso))

regresion1 <- lm(formula = df$lconsumo ~ df$voucher)
#regresion1 %>% summary()

regresion2 <- lm(formula = df$lconsumo ~ df$voucher + df$lingreso)
#regresion2 %>% summary()


stargazer(regresion1, regresion2,
          type= "latex",
          dep.var.labels = c('',"lconsumo",''), 
          df = FALSE,
          digits = 4, 
          out = paste0("Output/ols.tex"),
          title = "Tabla 1. Modelos de regresión sin la variable ingreso (1), y con la variable ingreso (2)",
          style = "default"
          )


#?stargazer