# Required Libraries
library(readxl)

# Brazil - Raw Data
brazil_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "BR 91-00-10")

# State - Raw Data
state_raw <- read_excel("./data/atlas2013_dadosbrutos_pt.xlsx", sheet = "UF 91-00-10")
state.2000 <- state_raw[state_raw$ANO == "2000", ]

state.2000.NORTE <- state.2000[state.2000$UF < 20, ]
state.2000.NORDESTE <- state.2000[state.2000$UF >= 20 & state.2000$UF < 30, ]
state.2000.SUDESTE <- state.2000[state.2000$UF >= 30 & state.2000$UF < 40, ]
state.2000.SUL <- state.2000[state.2000$UF >= 40 & state.2000$UF < 50, ]
state.2000.CENTRO_OESTE <- state.2000[state.2000$UF >= 50, ]

state.2000.NORTE.ESPVIDA <- state.2000.NORTE$ESPVIDA
state.2000.NORDESTE.ESPVIDA <- state.2000.NORDESTE$ESPVIDA
state.2000.SUDESTE.ESPVIDA <- state.2000.SUDESTE$ESPVIDA
state.2000.SUL.ESPVIDA <- state.2000.SUL$ESPVIDA
state.2000.CENTRO_OESTE.ESPVIDA <- state.2000.CENTRO_OESTE$ESPVIDA

boxplot(state.2000.NORTE.ESPVIDA, state.2000.NORDESTE.ESPVIDA, state.2000.SUDESTE.ESPVIDA, state.2000.SUL.ESPVIDA, state.2000.CENTRO_OESTE.ESPVIDA,
        names = c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste"),
        main = "Expectativa de Vida por Região")

state.2010 <- state_raw[state_raw$ANO == "2010", ]
state.2010.ESPVIDA <- state.2010$ESPVIDA

# County - Raw Data
# county_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "MUN 91-00-10")

# Porto Alegre - Raw Data
# porto_alegra <- read_excel()