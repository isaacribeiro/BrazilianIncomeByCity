# Required Libraries
library(readxl)
library(ggplot2)

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
raw_data <- read_excel("./data/atlas2013_dadosbrutos_pt.xlsx", sheet = "MUN 91-00-10")

# 1991's Census
counties.1991 <- raw_data[raw_data$ANO == "1991", ]

counties.1991.NORTE <- counties.1991[counties.1991$UF < 20, ]
counties.1991.NORDESTE <- counties.1991[counties.1991$UF >= 20 & counties.1991$UF < 30, ]
counties.1991.SUDESTE <- counties.1991[counties.1991$UF >= 30 & counties.1991$UF < 40, ]
counties.1991.SUL <- counties.1991[counties.1991$UF >= 40 & counties.1991$UF < 50, ]
counties.1991.CENTRO_OESTE <- counties.1991[counties.1991$UF >= 50, ]

# 2000's Census
counties.2000 <- raw_data[raw_data$ANO == "2000", ]

counties.2000.NORTE <- counties.2000[counties.2000$UF < 20, ]
counties.2000.NORDESTE <- counties.2000[counties.2000$UF >= 20 & counties.2000$UF < 30, ]
counties.2000.SUDESTE <- counties.2000[counties.2000$UF >= 30 & counties.2000$UF < 40, ]
counties.2000.SUL <- counties.2000[counties.2000$UF >= 40 & counties.2000$UF < 50, ]
counties.2000.CENTRO_OESTE <- counties.2000[counties.2000$UF >= 50, ]

# 2010's Census

counties.2010 <- raw_data[raw_data$ANO == "2010", ]

counties.2010.NORTE <- counties.2010[counties.2010$UF < 20, ]
counties.2010.NORDESTE <- counties.2010[counties.2010$UF >= 20 & counties.2010$UF < 30, ]
counties.2010.SUDESTE <- counties.2010[counties.2010$UF >= 30 & counties.2010$UF < 40, ]
counties.2010.SUL <- counties.2010[counties.2010$UF >= 40 & counties.2010$UF < 50, ]
counties.2010.CENTRO_OESTE <- counties.2010[counties.2000$UF >= 50, ]

GROUP_BY_REGION <- c(rep.int("Norte", 1347),
                     rep.int("Nordeste", 5382),
                     rep.int("Sudeste", 5004),
                     rep.int("Sul", 3564),
                     rep.int("Centro-Oeste", 1398))

GROUP_BY_YEAR <- c(rep.int("1991", 449),
                   rep.int("2000", 449),
                   rep.int("2010", 449),
                   rep.int("1991", 1794),
                   rep.int("2000", 1794),
                   rep.int("2010", 1794),
                   rep.int("1991", 1668),
                   rep.int("2000", 1668),
                   rep.int("2010", 1668),
                   rep.int("1991", 1188),
                   rep.int("2000", 1188),
                   rep.int("2010", 1188),
                   rep.int("1991", 466),
                   rep.int("2000", 466),
                   rep.int("2010", 466))

###########################################################
############### ESPVIDA - Expectativa de Vida
##########################################################

counties.1991.NORTE.ESPVIDA <- counties.1991.NORTE$ESPVIDA
counties.1991.NORDESTE.ESPVIDA <- counties.1991.NORDESTE$ESPVIDA
counties.1991.SUDESTE.ESPVIDA <- counties.1991.SUDESTE$ESPVIDA
counties.1991.SUL.ESPVIDA <- counties.1991.SUL$ESPVIDA
counties.1991.CENTRO_OESTE.ESPVIDA <- counties.1991.CENTRO_OESTE$ESPVIDA

counties.2000.NORTE.ESPVIDA <- counties.2000.NORTE$ESPVIDA
counties.2000.NORDESTE.ESPVIDA <- counties.2000.NORDESTE$ESPVIDA
counties.2000.SUDESTE.ESPVIDA <- counties.2000.SUDESTE$ESPVIDA
counties.2000.SUL.ESPVIDA <- counties.2000.SUL$ESPVIDA
counties.2000.CENTRO_OESTE.ESPVIDA <- counties.2000.CENTRO_OESTE$ESPVIDA

