# Required Libraries
library(readxl)
library(rgdal)

# Brazil - Raw Data
# brazil_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "BR 91-00-10")

# Useful Constants
c_regions <- c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")

# Variables
census_vars <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "Siglas")

# ESPVIDA - Esperança de vida ao nascer
# Número médio de anos que as pessoas deverão viver a partir do nascimento, se permanecerem constantes ao longo da vida o nível e o padrão de mortalidade por idade prevalecentes no ano do Censo.

# MORT1 - Mortalidade até um ano de idade
# Número de crianças que não deverão sobreviver ao primeiro ano de vida em cada 1000 crianças nascidas vivas.

# T_ENV - Taxa de envelhecimento
# Razão entre a população de 65 anos ou mais de idade e a população total multiplicado por 100.

# E_ANOSESTUDO - Expectativa de anos de estudo
# Número médio de anos de estudo que uma geração de crianças que ingressa na escola deverá completar ao atingir 18 anos de idade, se os padrões atuais se mantiverem ao longo de sua vida escolar.

#  T_ANALF18M - Taxa de analfabetismo da população de 18 anos ou mais de idade
# Razão entre a população de 18 anos ou mais de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# T_ANALF25A29 - Taxa de analfabetismo da população de 25 a 29 anos de idade
# Razão entre a população de 25 a 29 anos de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# T_ANALF25M - Taxa de analfabetismo da população de 25 anos ou mais de idade
# Razão entre a população de 25 anos ou mais de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# T_FUND25M - Percentual da população de 25 anos ou mais com fundamental completo
# Razão entre a população de 25 anos ou mais de idade que concluiu o ensino fundamental, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# T_MED18a20 - Percentual da população de 18 a 20 anos de idade com o ensino médio completo
# Razão entre a população de 18 a 20 anos de idade que já concluiu o ensino médio em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. As pessoas de 18 a 20 anos frequentando a 4ª série do ensino médio foram consideradas como já tendo concluído esse nível de ensino.

# T_MED18A24 - Percentual da população de 18 a 24 anos com ensino médio completo
# Razão entre a população de 18 a 24 anos de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# T_MED18M - Percentual da população de 18 anos ou mais com ensino médio completo
# Razão entre a população de 18 anos ou mais de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# T_MED19A21 - Percentual da população de 19 a 21 anos de idade com o ensino médio completo
# Razão entre a população de 19 a 21 anos de idade que já concluiu o ensino médio em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. As pessoas de 19 a 21 anos frequentando a 4ª série do ensino médio foram consideradas como já tendo concluído esse nível de ensino.

# T_MED25M - Percentual da população de 25 anos ou mais com ensino médio incompleto
# Razão entre a população de 25 anos ou mais de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# T_SUPER25M - Percentual da população de 25 anos ou mais com superior completo
# Razão entre a população de 25 anos ou mais de idade que concluiu pelo menos a graduação do ensino superior e o total de pessoas nesta faixa etária multiplicado por 100.

# GINI - Índice de Gini
# Mede o grau de desigualdade existente na distribuição de indivíduos segundo a renda domiciliar per capita. Seu valor varia de 0, quando não há desigualdade (a renda domiciliar per capita de todos os indivíduos tem o mesmo valor), a 1, quando a desigualdade é máxima (apenas um indivíduo detém toda a renda).O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# RDPC - Renda per capita média
# Razão entre o somatório da renda de todos os indivíduos residentes em domicílios particulares permanentes e o número total desses indivíduos. Valores em reais de 01/agosto de 2010.

# IDHM -Índice de Desenvolvimento Humano Municipal
# Média geométrica dos índices das dimensões Renda, Educação e Longevidade, com pesos iguais.

# IDHM_E- Índice de Desenvolvimento Humano Municipal - Dimensão Educação
# Índice sintético da dimensão Educação que é um dos 3 componentes do IDHM. É obtido através da média geométrica do subíndice de frequência de crianças e jovens à escola, com peso de 2/3, e do subíndice de escolaridade da população adulta, com peso de 1/3.

# IDHM_L - Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade
# Índice da dimensão Longevidade que é um dos 3 componentes do IDHM. É obtido a partir do indicador Esperança de vida ao nascer, através da fórmula: [(valor observado do indicador) - (valor mínimo)] / [(valor máximo) - (valor mínimo)], onde os valores mínimo e máximo são 25 e 85 anos, respectivamente.

