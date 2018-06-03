# Required Libraries
library(readxl)

# Brazil - Raw Data
brazil_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "BR 91-00-10")

# State - Raw Data
state_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "UF 91-00-10")
state.2000.ESPVIDA <- state_raw$ESPVIDA
# boxplot(state_raw$ESPVIDA)

boxplot(state.2000.ESPVIDA)
# County - Raw Data
# county_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "MUN 91-00-10")

# Porto Alegre - Raw Data
# porto_alegra <- read_excel()