counties.2010.NORTE.ESPVIDA <- counties.2010.NORTE$ESPVIDA
counties.2010.NORDESTE.ESPVIDA <- counties.2010.NORDESTE$ESPVIDA
counties.2010.SUDESTE.ESPVIDA <- counties.2010.SUDESTE$ESPVIDA
counties.2010.SUL.ESPVIDA <- counties.2010.SUL$ESPVIDA
counties.2010.CENTRO_OESTE.ESPVIDA <- counties.2010.CENTRO_OESTE$ESPVIDA

ESPVIDA_BY_REGION <- c(counties.1991.NORTE.ESPVIDA, counties.2000.NORTE.ESPVIDA, counties.2010.NORTE.ESPVIDA,
                       counties.1991.NORDESTE.ESPVIDA, counties.2000.NORDESTE.ESPVIDA, counties.2010.NORDESTE.ESPVIDA,
                       counties.1991.SUDESTE.ESPVIDA, counties.2000.SUDESTE.ESPVIDA, counties.2010.SUDESTE.ESPVIDA,
                       counties.1991.SUL.ESPVIDA, counties.2000.SUL.ESPVIDA, counties.2010.SUL.ESPVIDA,
                       counties.1991.CENTRO_OESTE.ESPVIDA, counties.2000.CENTRO_OESTE.ESPVIDA, counties.2010.CENTRO_OESTE.ESPVIDA)

ESPVIDA_BY_REGION.df <- data.frame(GROUP_BY_REGION, GROUP_BY_YEAR, ESPVIDA_BY_REGION)