# IDHM_R - IDHM Renda
# Índice de Desenvolvimento Humano Municipal - Dimensão Renda

# State - Raw Data
state_raw <- read_excel("./data/atlas2013_dadosbrutos_pt.xlsx", sheet = "UF 91-00-10")
state.2000 <- state_raw[state_raw$ANO == "2000", ]

state.2000.NORTE <- state.2000[state.2000$UF < 20, ]
state.2000.NORDESTE <- state.2000[state.2000$UF >= 20 & state.2000$UF < 30, ]
state.2000.SUDESTE <- state.2000[state.2000$UF >= 30 & state.2000$UF < 40, ]
state.2000.SUL <- state.2000[state.2000$UF >= 40 & state.2000$UF < 50, ]
state.2000.CENTRO_OESTE <- state.2000[state.2000$UF >= 50, ]

###########################################################
# Expectativa de Vida
state.2000.NORTE.ESPVIDA <- state.2000.NORTE$ESPVIDA
state.2000.NORDESTE.ESPVIDA <- state.2000.NORDESTE$ESPVIDA
state.2000.SUDESTE.ESPVIDA <- state.2000.SUDESTE$ESPVIDA
state.2000.SUL.ESPVIDA <- state.2000.SUL$ESPVIDA
state.2000.CENTRO_OESTE.ESPVIDA <- state.2000.CENTRO_OESTE$ESPVIDA

boxplot(state.2000.NORTE.ESPVIDA, state.2000.NORDESTE.ESPVIDA, state.2000.SUDESTE.ESPVIDA, state.2000.SUL.ESPVIDA, state.2000.CENTRO_OESTE.ESPVIDA,
        names = c_regions,
        main = "Expectativa de Vida por Região")

###########################################################
# Renda per Capita Média
state.2000.NORTE.RDPC <- state.2000.NORTE$RDPC
state.2000.NORDESTE.RDPC <- state.2000.NORDESTE$RDPC
state.2000.SUDESTE.RDPC <- state.2000.SUDESTE$RDPC
state.2000.SUL.RDPC <- state.2000.SUL$RDPC
state.2000.CENTRO_OESTE.RDPC <- state.2000.CENTRO_OESTE$RDPC

# boxplot(state.2000.NORTE.RDPC, state.2000.NORDESTE.RDPC, state.2000.SUDESTE.RDPC, state.2000.SUL.RDPC, state.2000.CENTRO_OESTE.RDPC,
# names = c_regions,
# main = "Renda per capita Média por Região")

###########################################################
# E_ANOSESTUDO - Expectativa de anos de estudo
state.2000.NORTE.E_ANOSESTUDO <- state.2000.NORTE$E_ANOSESTUDO
state.2000.NORDESTE.E_ANOSESTUDO <- state.2000.NORDESTE$E_ANOSESTUDO
state.2000.SUDESTE.E_ANOSESTUDO <- state.2000.SUDESTE$E_ANOSESTUDO
state.2000.SUL.E_ANOSESTUDO <- state.2000.SUL$E_ANOSESTUDO
state.2000.CENTRO_OESTE.E_ANOSESTUDO <- state.2000.CENTRO_OESTE$E_ANOSESTUDO

boxplot(state.2000.NORTE.E_ANOSESTUDO, state.2000.NORDESTE.E_ANOSESTUDO, state.2000.SUDESTE.E_ANOSESTUDO, state.2000.SUL.E_ANOSESTUDO, state.2000.CENTRO_OESTE.E_ANOSESTUDO,
  names = c_regions,
  main = "Expectativa de Anos de Estudo ao Atingir 18 Anos por Região ")

###########################################################
# IDHM -Índice de Desenvolvimento Humano Municipal
# IDHM_E - Índice de Desenvolvimento Humano Municipal - Dimensão Educação
# IDHM_L - Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade
# IDHM_R - IDHM Renda
state.2000.NORTE.IDHM <- state.2000.NORTE$IDHM
state.2000.NORTE.IDHM_E <- state.2000.NORTE$IDHM_E
state.2000.NORTE.IDHM_L <- state.2000.NORTE$IDHM_L
state.2000.NORTE.IDHM_R <- state.2000.NORTE$IDHM_R

state.2000.NORDESTE.IDHM <- state.2000.NORDESTE$IDHM
state.2000.NORDESTE.IDHM_E <- state.2000.NORDESTE$IDHM_E
state.2000.NORDESTE.IDHM_L <- state.2000.NORDESTE$IDHM_L
state.2000.NORDESTE.IDHM_R <- state.2000.NORDESTE$IDHM_R

state.2000.SUDESTE.IDHM <- state.2000.SUDESTE$IDHM
state.2000.SUDESTE.IDHM_E <- state.2000.SUDESTE$IDHM_E
state.2000.SUDESTE.IDHM_L <- state.2000.SUDESTE$IDHM_L
state.2000.SUDESTE.IDHM_R <- state.2000.SUDESTE$IDHM_R

state.2000.SUL.IDHM <- state.2000.SUL$IDHM
state.2000.SUL.IDHM_E <- state.2000.SUL$IDHM_E
state.2000.SUL.IDHM_L <- state.2000.SUL$IDHM_L
state.2000.SUL.IDHM_R <- state.2000.SUL$IDHM_R

state.2000.CENTRO_OESTE.IDHM <- state.2000.CENTRO_OESTE$IDHM
state.2000.CENTRO_OESTE.IDHM_E <- state.2000.CENTRO_OESTE$IDHM_E
state.2000.CENTRO_OESTE.IDHM_L <- state.2000.CENTRO_OESTE$IDHM_L
state.2000.CENTRO_OESTE.IDHM_R <- state.2000.CENTRO_OESTE$IDHM_R

boxplot(state.2000.NORTE.IDHM, state.2000.NORDESTE.IDHM, state.2000.SUDESTE.IDHM, state.2000.SUL.IDHM, state.2000.CENTRO_OESTE.IDHM,
  names = c_regions,
  main = "Índice de Desenvolvimento Humano Municipal por Região ")

##############################################################################################
############## HEAT MAPs for each indicator, by Region

# Geographical Data

# Brazil
brazil <- readOGR("data/brasil/UFEBRASIL.shp")
# brazil$NM_ESTADO <- state.2000$UFN #Shapefile encoding

brazil$ESPVIDA <- state.2000$ESPVIDA

norte <- subset(brazil, NM_ESTADO == "RONDÃ”NIA" | NM_ESTADO == "ACRE" 
                | NM_ESTADO == "AMAZONAS" | NM_ESTADO == "RORAIMA"
                | NM_ESTADO == "PARÃ\u0081" | NM_ESTADO == "AMAPÃ\u0081"
                | NM_ESTADO == "TOCANTINS")

nordeste <- subset(brazil, NM_ESTADO == "MARANHÃƒO" | NM_ESTADO == "PIAUÃ\u008d" 
                   | NM_ESTADO == "CEARÃ\u0081" | NM_ESTADO == "RIO GRANDE DO NORTE"
                   | NM_ESTADO == "PARAÃ\u008dBA" | NM_ESTADO == "PERNAMBUCO"
                   | NM_ESTADO == "ALAGOAS" | NM_ESTADO == "SERGIPE" | NM_ESTADO == "BAHIA")

sudeste <- subset(brazil, NM_ESTADO == "MINAS GERAIS" | NM_ESTADO == "ESPIRITO SANTO"
                  | NM_ESTADO == "RIO DE JANEIRO" | NM_ESTADO == "SÃƒO PAULO")

sul <- subset(brazil, NM_ESTADO == "PARANÃ\u0081" | NM_ESTADO == "SANTA CATARINA" | NM_ESTADO == "RIO GRANDE DO SUL")

centro_oeste <- subset(brazil, NM_ESTADO == "MATO GROSSO DO SUL" | NM_ESTADO == "MATO GROSSO" 
                       | NM_ESTADO == "GOIÃ\u0081S" | NM_ESTADO == "DISTRITO FEDERAL" )

colors <- colorRampPalette(c("white", "green4"))

################### EXPECTATIVA DE VIDA POR ESTADO

spplot(brazil[,5], col.regions=colors(max(state.2000$ESPVIDA)), main="Expectativa de Vida por Estado", alpha= 0.5)