# Grouped Boxplot
p <- ggplot(ESPVIDA_BY_REGION.df, aes(x = GROUP_BY_REGION, y=ESPVIDA_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Expectativa de Vida por Região") + xlab(NULL) + ylab("Anos") + labs(fill="Ano") + theme(plot.title = element_text(hjust = 0.5))

 ###########################################################
# Renda per Capita Média

counties.1991.NORTE.RDPC <- counties.1991.NORTE$RDPC
counties.1991.NORDESTE.RDPC <- counties.1991.NORDESTE$RDPC
counties.1991.SUDESTE.RDPC <- counties.1991.SUDESTE$RDPC
counties.1991.SUL.RDPC <- counties.1991.SUL$RDPC
counties.1991.CENTRO_OESTE.RDPC <- counties.1991.CENTRO_OESTE$RDPC

counties.2000.NORTE.RDPC <- counties.2000.NORTE$RDPC
counties.2000.NORDESTE.RDPC <- counties.2000.NORDESTE$RDPC
counties.2000.SUDESTE.RDPC <- counties.2000.SUDESTE$RDPC
counties.2000.SUL.RDPC <- counties.2000.SUL$RDPC
counties.2000.CENTRO_OESTE.RDPC <- counties.2000.CENTRO_OESTE$RDPC

counties.2010.NORTE.RDPC <- counties.2010.NORTE$RDPC
counties.2010.NORDESTE.RDPC <- counties.2010.NORDESTE$RDPC
counties.2010.SUDESTE.RDPC <- counties.2010.SUDESTE$RDPC
counties.2010.SUL.RDPC <- counties.2010.SUL$RDPC
counties.2010.CENTRO_OESTE.RDPC <- counties.2010.CENTRO_OESTE$RDPC

RDPC_BY_REGION <- c(counties.1991.NORTE.RDPC, counties.2000.NORTE.RDPC, counties.2010.NORTE.RDPC,
                    counties.1991.NORDESTE.RDPC, counties.2000.NORDESTE.RDPC, counties.2010.NORDESTE.RDPC,
                    counties.1991.SUDESTE.RDPC, counties.2000.SUDESTE.RDPC, counties.2010.SUDESTE.RDPC,
                    counties.1991.SUL.RDPC, counties.2000.SUL.RDPC, counties.2010.SUL.RDPC,
                    counties.1991.CENTRO_OESTE.RDPC, counties.2000.CENTRO_OESTE.RDPC, counties.2010.CENTRO_OESTE.RDPC)

RDPC_BY_REGION.df <- data.frame(GROUP_BY_REGION, GROUP_BY_YEAR, RDPC_BY_REGION)

# Grouped Boxplot
p <- ggplot(RDPC_BY_REGION.df, aes(x = GROUP_BY_REGION, y=RDPC_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Renda per capta Média por Região") + xlab(NULL) + ylab("Reais") + labs(fill="Ano") + theme(plot.title = element_text(hjust = 0.5))


boxplot(counties.2000.NORTE.RDPC, counties.2000.NORDESTE.RDPC, counties.2000.SUDESTE.RDPC, counties.2000.SUL.RDPC, counties.2000.CENTRO_OESTE.RDPC,
names = c_regions,
main = "Renda per capita Média por Região")

###########################################################
# E_ANOSESTUDO - Expectativa de anos de estudo
counties.2000.NORTE.E_ANOSESTUDO <- counties.2000.NORTE$E_ANOSESTUDO
counties.2000.NORDESTE.E_ANOSESTUDO <- counties.2000.NORDESTE$E_ANOSESTUDO
counties.2000.SUDESTE.E_ANOSESTUDO <- counties.2000.SUDESTE$E_ANOSESTUDO
counties.2000.SUL.E_ANOSESTUDO <- counties.2000.SUL$E_ANOSESTUDO
counties.2000.CENTRO_OESTE.E_ANOSESTUDO <- counties.2000.CENTRO_OESTE$E_ANOSESTUDO

boxplot(counties.2000.NORTE.E_ANOSESTUDO, counties.2000.NORDESTE.E_ANOSESTUDO, counties.2000.SUDESTE.E_ANOSESTUDO, counties.2000.SUL.E_ANOSESTUDO, counties.2000.CENTRO_OESTE.E_ANOSESTUDO,
        names = c_regions,
        main = "Expectativa de Anos de Estudo ao Atingir 18 Anos por Região ")

###########################################################
# IDHM -Índice de Desenvolvimento Humano Municipal
# IDHM_E - Índice de Desenvolvimento Humano Municipal - Dimensão Educação
# IDHM_L - Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade
# IDHM_R - IDHM Renda
counties.2000.NORTE.IDHM <- counties.2000.NORTE$IDHM
counties.2000.NORTE.IDHM_E <- counties.2000.NORTE$IDHM_E
counties.2000.NORTE.IDHM_L <- counties.2000.NORTE$IDHM_L
counties.2000.NORTE.IDHM_R <- counties.2000.NORTE$IDHM_R

counties.2000.NORDESTE.IDHM <- counties.2000.NORDESTE$IDHM
counties.2000.NORDESTE.IDHM_E <- counties.2000.NORDESTE$IDHM_E
counties.2000.NORDESTE.IDHM_L <- counties.2000.NORDESTE$IDHM_L
counties.2000.NORDESTE.IDHM_R <- counties.2000.NORDESTE$IDHM_R

counties.2000.SUDESTE.IDHM <- counties.2000.SUDESTE$IDHM
counties.2000.SUDESTE.IDHM_E <- counties.2000.SUDESTE$IDHM_E
counties.2000.SUDESTE.IDHM_L <- counties.2000.SUDESTE$IDHM_L
counties.2000.SUDESTE.IDHM_R <- counties.2000.SUDESTE$IDHM_R

counties.2000.SUL.IDHM <- counties.2000.SUL$IDHM
counties.2000.SUL.IDHM_E <- counties.2000.SUL$IDHM_E
counties.2000.SUL.IDHM_L <- counties.2000.SUL$IDHM_L
counties.2000.SUL.IDHM_R <- counties.2000.SUL$IDHM_R

counties.2000.CENTRO_OESTE.IDHM <- counties.2000.CENTRO_OESTE$IDHM
counties.2000.CENTRO_OESTE.IDHM_E <- counties.2000.CENTRO_OESTE$IDHM_E
counties.2000.CENTRO_OESTE.IDHM_L <- counties.2000.CENTRO_OESTE$IDHM_L
counties.2000.CENTRO_OESTE.IDHM_R <- counties.2000.CENTRO_OESTE$IDHM_R

boxplot(counties.2000.NORTE.IDHM, counties.2000.NORDESTE.IDHM, counties.2000.SUDESTE.IDHM, counties.2000.SUL.IDHM, counties.2000.CENTRO_OESTE.IDHM,
        names = c_regions,
        main = "Índice de Desenvolvimento Humano Municipal por Região ")
