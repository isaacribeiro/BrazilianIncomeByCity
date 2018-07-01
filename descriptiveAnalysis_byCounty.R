# Required Libraries
library(readxl)
library(ggplot2)

# Brazil - Raw Data
# brazil_raw <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "BR 91-00-10")

# Useful Constants
c_regions <- c("Norte", "Nordeste", "Sudeste", "Sul", "Centro-Oeste")

c_years <- C("1991", "2000", "2010")

# Variables
census_vars <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "Siglas")

# (!) ESPVIDA - Esperança de vida ao nascer - DONE
# Número médio de anos que as pessoas deverão viver a partir do nascimento, se permanecerem constantes ao longo da vida o nível e o padrão de mortalidade por idade prevalecentes no ano do Censo.

# (!) E_ANOSESTUDO - Expectativa de anos de estudo - DONE
# Número médio de anos de estudo que uma geração de crianças que ingressa na escola deverá completar ao atingir 18 anos de idade, se os padrões atuais se mantiverem ao longo de sua vida escolar.

# (!) T_ANALF18M - Taxa de analfabetismo da população de 18 anos ou mais de idade
# Razão entre a população de 18 anos ou mais de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# (!) T_FUND18M - Percentual da população de 18 anos ou mais com fundamental completo
# Razão entre a população de 18 anos ou mais de idade que concluiu o ensino fundamental, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# (!) T_MED18M - Percentual da população de 18 anos ou mais com ensino médio completo
# Razão entre a população de 18 anos ou mais de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# (!) T_SUPER25M - Percentual da população de 25 anos ou mais com superior completo
# Razão entre a população de 25 anos ou mais de idade que concluiu pelo menos a graduação do ensino superior e o total de pessoas nesta faixa etária multiplicado por 100.

# (!) GINI - Índice de Gini - DONE
# Mede o grau de desigualdade existente na distribuição de indivíduos segundo a renda domiciliar per capita. Seu valor varia de 0, quando não há desigualdade (a renda domiciliar per capita de todos os indivíduos tem o mesmo valor), a 1, quando a desigualdade é máxima (apenas um indivíduo detém toda a renda).O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# (Y) RDPC - Renda per capita média - DONE
# Razão entre o somatório da renda de todos os indivíduos residentes em domicílios particulares permanentes e o número total desses indivíduos. Valores em reais de 01/agosto de 2010.

# (!) IDHM -Índice de Desenvolvimento Humano Municipal
# Média geométrica dos índices das dimensões Renda, Educação e Longevidade, com pesos iguais.

# IDHM_E- Índice de Desenvolvimento Humano Municipal - Dimensão Educação
# Índice sintético da dimensão Educação que é um dos 3 componentes do IDHM. É obtido através da média geométrica do subíndice de frequência de crianças e jovens à escola, com peso de 2/3, e do subíndice de escolaridade da população adulta, com peso de 1/3.

# IDHM_L - Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade
# Índice da dimensão Longevidade que é um dos 3 componentes do IDHM. É obtido a partir do indicador Esperança de vida ao nascer, através da fórmula: [(valor observado do indicador) - (valor mínimo)] / [(valor máximo) - (valor mínimo)], onde os valores mínimo e máximo são 25 e 85 anos, respectivamente.

# IDHM_R - IDHM Renda
# Índice de Desenvolvimento Humano Municipal - Dimensão Renda

# (!) HOMEMTOT - População residente masculina
# População total do sexo masculino

# (!) MULHERTOT - População residente feminina
# População total do sexo feminino

# (!) PESOTOT - População total
# População residente total

# (!) PEA18M - PEA (18 anos ou mais)
# População economicamente ativa. Corresponde ao número de pessoas nessa faixa etária que, na semana de referência do Censo, encontravam-se ocupadas no mercado de trabalho ou que, encontrando-se desocupadas, tinham procurado trabalho no mês anterior à data da pesquisa.

# (!) RENOCUP - Rendimento médio dos ocupados - 18 anos ou mais - DATA UNAVAILABLE
# Média dos rendimentos de todos os trabalhos das pessoas ocupadas de 18 anos ou mais de idade. Valores em reais de agosto de 2010.

# (!) T_ATIV18M - Taxa de atividade das pessoas de 18 anos ou mais de idade
# Razão entre as pessoas de 18 anos ou mais de idade que eram economicamente ativas, ou seja, que estavam ocupadas ou desocupadas na semana de referência do Censo e o total de pessoas nesta faixa etária multiplicado por 100. Considera-se desocupada a pessoa que, não estando ocupada na semana de referência, havia procurado trabalho no mês anterior a essa pesquisa.

# (!) T_DES18M - Taxa de desocupação da população de 18 anos ou mais de idade
# Percentual da população economicamente ativa (PEA) nessa faixa etária que estava desocupada, ou seja, que não estava ocupada na semana anterior à data do Censo mas havia procurado trabalho ao longo do mês anterior à data dessa pesquisa.

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
# ESPVIDA - Expectativa de Vida

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

# Mean, Median and Standard Deviation
counties.1991.NORTE.ESPVIDA.MEAN <- mean(counties.1991.NORTE.ESPVIDA)
counties.1991.NORTE.ESPVIDA.MEDIAN <- median(counties.1991.NORTE.ESPVIDA)
counties.1991.NORTE.ESPVIDA.SD <- sd(counties.1991.NORTE.ESPVIDA)

counties.1991.NORDESTE.ESPVIDA.MEAN <- mean(counties.1991.NORDESTE.ESPVIDA)
counties.1991.NORDESTE.ESPVIDA.MEDIAN <- median(counties.1991.NORDESTE.ESPVIDA)
counties.1991.NORDESTE.ESPVIDA.SD <- sd(counties.1991.NORDESTE.ESPVIDA)

counties.1991.SUDESTE.ESPVIDA.MEAN <- mean(counties.1991.SUDESTE.ESPVIDA)
counties.1991.SUDESTE.ESPVIDA.MEDIAN <- median(counties.1991.SUDESTE.ESPVIDA)
counties.1991.SUDESTE.ESPVIDA.SD <- sd(counties.1991.SUDESTE.ESPVIDA)

counties.1991.SUL.ESPVIDA.MEAN <- mean(counties.1991.SUL.ESPVIDA)
counties.1991.SUL.ESPVIDA.MEDIAN <- median(counties.1991.SUL.ESPVIDA)
counties.1991.SUL.ESPVIDA.SD <- sd(counties.1991.SUL.ESPVIDA)

counties.1991.CENTRO_OESTE.ESPVIDA.MEAN <- mean(counties.1991.CENTRO_OESTE.ESPVIDA)
counties.1991.CENTRO_OESTE.ESPVIDA.MEDIAN <- median(counties.1991.CENTRO_OESTE.ESPVIDA)
counties.1991.CENTRO_OESTE.ESPVIDA.SD <- sd(counties.1991.CENTRO_OESTE.ESPVIDA)

counties.2000.NORTE.ESPVIDA.MEAN <- mean(counties.2000.NORTE.ESPVIDA)
counties.2000.NORTE.ESPVIDA.MEDIAN <- median(counties.2000.NORTE.ESPVIDA)
counties.2000.NORTE.ESPVIDA.SD <- sd(counties.2000.NORTE.ESPVIDA)

counties.2000.NORDESTE.ESPVIDA.MEAN <- mean(counties.2000.NORDESTE.ESPVIDA)
counties.2000.NORDESTE.ESPVIDA.MEDIAN <- median(counties.2000.NORDESTE.ESPVIDA)
counties.2000.NORDESTE.ESPVIDA.SD <- sd(counties.2000.NORDESTE.ESPVIDA)

counties.2000.SUDESTE.ESPVIDA.MEAN <- mean(counties.2000.SUDESTE.ESPVIDA)
counties.2000.SUDESTE.ESPVIDA.MEDIAN <- median(counties.2000.SUDESTE.ESPVIDA)
counties.2000.SUDESTE.ESPVIDA.SD <- sd(counties.2000.SUDESTE.ESPVIDA)

counties.2000.SUL.ESPVIDA.MEAN <- mean(counties.2000.SUL.ESPVIDA)
counties.2000.SUL.ESPVIDA.MEDIAN <- median(counties.2000.SUL.ESPVIDA)
counties.2000.SUL.ESPVIDA.SD <- sd(counties.2000.SUL.ESPVIDA)

counties.2000.CENTRO_OESTE.ESPVIDA.MEAN <- mean(counties.2000.CENTRO_OESTE.ESPVIDA)
counties.2000.CENTRO_OESTE.ESPVIDA.MEDIAN <- median(counties.2000.CENTRO_OESTE.ESPVIDA)
counties.2000.CENTRO_OESTE.ESPVIDA.SD <- sd(counties.2000.CENTRO_OESTE.ESPVIDA)

counties.2010.NORTE.ESPVIDA.MEAN <- mean(counties.2010.NORTE.ESPVIDA)
counties.2010.NORTE.ESPVIDA.MEDIAN <- median(counties.2010.NORTE.ESPVIDA)
counties.2010.NORTE.ESPVIDA.SD <- sd(counties.2010.NORTE.ESPVIDA)

counties.2010.NORDESTE.ESPVIDA.MEAN <- mean(counties.2010.NORDESTE.ESPVIDA)
counties.2010.NORDESTE.ESPVIDA.MEDIAN <- median(counties.2010.NORDESTE.ESPVIDA)
counties.2010.NORDESTE.ESPVIDA.SD <- sd(counties.2010.NORDESTE.ESPVIDA)

counties.2010.SUDESTE.ESPVIDA.MEAN <- mean(counties.2010.SUDESTE.ESPVIDA)
counties.2010.SUDESTE.ESPVIDA.MEDIAN <- median(counties.2010.SUDESTE.ESPVIDA)
counties.2010.SUDESTE.ESPVIDA.SD <- sd(counties.2010.SUDESTE.ESPVIDA)

counties.2010.SUL.ESPVIDA.MEAN <- mean(counties.2010.SUL.ESPVIDA)
counties.2010.SUL.ESPVIDA.MEDIAN <- median(counties.2010.SUL.ESPVIDA)
counties.2010.SUL.ESPVIDA.SD <- sd(counties.2010.SUL.ESPVIDA)

counties.2010.CENTRO_OESTE.ESPVIDA.MEAN <- mean(counties.2010.CENTRO_OESTE.ESPVIDA)
counties.2010.CENTRO_OESTE.ESPVIDA.MEDIAN <- median(counties.2010.CENTRO_OESTE.ESPVIDA)
counties.2010.CENTRO_OESTE.ESPVIDA.SD <- sd(counties.2010.CENTRO_OESTE.ESPVIDA)

counties.1991.ESPVIDA.MEAN <- mean(counties.1991$ESPVIDA)
counties.1991.ESPVIDA.MEDIAN <- median(counties.1991$ESPVIDA)
counties.1991.ESPVIDA.SD <- sd(counties.1991$ESPVIDA)

counties.2000.ESPVIDA.MEAN <- mean(counties.2000$ESPVIDA)
counties.2000.ESPVIDA.MEDIAN <- median(counties.2000$ESPVIDA)
counties.2000.ESPVIDA.SD <- sd(counties.2000$ESPVIDA)

counties.2010.ESPVIDA.MEAN <- mean(counties.2010$ESPVIDA)
counties.2010.ESPVIDA.MEDIAN <- median(counties.2010$ESPVIDA)
counties.2010.ESPVIDA.SD <- sd(counties.2010$ESPVIDA)

ESPVIDA.1991.MEAN <- c(counties.1991.NORTE.ESPVIDA.MEAN, 
                       counties.1991.NORDESTE.ESPVIDA.MEAN,
                       counties.1991.SUDESTE.ESPVIDA.MEAN,
                       counties.1991.SUL.ESPVIDA.MEAN,
                       counties.1991.CENTRO_OESTE.ESPVIDA.MEAN)

ESPVIDA.1991.MEDIAN <- c(counties.1991.NORTE.ESPVIDA.MEDIAN, 
                         counties.1991.NORDESTE.ESPVIDA.MEDIAN,
                         counties.1991.SUDESTE.ESPVIDA.MEDIAN,
                         counties.1991.SUL.ESPVIDA.MEDIAN,
                         counties.1991.CENTRO_OESTE.ESPVIDA.MEDIAN)

ESPVIDA.1991.SD <- c(counties.1991.NORTE.ESPVIDA.SD, 
                     counties.1991.NORDESTE.ESPVIDA.SD,
                     counties.1991.SUDESTE.ESPVIDA.SD,
                     counties.1991.SUL.ESPVIDA.SD,
                     counties.1991.CENTRO_OESTE.ESPVIDA.SD)

ESPVIDA.1991 <- data.frame(ESPVIDA.1991.MEAN, ESPVIDA.1991.MEDIAN, ESPVIDA.1991.SD)
rownames(ESPVIDA.1991) <- c_regions

ESPVIDA.2000.MEAN <- c(counties.2000.NORTE.ESPVIDA.MEAN, 
                       counties.2000.NORDESTE.ESPVIDA.MEAN,
                       counties.2000.SUDESTE.ESPVIDA.MEAN,
                       counties.2000.SUL.ESPVIDA.MEAN,
                       counties.2000.CENTRO_OESTE.ESPVIDA.MEAN)

ESPVIDA.2000.MEDIAN <- c(counties.2000.NORTE.ESPVIDA.MEDIAN, 
                         counties.2000.NORDESTE.ESPVIDA.MEDIAN,
                         counties.2000.SUDESTE.ESPVIDA.MEDIAN,
                         counties.2000.SUL.ESPVIDA.MEDIAN,
                         counties.2000.CENTRO_OESTE.ESPVIDA.MEDIAN)

ESPVIDA.2000.SD <- c(counties.2000.NORTE.ESPVIDA.SD, 
                     counties.2000.NORDESTE.ESPVIDA.SD,
                     counties.2000.SUDESTE.ESPVIDA.SD,
                     counties.2000.SUL.ESPVIDA.SD,
                     counties.2000.CENTRO_OESTE.ESPVIDA.SD)

ESPVIDA.2000 <- data.frame(ESPVIDA.2000.MEAN, ESPVIDA.2000.MEDIAN, ESPVIDA.2000.SD)
rownames(ESPVIDA.2000) <- c_regions

ESPVIDA.2010.MEAN <- c(counties.2010.NORTE.ESPVIDA.MEAN, 
                       counties.2010.NORDESTE.ESPVIDA.MEAN,
                       counties.2010.SUDESTE.ESPVIDA.MEAN,
                       counties.2010.SUL.ESPVIDA.MEAN,
                       counties.2010.CENTRO_OESTE.ESPVIDA.MEAN)

ESPVIDA.2010.MEDIAN <- c(counties.2010.NORTE.ESPVIDA.MEDIAN, 
                         counties.2010.NORDESTE.ESPVIDA.MEDIAN,
                         counties.2010.SUDESTE.ESPVIDA.MEDIAN,
                         counties.2010.SUL.ESPVIDA.MEDIAN,
                         counties.2010.CENTRO_OESTE.ESPVIDA.MEDIAN)

ESPVIDA.2010.SD <- c(counties.2010.NORTE.ESPVIDA.SD, 
                     counties.2010.NORDESTE.ESPVIDA.SD,
                     counties.2010.SUDESTE.ESPVIDA.SD,
                     counties.2010.SUL.ESPVIDA.SD,
                     counties.2010.CENTRO_OESTE.ESPVIDA.SD)

c <- data.frame(ESPVIDA.2010.MEAN, ESPVIDA.2010.MEDIAN, ESPVIDA.2010.SD)
rownames(ESPVIDA.2010) <- c_regions

# Boxplot
ESPVIDA_BY_REGION <- c(counties.1991.NORTE.ESPVIDA, counties.2000.NORTE.ESPVIDA, counties.2010.NORTE.ESPVIDA,
                       counties.1991.NORDESTE.ESPVIDA, counties.2000.NORDESTE.ESPVIDA, counties.2010.NORDESTE.ESPVIDA,
                       counties.1991.SUDESTE.ESPVIDA, counties.2000.SUDESTE.ESPVIDA, counties.2010.SUDESTE.ESPVIDA,
                       counties.1991.SUL.ESPVIDA, counties.2000.SUL.ESPVIDA, counties.2010.SUL.ESPVIDA,
                       counties.1991.CENTRO_OESTE.ESPVIDA, counties.2000.CENTRO_OESTE.ESPVIDA, counties.2010.CENTRO_OESTE.ESPVIDA)

ESPVIDA_BY_REGION.df <- data.frame(GROUP_BY_REGION, GROUP_BY_YEAR, ESPVIDA_BY_REGION)

p <- ggplot(ESPVIDA_BY_REGION.df, aes(x = GROUP_BY_REGION, y=ESPVIDA_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Expectativa de Vida por Região") + xlab(NULL) + ylab("Anos") + labs(fill="Ano") + theme(plot.title = element_text(hjust = 0.5))

############################################################
# RDPC - Renda per Capita Média

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

# Mean, Median and Standard Deviation
counties.1991.NORTE.RDPC.MEAN <- mean(counties.1991.NORTE.RDPC)
counties.1991.NORTE.RDPC.MEDIAN <- median(counties.1991.NORTE.RDPC)
counties.1991.NORTE.RDPC.SD <- sd(counties.1991.NORTE.RDPC)

counties.1991.NORDESTE.RDPC.MEAN <- mean(counties.1991.NORDESTE.RDPC)
counties.1991.NORDESTE.RDPC.MEDIAN <- median(counties.1991.NORDESTE.RDPC)
counties.1991.NORDESTE.RDPC.SD <- sd(counties.1991.NORDESTE.RDPC)

counties.1991.SUDESTE.RDPC.MEAN <- mean(counties.1991.SUDESTE.RDPC)
counties.1991.SUDESTE.RDPC.MEDIAN <- median(counties.1991.SUDESTE.RDPC)
counties.1991.SUDESTE.RDPC.SD <- sd(counties.1991.SUDESTE.RDPC)

counties.1991.SUL.RDPC.MEAN <- mean(counties.1991.SUL.RDPC)
counties.1991.SUL.RDPC.MEDIAN <- median(counties.1991.SUL.RDPC)
counties.1991.SUL.RDPC.SD <- sd(counties.1991.SUL.RDPC)

counties.1991.CENTRO_OESTE.RDPC.MEAN <- mean(counties.1991.CENTRO_OESTE.RDPC)
counties.1991.CENTRO_OESTE.RDPC.MEDIAN <- median(counties.1991.CENTRO_OESTE.RDPC)
counties.1991.CENTRO_OESTE.RDPC.SD <- sd(counties.1991.CENTRO_OESTE.RDPC)

counties.2000.NORTE.RDPC.MEAN <- mean(counties.2000.NORTE.RDPC)
counties.2000.NORTE.RDPC.MEDIAN <- median(counties.2000.NORTE.RDPC)
counties.2000.NORTE.RDPC.SD <- sd(counties.2000.NORTE.RDPC)

counties.2000.NORDESTE.RDPC.MEAN <- mean(counties.2000.NORDESTE.RDPC)
counties.2000.NORDESTE.RDPC.MEDIAN <- median(counties.2000.NORDESTE.RDPC)
counties.2000.NORDESTE.RDPC.SD <- sd(counties.2000.NORDESTE.RDPC)

counties.2000.SUDESTE.RDPC.MEAN <- mean(counties.2000.SUDESTE.RDPC)
counties.2000.SUDESTE.RDPC.MEDIAN <- median(counties.2000.SUDESTE.RDPC)
counties.2000.SUDESTE.RDPC.SD <- sd(counties.2000.SUDESTE.RDPC)

counties.2000.SUL.RDPC.MEAN <- mean(counties.2000.SUL.RDPC)
counties.2000.SUL.RDPC.MEDIAN <- median(counties.2000.SUL.RDPC)
counties.2000.SUL.RDPC.SD <- sd(counties.2000.SUL.RDPC)

counties.2000.CENTRO_OESTE.RDPC.MEAN <- mean(counties.2000.CENTRO_OESTE.RDPC)
counties.2000.CENTRO_OESTE.RDPC.MEDIAN <- median(counties.2000.CENTRO_OESTE.RDPC)
counties.2000.CENTRO_OESTE.RDPC.SD <- sd(counties.2000.CENTRO_OESTE.RDPC)

counties.2010.NORTE.RDPC.MEAN <- mean(counties.2010.NORTE.RDPC)
counties.2010.NORTE.RDPC.MEDIAN <- median(counties.2010.NORTE.RDPC)
counties.2010.NORTE.RDPC.SD <- sd(counties.2010.NORTE.RDPC)

counties.2010.NORDESTE.RDPC.MEAN <- mean(counties.2010.NORDESTE.RDPC)
counties.2010.NORDESTE.RDPC.MEDIAN <- median(counties.2010.NORDESTE.RDPC)
counties.2010.NORDESTE.RDPC.SD <- sd(counties.2010.NORDESTE.RDPC)

counties.2010.SUDESTE.RDPC.MEAN <- mean(counties.2010.SUDESTE.RDPC)
counties.2010.SUDESTE.RDPC.MEDIAN <- median(counties.2010.SUDESTE.RDPC)
counties.2010.SUDESTE.RDPC.SD <- sd(counties.2010.SUDESTE.RDPC)

counties.2010.SUL.RDPC.MEAN <- mean(counties.2010.SUL.RDPC)
counties.2010.SUL.RDPC.MEDIAN <- median(counties.2010.SUL.RDPC)
counties.2010.SUL.RDPC.SD <- sd(counties.2010.SUL.RDPC)

counties.2010.CENTRO_OESTE.RDPC.MEAN <- mean(counties.2010.CENTRO_OESTE.RDPC)
counties.2010.CENTRO_OESTE.RDPC.MEDIAN <- median(counties.2010.CENTRO_OESTE.RDPC)
counties.2010.CENTRO_OESTE.RDPC.SD <- sd(counties.2010.CENTRO_OESTE.RDPC)

counties.1991.RDPC.MEAN <- mean(counties.1991$RDPC)
counties.1991.RDPC.MEDIAN <- median(counties.1991$RDPC)
counties.1991.RDPC.SD <- sd(counties.1991$RDPC)

counties.2000.RDPC.MEAN <- mean(counties.2000$RDPC)
counties.2000.RDPC.MEDIAN <- median(counties.2000$RDPC)
counties.2000.RDPC.SD <- sd(counties.2000$RDPC)

counties.2010.RDPC.MEAN <- mean(counties.2010$RDPC)
counties.2010.RDPC.MEDIAN <- median(counties.2010$RDPC)
counties.2010.RDPC.SD <- sd(counties.2010$RDPC)

RDPC.1991.MEAN <- c(counties.1991.NORTE.RDPC.MEAN, 
                       counties.1991.NORDESTE.RDPC.MEAN,
                       counties.1991.SUDESTE.RDPC.MEAN,
                       counties.1991.SUL.RDPC.MEAN,
                       counties.1991.CENTRO_OESTE.RDPC.MEAN)

RDPC.1991.MEDIAN <- c(counties.1991.NORTE.RDPC.MEDIAN, 
                         counties.1991.NORDESTE.RDPC.MEDIAN,
                         counties.1991.SUDESTE.RDPC.MEDIAN,
                         counties.1991.SUL.RDPC.MEDIAN,
                         counties.1991.CENTRO_OESTE.RDPC.MEDIAN)

RDPC.1991.SD <- c(counties.1991.NORTE.RDPC.SD, 
                     counties.1991.NORDESTE.RDPC.SD,
                     counties.1991.SUDESTE.RDPC.SD,
                     counties.1991.SUL.RDPC.SD,
                     counties.1991.CENTRO_OESTE.RDPC.SD)

RDPC.1991 <- data.frame(RDPC.1991.MEAN, RDPC.1991.MEDIAN, RDPC.1991.SD)
rownames(RDPC.1991) <- c_regions

RDPC.2000.MEAN <- c(counties.2000.NORTE.RDPC.MEAN, 
                       counties.2000.NORDESTE.RDPC.MEAN,
                       counties.2000.SUDESTE.RDPC.MEAN,
                       counties.2000.SUL.RDPC.MEAN,
                       counties.2000.CENTRO_OESTE.RDPC.MEAN)

RDPC.2000.MEDIAN <- c(counties.2000.NORTE.RDPC.MEDIAN, 
                         counties.2000.NORDESTE.RDPC.MEDIAN,
                         counties.2000.SUDESTE.RDPC.MEDIAN,
                         counties.2000.SUL.RDPC.MEDIAN,
                         counties.2000.CENTRO_OESTE.RDPC.MEDIAN)

RDPC.2000.SD <- c(counties.2000.NORTE.RDPC.SD, 
                     counties.2000.NORDESTE.RDPC.SD,
                     counties.2000.SUDESTE.RDPC.SD,
                     counties.2000.SUL.RDPC.SD,
                     counties.2000.CENTRO_OESTE.RDPC.SD)

RDPC.2000 <- data.frame(RDPC.2000.MEAN, RDPC.2000.MEDIAN, RDPC.2000.SD)
rownames(RDPC.2000) <- c_regions

RDPC.2010.MEAN <- c(counties.2010.NORTE.RDPC.MEAN, 
                       counties.2010.NORDESTE.RDPC.MEAN,
                       counties.2010.SUDESTE.RDPC.MEAN,
                       counties.2010.SUL.RDPC.MEAN,
                       counties.2010.CENTRO_OESTE.RDPC.MEAN)

RDPC.2010.MEDIAN <- c(counties.2010.NORTE.RDPC.MEDIAN, 
                         counties.2010.NORDESTE.RDPC.MEDIAN,
                         counties.2010.SUDESTE.RDPC.MEDIAN,
                         counties.2010.SUL.RDPC.MEDIAN,
                         counties.2010.CENTRO_OESTE.RDPC.MEDIAN)

RDPC.2010.SD <- c(counties.2010.NORTE.RDPC.SD, 
                     counties.2010.NORDESTE.RDPC.SD,
                     counties.2010.SUDESTE.RDPC.SD,
                     counties.2010.SUL.RDPC.SD,
                     counties.2010.CENTRO_OESTE.RDPC.SD)

RDPC.2010 <- data.frame(RDPC.2010.MEAN, RDPC.2010.MEDIAN, RDPC.2010.SD)
rownames(RDPC.2010) <- c_regions

# Grouped Boxplot
p <- ggplot(RDPC_BY_REGION.df, aes(x = GROUP_BY_REGION, y=RDPC_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Renda per capta Média por Região") + xlab(NULL) + ylab("Reais") + labs(fill="Ano") + theme(plot.title = element_text(hjust = 0.5))

###########################################################
# E_ANOSESTUDO - Expectativa de anos de estudo

counties.1991.NORTE.E_ANOSESTUDO <- counties.1991.NORTE$E_ANOSESTUDO
counties.1991.NORDESTE.E_ANOSESTUDO <- counties.1991.NORDESTE$E_ANOSESTUDO
counties.1991.SUDESTE.E_ANOSESTUDO <- counties.1991.SUDESTE$E_ANOSESTUDO
counties.1991.SUL.E_ANOSESTUDO <- counties.1991.SUL$E_ANOSESTUDO
counties.1991.CENTRO_OESTE.E_ANOSESTUDO <- counties.1991.CENTRO_OESTE$E_ANOSESTUDO

counties.2000.NORTE.E_ANOSESTUDO <- counties.2000.NORTE$E_ANOSESTUDO
counties.2000.NORDESTE.E_ANOSESTUDO <- counties.2000.NORDESTE$E_ANOSESTUDO
counties.2000.SUDESTE.E_ANOSESTUDO <- counties.2000.SUDESTE$E_ANOSESTUDO
counties.2000.SUL.E_ANOSESTUDO <- counties.2000.SUL$E_ANOSESTUDO
counties.2000.CENTRO_OESTE.E_ANOSESTUDO <- counties.2000.CENTRO_OESTE$E_ANOSESTUDO

counties.2010.NORTE.E_ANOSESTUDO <- counties.2010.NORTE$E_ANOSESTUDO
counties.2010.NORDESTE.E_ANOSESTUDO <- counties.2010.NORDESTE$E_ANOSESTUDO
counties.2010.SUDESTE.E_ANOSESTUDO <- counties.2010.SUDESTE$E_ANOSESTUDO
counties.2010.SUL.E_ANOSESTUDO <- counties.2010.SUL$E_ANOSESTUDO
counties.2010.CENTRO_OESTE.E_ANOSESTUDO <- counties.2010.CENTRO_OESTE$E_ANOSESTUDO

E_ANOSESTUDO_BY_REGION <- c(counties.1991.NORTE.E_ANOSESTUDO, counties.2000.NORTE.E_ANOSESTUDO, counties.2010.NORTE.E_ANOSESTUDO,
                    counties.1991.NORDESTE.E_ANOSESTUDO, counties.2000.NORDESTE.E_ANOSESTUDO, counties.2010.NORDESTE.E_ANOSESTUDO,
                    counties.1991.SUDESTE.E_ANOSESTUDO, counties.2000.SUDESTE.E_ANOSESTUDO, counties.2010.SUDESTE.E_ANOSESTUDO,
                    counties.1991.SUL.E_ANOSESTUDO, counties.2000.SUL.E_ANOSESTUDO, counties.2010.SUL.E_ANOSESTUDO,
                    counties.1991.CENTRO_OESTE.E_ANOSESTUDO, counties.2000.CENTRO_OESTE.E_ANOSESTUDO, counties.2010.CENTRO_OESTE.E_ANOSESTUDO)

E_ANOSESTUDO_BY_REGION.df <- data.frame(GROUP_BY_REGION, GROUP_BY_YEAR, E_ANOSESTUDO_BY_REGION)

# Mean, Median and Standard Deviation
counties.1991.NORTE.E_ANOSESTUDO.MEAN <- mean(counties.1991.NORTE.E_ANOSESTUDO)
counties.1991.NORTE.E_ANOSESTUDO.MEDIAN <- median(counties.1991.NORTE.E_ANOSESTUDO)
counties.1991.NORTE.E_ANOSESTUDO.SD <- sd(counties.1991.NORTE.E_ANOSESTUDO)

counties.1991.NORDESTE.E_ANOSESTUDO.MEAN <- mean(counties.1991.NORDESTE.E_ANOSESTUDO)
counties.1991.NORDESTE.E_ANOSESTUDO.MEDIAN <- median(counties.1991.NORDESTE.E_ANOSESTUDO)
counties.1991.NORDESTE.E_ANOSESTUDO.SD <- sd(counties.1991.NORDESTE.E_ANOSESTUDO)

counties.1991.SUDESTE.E_ANOSESTUDO.MEAN <- mean(counties.1991.SUDESTE.E_ANOSESTUDO)
counties.1991.SUDESTE.E_ANOSESTUDO.MEDIAN <- median(counties.1991.SUDESTE.E_ANOSESTUDO)
counties.1991.SUDESTE.E_ANOSESTUDO.SD <- sd(counties.1991.SUDESTE.E_ANOSESTUDO)

counties.1991.SUL.E_ANOSESTUDO.MEAN <- mean(counties.1991.SUL.E_ANOSESTUDO)
counties.1991.SUL.E_ANOSESTUDO.MEDIAN <- median(counties.1991.SUL.E_ANOSESTUDO)
counties.1991.SUL.E_ANOSESTUDO.SD <- sd(counties.1991.SUL.E_ANOSESTUDO)

counties.1991.CENTRO_OESTE.E_ANOSESTUDO.MEAN <- mean(counties.1991.CENTRO_OESTE.E_ANOSESTUDO)
counties.1991.CENTRO_OESTE.E_ANOSESTUDO.MEDIAN <- median(counties.1991.CENTRO_OESTE.E_ANOSESTUDO)
counties.1991.CENTRO_OESTE.E_ANOSESTUDO.SD <- sd(counties.1991.CENTRO_OESTE.E_ANOSESTUDO)

counties.2000.NORTE.E_ANOSESTUDO.MEAN <- mean(counties.2000.NORTE.E_ANOSESTUDO)
counties.2000.NORTE.E_ANOSESTUDO.MEDIAN <- median(counties.2000.NORTE.E_ANOSESTUDO)
counties.2000.NORTE.E_ANOSESTUDO.SD <- sd(counties.2000.NORTE.E_ANOSESTUDO)

counties.2000.NORDESTE.E_ANOSESTUDO.MEAN <- mean(counties.2000.NORDESTE.E_ANOSESTUDO)
counties.2000.NORDESTE.E_ANOSESTUDO.MEDIAN <- median(counties.2000.NORDESTE.E_ANOSESTUDO)
counties.2000.NORDESTE.E_ANOSESTUDO.SD <- sd(counties.2000.NORDESTE.E_ANOSESTUDO)

counties.2000.SUDESTE.E_ANOSESTUDO.MEAN <- mean(counties.2000.SUDESTE.E_ANOSESTUDO)
counties.2000.SUDESTE.E_ANOSESTUDO.MEDIAN <- median(counties.2000.SUDESTE.E_ANOSESTUDO)
counties.2000.SUDESTE.E_ANOSESTUDO.SD <- sd(counties.2000.SUDESTE.E_ANOSESTUDO)

counties.2000.SUL.E_ANOSESTUDO.MEAN <- mean(counties.2000.SUL.E_ANOSESTUDO)
counties.2000.SUL.E_ANOSESTUDO.MEDIAN <- median(counties.2000.SUL.E_ANOSESTUDO)
counties.2000.SUL.E_ANOSESTUDO.SD <- sd(counties.2000.SUL.E_ANOSESTUDO)

counties.2000.CENTRO_OESTE.E_ANOSESTUDO.MEAN <- mean(counties.2000.CENTRO_OESTE.E_ANOSESTUDO)
counties.2000.CENTRO_OESTE.E_ANOSESTUDO.MEDIAN <- median(counties.2000.CENTRO_OESTE.E_ANOSESTUDO)
counties.2000.CENTRO_OESTE.E_ANOSESTUDO.SD <- sd(counties.2000.CENTRO_OESTE.E_ANOSESTUDO)

counties.2010.NORTE.E_ANOSESTUDO.MEAN <- mean(counties.2010.NORTE.E_ANOSESTUDO)
counties.2010.NORTE.E_ANOSESTUDO.MEDIAN <- median(counties.2010.NORTE.E_ANOSESTUDO)
counties.2010.NORTE.E_ANOSESTUDO.SD <- sd(counties.2010.NORTE.E_ANOSESTUDO)

counties.2010.NORDESTE.E_ANOSESTUDO.MEAN <- mean(counties.2010.NORDESTE.E_ANOSESTUDO)
counties.2010.NORDESTE.E_ANOSESTUDO.MEDIAN <- median(counties.2010.NORDESTE.E_ANOSESTUDO)
counties.2010.NORDESTE.E_ANOSESTUDO.SD <- sd(counties.2010.NORDESTE.E_ANOSESTUDO)

counties.2010.SUDESTE.E_ANOSESTUDO.MEAN <- mean(counties.2010.SUDESTE.E_ANOSESTUDO)
counties.2010.SUDESTE.E_ANOSESTUDO.MEDIAN <- median(counties.2010.SUDESTE.E_ANOSESTUDO)
counties.2010.SUDESTE.E_ANOSESTUDO.SD <- sd(counties.2010.SUDESTE.E_ANOSESTUDO)

counties.2010.SUL.E_ANOSESTUDO.MEAN <- mean(counties.2010.SUL.E_ANOSESTUDO)
counties.2010.SUL.E_ANOSESTUDO.MEDIAN <- median(counties.2010.SUL.E_ANOSESTUDO)
counties.2010.SUL.E_ANOSESTUDO.SD <- sd(counties.2010.SUL.E_ANOSESTUDO)

counties.2010.CENTRO_OESTE.E_ANOSESTUDO.MEAN <- mean(counties.2010.CENTRO_OESTE.E_ANOSESTUDO)
counties.2010.CENTRO_OESTE.E_ANOSESTUDO.MEDIAN <- median(counties.2010.CENTRO_OESTE.E_ANOSESTUDO)
counties.2010.CENTRO_OESTE.E_ANOSESTUDO.SD <- sd(counties.2010.CENTRO_OESTE.E_ANOSESTUDO)

counties.1991.E_ANOSESTUDO.MEAN <- mean(counties.1991$E_ANOSESTUDO)
counties.1991.E_ANOSESTUDO.MEDIAN <- median(counties.1991$E_ANOSESTUDO)
counties.1991.E_ANOSESTUDO.SD <- sd(counties.1991$E_ANOSESTUDO)

counties.2000.E_ANOSESTUDO.MEAN <- mean(counties.2000$E_ANOSESTUDO)
counties.2000.E_ANOSESTUDO.MEDIAN <- median(counties.2000$E_ANOSESTUDO)
counties.2000.E_ANOSESTUDO.SD <- sd(counties.2000$E_ANOSESTUDO)

counties.2010.E_ANOSESTUDO.MEAN <- mean(counties.2010$E_ANOSESTUDO)
counties.2010.E_ANOSESTUDO.MEDIAN <- median(counties.2010$E_ANOSESTUDO)
counties.2010.E_ANOSESTUDO.SD <- sd(counties.2010$E_ANOSESTUDO)

E_ANOSESTUDO.1991.MEAN <- c(counties.1991.NORTE.E_ANOSESTUDO.MEAN, 
                    counties.1991.NORDESTE.E_ANOSESTUDO.MEAN,
                    counties.1991.SUDESTE.E_ANOSESTUDO.MEAN,
                    counties.1991.SUL.E_ANOSESTUDO.MEAN,
                    counties.1991.CENTRO_OESTE.E_ANOSESTUDO.MEAN)

E_ANOSESTUDO.1991.MEDIAN <- c(counties.1991.NORTE.E_ANOSESTUDO.MEDIAN, 
                      counties.1991.NORDESTE.E_ANOSESTUDO.MEDIAN,
                      counties.1991.SUDESTE.E_ANOSESTUDO.MEDIAN,
                      counties.1991.SUL.E_ANOSESTUDO.MEDIAN,
                      counties.1991.CENTRO_OESTE.E_ANOSESTUDO.MEDIAN)

E_ANOSESTUDO.1991.SD <- c(counties.1991.NORTE.E_ANOSESTUDO.SD, 
                  counties.1991.NORDESTE.E_ANOSESTUDO.SD,
                  counties.1991.SUDESTE.E_ANOSESTUDO.SD,
                  counties.1991.SUL.E_ANOSESTUDO.SD,
                  counties.1991.CENTRO_OESTE.E_ANOSESTUDO.SD)

E_ANOSESTUDO.1991 <- data.frame(E_ANOSESTUDO.1991.MEAN, E_ANOSESTUDO.1991.MEDIAN, E_ANOSESTUDO.1991.SD)
rownames(E_ANOSESTUDO.1991) <- c_regions

E_ANOSESTUDO.2000.MEAN <- c(counties.2000.NORTE.E_ANOSESTUDO.MEAN, 
                    counties.2000.NORDESTE.E_ANOSESTUDO.MEAN,
                    counties.2000.SUDESTE.E_ANOSESTUDO.MEAN,
                    counties.2000.SUL.E_ANOSESTUDO.MEAN,
                    counties.2000.CENTRO_OESTE.E_ANOSESTUDO.MEAN)

E_ANOSESTUDO.2000.MEDIAN <- c(counties.2000.NORTE.E_ANOSESTUDO.MEDIAN, 
                      counties.2000.NORDESTE.E_ANOSESTUDO.MEDIAN,
                      counties.2000.SUDESTE.E_ANOSESTUDO.MEDIAN,
                      counties.2000.SUL.E_ANOSESTUDO.MEDIAN,
                      counties.2000.CENTRO_OESTE.E_ANOSESTUDO.MEDIAN)

E_ANOSESTUDO.2000.SD <- c(counties.2000.NORTE.E_ANOSESTUDO.SD, 
                  counties.2000.NORDESTE.E_ANOSESTUDO.SD,
                  counties.2000.SUDESTE.E_ANOSESTUDO.SD,
                  counties.2000.SUL.E_ANOSESTUDO.SD,
                  counties.2000.CENTRO_OESTE.E_ANOSESTUDO.SD)

E_ANOSESTUDO.2000 <- data.frame(E_ANOSESTUDO.2000.MEAN, E_ANOSESTUDO.2000.MEDIAN, E_ANOSESTUDO.2000.SD)
rownames(E_ANOSESTUDO.2000) <- c_regions

E_ANOSESTUDO.2010.MEAN <- c(counties.2010.NORTE.E_ANOSESTUDO.MEAN, 
                    counties.2010.NORDESTE.E_ANOSESTUDO.MEAN,
                    counties.2010.SUDESTE.E_ANOSESTUDO.MEAN,
                    counties.2010.SUL.E_ANOSESTUDO.MEAN,
                    counties.2010.CENTRO_OESTE.E_ANOSESTUDO.MEAN)

E_ANOSESTUDO.2010.MEDIAN <- c(counties.2010.NORTE.E_ANOSESTUDO.MEDIAN, 
                      counties.2010.NORDESTE.E_ANOSESTUDO.MEDIAN,
                      counties.2010.SUDESTE.E_ANOSESTUDO.MEDIAN,
                      counties.2010.SUL.E_ANOSESTUDO.MEDIAN,
                      counties.2010.CENTRO_OESTE.E_ANOSESTUDO.MEDIAN)

E_ANOSESTUDO.2010.SD <- c(counties.2010.NORTE.E_ANOSESTUDO.SD, 
                  counties.2010.NORDESTE.E_ANOSESTUDO.SD,
                  counties.2010.SUDESTE.E_ANOSESTUDO.SD,
                  counties.2010.SUL.E_ANOSESTUDO.SD,
                  counties.2010.CENTRO_OESTE.E_ANOSESTUDO.SD)

E_ANOSESTUDO.2010 <- data.frame(E_ANOSESTUDO.2010.MEAN, E_ANOSESTUDO.2010.MEDIAN, E_ANOSESTUDO.2010.SD)
rownames(E_ANOSESTUDO.2010) <- c_regions

# Grouped Boxplot
p <- ggplot(E_ANOSESTUDO_BY_REGION.df, aes(x = GROUP_BY_REGION, y=E_ANOSESTUDO_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Expectativa de Anos de Estudo ao Atingir 18 Anos por Região") + xlab(NULL) + ylab("Anos") + labs(fill="Anos") + theme(plot.title = element_text(hjust = 0.5))

###########################################################
# GINI - Índice de Gini

counties.1991.NORTE.GINI <- counties.1991.NORTE$GINI
counties.1991.NORDESTE.GINI <- counties.1991.NORDESTE$GINI
counties.1991.SUDESTE.GINI <- counties.1991.SUDESTE$GINI
counties.1991.SUL.GINI <- counties.1991.SUL$GINI
counties.1991.CENTRO_OESTE.GINI <- counties.1991.CENTRO_OESTE$GINI

counties.2000.NORTE.GINI <- counties.2000.NORTE$GINI
counties.2000.NORDESTE.GINI <- counties.2000.NORDESTE$GINI
counties.2000.SUDESTE.GINI <- counties.2000.SUDESTE$GINI
counties.2000.SUL.GINI <- counties.2000.SUL$GINI
counties.2000.CENTRO_OESTE.GINI <- counties.2000.CENTRO_OESTE$GINI

counties.2010.NORTE.GINI <- counties.2010.NORTE$GINI
counties.2010.NORDESTE.GINI <- counties.2010.NORDESTE$GINI
counties.2010.SUDESTE.GINI <- counties.2010.SUDESTE$GINI
counties.2010.SUL.GINI <- counties.2010.SUL$GINI
counties.2010.CENTRO_OESTE.GINI <- counties.2010.CENTRO_OESTE$GINI

GINI_BY_REGION <- c(counties.1991.NORTE.GINI, counties.2000.NORTE.GINI, counties.2010.NORTE.GINI,
                    counties.1991.NORDESTE.GINI, counties.2000.NORDESTE.GINI, counties.2010.NORDESTE.GINI,
                    counties.1991.SUDESTE.GINI, counties.2000.SUDESTE.GINI, counties.2010.SUDESTE.GINI,
                    counties.1991.SUL.GINI, counties.2000.SUL.GINI, counties.2010.SUL.GINI,
                    counties.1991.CENTRO_OESTE.GINI, counties.2000.CENTRO_OESTE.GINI, counties.2010.CENTRO_OESTE.GINI)

GINI_BY_REGION.df <- data.frame(GROUP_BY_REGION, GROUP_BY_YEAR, GINI_BY_REGION)

# Mean, Median and Standard Deviation
counties.1991.NORTE.GINI.MEAN <- mean(counties.1991.NORTE.GINI)
counties.1991.NORTE.GINI.MEDIAN <- median(counties.1991.NORTE.GINI)
counties.1991.NORTE.GINI.SD <- sd(counties.1991.NORTE.GINI)

counties.1991.NORDESTE.GINI.MEAN <- mean(counties.1991.NORDESTE.GINI)
counties.1991.NORDESTE.GINI.MEDIAN <- median(counties.1991.NORDESTE.GINI)
counties.1991.NORDESTE.GINI.SD <- sd(counties.1991.NORDESTE.GINI)

counties.1991.SUDESTE.GINI.MEAN <- mean(counties.1991.SUDESTE.GINI)
counties.1991.SUDESTE.GINI.MEDIAN <- median(counties.1991.SUDESTE.GINI)
counties.1991.SUDESTE.GINI.SD <- sd(counties.1991.SUDESTE.GINI)

counties.1991.SUL.GINI.MEAN <- mean(counties.1991.SUL.GINI)
counties.1991.SUL.GINI.MEDIAN <- median(counties.1991.SUL.GINI)
counties.1991.SUL.GINI.SD <- sd(counties.1991.SUL.GINI)

counties.1991.CENTRO_OESTE.GINI.MEAN <- mean(counties.1991.CENTRO_OESTE.GINI)
counties.1991.CENTRO_OESTE.GINI.MEDIAN <- median(counties.1991.CENTRO_OESTE.GINI)
counties.1991.CENTRO_OESTE.GINI.SD <- sd(counties.1991.CENTRO_OESTE.GINI)

counties.2000.NORTE.GINI.MEAN <- mean(counties.2000.NORTE.GINI)
counties.2000.NORTE.GINI.MEDIAN <- median(counties.2000.NORTE.GINI)
counties.2000.NORTE.GINI.SD <- sd(counties.2000.NORTE.GINI)

counties.2000.NORDESTE.GINI.MEAN <- mean(counties.2000.NORDESTE.GINI)
counties.2000.NORDESTE.GINI.MEDIAN <- median(counties.2000.NORDESTE.GINI)
counties.2000.NORDESTE.GINI.SD <- sd(counties.2000.NORDESTE.GINI)

counties.2000.SUDESTE.GINI.MEAN <- mean(counties.2000.SUDESTE.GINI)
counties.2000.SUDESTE.GINI.MEDIAN <- median(counties.2000.SUDESTE.GINI)
counties.2000.SUDESTE.GINI.SD <- sd(counties.2000.SUDESTE.GINI)

counties.2000.SUL.GINI.MEAN <- mean(counties.2000.SUL.GINI)
counties.2000.SUL.GINI.MEDIAN <- median(counties.2000.SUL.GINI)
counties.2000.SUL.GINI.SD <- sd(counties.2000.SUL.GINI)

counties.2000.CENTRO_OESTE.GINI.MEAN <- mean(counties.2000.CENTRO_OESTE.GINI)
counties.2000.CENTRO_OESTE.GINI.MEDIAN <- median(counties.2000.CENTRO_OESTE.GINI)
counties.2000.CENTRO_OESTE.GINI.SD <- sd(counties.2000.CENTRO_OESTE.GINI)

counties.2010.NORTE.GINI.MEAN <- mean(counties.2010.NORTE.GINI)
counties.2010.NORTE.GINI.MEDIAN <- median(counties.2010.NORTE.GINI)
counties.2010.NORTE.GINI.SD <- sd(counties.2010.NORTE.GINI)

counties.2010.NORDESTE.GINI.MEAN <- mean(counties.2010.NORDESTE.GINI)
counties.2010.NORDESTE.GINI.MEDIAN <- median(counties.2010.NORDESTE.GINI)
counties.2010.NORDESTE.GINI.SD <- sd(counties.2010.NORDESTE.GINI)

counties.2010.SUDESTE.GINI.MEAN <- mean(counties.2010.SUDESTE.GINI)
counties.2010.SUDESTE.GINI.MEDIAN <- median(counties.2010.SUDESTE.GINI)
counties.2010.SUDESTE.GINI.SD <- sd(counties.2010.SUDESTE.GINI)

counties.2010.SUL.GINI.MEAN <- mean(counties.2010.SUL.GINI)
counties.2010.SUL.GINI.MEDIAN <- median(counties.2010.SUL.GINI)
counties.2010.SUL.GINI.SD <- sd(counties.2010.SUL.GINI)

counties.2010.CENTRO_OESTE.GINI.MEAN <- mean(counties.2010.CENTRO_OESTE.GINI)
counties.2010.CENTRO_OESTE.GINI.MEDIAN <- median(counties.2010.CENTRO_OESTE.GINI)
counties.2010.CENTRO_OESTE.GINI.SD <- sd(counties.2010.CENTRO_OESTE.GINI)

counties.1991.GINI.MEAN <- mean(counties.1991$GINI)
counties.1991.GINI.MEDIAN <- median(counties.1991$GINI)
counties.1991.GINI.SD <- sd(counties.1991$GINI)

counties.2000.GINI.MEAN <- mean(counties.2000$GINI)
counties.2000.GINI.MEDIAN <- median(counties.2000$GINI)
counties.2000.GINI.SD <- sd(counties.2000$GINI)

counties.2010.GINI.MEAN <- mean(counties.2010$GINI)
counties.2010.GINI.MEDIAN <- median(counties.2010$GINI)
counties.2010.GINI.SD <- sd(counties.2010$GINI)

GINI.1991.MEAN <- c(counties.1991.NORTE.GINI.MEAN, 
                            counties.1991.NORDESTE.GINI.MEAN,
                            counties.1991.SUDESTE.GINI.MEAN,
                            counties.1991.SUL.GINI.MEAN,
                            counties.1991.CENTRO_OESTE.GINI.MEAN)

GINI.1991.MEDIAN <- c(counties.1991.NORTE.GINI.MEDIAN, 
                              counties.1991.NORDESTE.GINI.MEDIAN,
                              counties.1991.SUDESTE.GINI.MEDIAN,
                              counties.1991.SUL.GINI.MEDIAN,
                              counties.1991.CENTRO_OESTE.GINI.MEDIAN)

GINI.1991.SD <- c(counties.1991.NORTE.GINI.SD, 
                          counties.1991.NORDESTE.GINI.SD,
                          counties.1991.SUDESTE.GINI.SD,
                          counties.1991.SUL.GINI.SD,
                          counties.1991.CENTRO_OESTE.GINI.SD)

GINI.1991 <- data.frame(GINI.1991.MEAN, GINI.1991.MEDIAN, GINI.1991.SD)
rownames(GINI.1991) <- c_regions

GINI.2000.MEAN <- c(counties.2000.NORTE.GINI.MEAN, 
                            counties.2000.NORDESTE.GINI.MEAN,
                            counties.2000.SUDESTE.GINI.MEAN,
                            counties.2000.SUL.GINI.MEAN,
                            counties.2000.CENTRO_OESTE.GINI.MEAN)

GINI.2000.MEDIAN <- c(counties.2000.NORTE.GINI.MEDIAN, 
                              counties.2000.NORDESTE.GINI.MEDIAN,
                              counties.2000.SUDESTE.GINI.MEDIAN,
                              counties.2000.SUL.GINI.MEDIAN,
                              counties.2000.CENTRO_OESTE.GINI.MEDIAN)

GINI.2000.SD <- c(counties.2000.NORTE.GINI.SD, 
                          counties.2000.NORDESTE.GINI.SD,
                          counties.2000.SUDESTE.GINI.SD,
                          counties.2000.SUL.GINI.SD,
                          counties.2000.CENTRO_OESTE.GINI.SD)

GINI.2000 <- data.frame(GINI.2000.MEAN, GINI.2000.MEDIAN, GINI.2000.SD)
rownames(GINI.2000) <- c_regions

GINI.2010.MEAN <- c(counties.2010.NORTE.GINI.MEAN, 
                            counties.2010.NORDESTE.GINI.MEAN,
                            counties.2010.SUDESTE.GINI.MEAN,
                            counties.2010.SUL.GINI.MEAN,
                            counties.2010.CENTRO_OESTE.GINI.MEAN)

GINI.2010.MEDIAN <- c(counties.2010.NORTE.GINI.MEDIAN, 
                              counties.2010.NORDESTE.GINI.MEDIAN,
                              counties.2010.SUDESTE.GINI.MEDIAN,
                              counties.2010.SUL.GINI.MEDIAN,
                              counties.2010.CENTRO_OESTE.GINI.MEDIAN)

GINI.2010.SD <- c(counties.2010.NORTE.GINI.SD, 
                          counties.2010.NORDESTE.GINI.SD,
                          counties.2010.SUDESTE.GINI.SD,
                          counties.2010.SUL.GINI.SD,
                          counties.2010.CENTRO_OESTE.GINI.SD)

GINI.2010 <- data.frame(GINI.2010.MEAN, GINI.2010.MEDIAN, GINI.2010.SD)
rownames(GINI.2010) <- c_regions

# Grouped Boxplot
p <- ggplot(GINI_BY_REGION.df, aes(x = GROUP_BY_REGION, y=GINI_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Índice de Gini") + xlab(NULL) + ylab("Anos") + labs(fill="Anos") + theme(plot.title = element_text(hjust = 0.5))

###########################################################
# IDHM -Índice de Desenvolvimento Humano Municipal
# IDHM_E - Índice de Desenvolvimento Humano Municipal - Dimensão Educação
# IDHM_L - Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade
# IDHM_R - IDHM Renda

counties.1991.NORTE.IDHM <- counties.1991.NORTE$IDHM
counties.1991.NORDESTE.IDHM <- counties.1991.NORDESTE$IDHM
counties.1991.SUDESTE.IDHM <- counties.1991.SUDESTE$IDHM
counties.1991.SUL.IDHM <- counties.1991.SUL$IDHM
counties.1991.CENTRO_OESTE.IDHM <- counties.1991.CENTRO_OESTE$IDHM

counties.2000.NORTE.IDHM <- counties.2000.NORTE$IDHM
counties.2000.NORDESTE.IDHM <- counties.2000.NORDESTE$IDHM
counties.2000.SUDESTE.IDHM <- counties.2000.SUDESTE$IDHM
counties.2000.SUL.IDHM <- counties.2000.SUL$IDHM
counties.2000.CENTRO_OESTE.IDHM <- counties.2000.CENTRO_OESTE$IDHM

counties.2010.NORTE.IDHM <- counties.2010.NORTE$IDHM
counties.2010.NORDESTE.IDHM <- counties.2010.NORDESTE$IDHM
counties.2010.SUDESTE.IDHM <- counties.2010.SUDESTE$IDHM
counties.2010.SUL.IDHM <- counties.2010.SUL$IDHM
counties.2010.CENTRO_OESTE.IDHM <- counties.2010.CENTRO_OESTE$IDHM

IDHM_BY_REGION <- c(counties.1991.NORTE.IDHM, counties.2000.NORTE.IDHM, counties.2010.NORTE.IDHM,
                    counties.1991.NORDESTE.IDHM, counties.2000.NORDESTE.IDHM, counties.2010.NORDESTE.IDHM,
                    counties.1991.SUDESTE.IDHM, counties.2000.SUDESTE.IDHM, counties.2010.SUDESTE.IDHM,
                    counties.1991.SUL.IDHM, counties.2000.SUL.IDHM, counties.2010.SUL.IDHM,
                    counties.1991.CENTRO_OESTE.IDHM, counties.2000.CENTRO_OESTE.IDHM, counties.2010.CENTRO_OESTE.IDHM)

IDHM_BY_REGION.df <- data.frame(GROUP_BY_REGION, GROUP_BY_YEAR, IDHM_BY_REGION)

# Mean, Median and Standard Deviation
counties.1991.NORTE.IDHM.MEAN <- mean(counties.1991.NORTE.IDHM)
counties.1991.NORTE.IDHM.MEDIAN <- median(counties.1991.NORTE.IDHM)
counties.1991.NORTE.IDHM.SD <- sd(counties.1991.NORTE.IDHM)

counties.1991.NORDESTE.IDHM.MEAN <- mean(counties.1991.NORDESTE.IDHM)
counties.1991.NORDESTE.IDHM.MEDIAN <- median(counties.1991.NORDESTE.IDHM)
counties.1991.NORDESTE.IDHM.SD <- sd(counties.1991.NORDESTE.IDHM)

counties.1991.SUDESTE.IDHM.MEAN <- mean(counties.1991.SUDESTE.IDHM)
counties.1991.SUDESTE.IDHM.MEDIAN <- median(counties.1991.SUDESTE.IDHM)
counties.1991.SUDESTE.IDHM.SD <- sd(counties.1991.SUDESTE.IDHM)

counties.1991.SUL.IDHM.MEAN <- mean(counties.1991.SUL.IDHM)
counties.1991.SUL.IDHM.MEDIAN <- median(counties.1991.SUL.IDHM)
counties.1991.SUL.IDHM.SD <- sd(counties.1991.SUL.IDHM)

counties.1991.CENTRO_OESTE.IDHM.MEAN <- mean(counties.1991.CENTRO_OESTE.IDHM)
counties.1991.CENTRO_OESTE.IDHM.MEDIAN <- median(counties.1991.CENTRO_OESTE.IDHM)
counties.1991.CENTRO_OESTE.IDHM.SD <- sd(counties.1991.CENTRO_OESTE.IDHM)

counties.2000.NORTE.IDHM.MEAN <- mean(counties.2000.NORTE.IDHM)
counties.2000.NORTE.IDHM.MEDIAN <- median(counties.2000.NORTE.IDHM)
counties.2000.NORTE.IDHM.SD <- sd(counties.2000.NORTE.IDHM)

counties.2000.NORDESTE.IDHM.MEAN <- mean(counties.2000.NORDESTE.IDHM)
counties.2000.NORDESTE.IDHM.MEDIAN <- median(counties.2000.NORDESTE.IDHM)
counties.2000.NORDESTE.IDHM.SD <- sd(counties.2000.NORDESTE.IDHM)

counties.2000.SUDESTE.IDHM.MEAN <- mean(counties.2000.SUDESTE.IDHM)
counties.2000.SUDESTE.IDHM.MEDIAN <- median(counties.2000.SUDESTE.IDHM)
counties.2000.SUDESTE.IDHM.SD <- sd(counties.2000.SUDESTE.IDHM)

counties.2000.SUL.IDHM.MEAN <- mean(counties.2000.SUL.IDHM)
counties.2000.SUL.IDHM.MEDIAN <- median(counties.2000.SUL.IDHM)
counties.2000.SUL.IDHM.SD <- sd(counties.2000.SUL.IDHM)

counties.2000.CENTRO_OESTE.IDHM.MEAN <- mean(counties.2000.CENTRO_OESTE.IDHM)
counties.2000.CENTRO_OESTE.IDHM.MEDIAN <- median(counties.2000.CENTRO_OESTE.IDHM)
counties.2000.CENTRO_OESTE.IDHM.SD <- sd(counties.2000.CENTRO_OESTE.IDHM)

counties.2010.NORTE.IDHM.MEAN <- mean(counties.2010.NORTE.IDHM)
counties.2010.NORTE.IDHM.MEDIAN <- median(counties.2010.NORTE.IDHM)
counties.2010.NORTE.IDHM.SD <- sd(counties.2010.NORTE.IDHM)

counties.2010.NORDESTE.IDHM.MEAN <- mean(counties.2010.NORDESTE.IDHM)
counties.2010.NORDESTE.IDHM.MEDIAN <- median(counties.2010.NORDESTE.IDHM)
counties.2010.NORDESTE.IDHM.SD <- sd(counties.2010.NORDESTE.IDHM)

counties.2010.SUDESTE.IDHM.MEAN <- mean(counties.2010.SUDESTE.IDHM)
counties.2010.SUDESTE.IDHM.MEDIAN <- median(counties.2010.SUDESTE.IDHM)
counties.2010.SUDESTE.IDHM.SD <- sd(counties.2010.SUDESTE.IDHM)

counties.2010.SUL.IDHM.MEAN <- mean(counties.2010.SUL.IDHM)
counties.2010.SUL.IDHM.MEDIAN <- median(counties.2010.SUL.IDHM)
counties.2010.SUL.IDHM.SD <- sd(counties.2010.SUL.IDHM)

counties.2010.CENTRO_OESTE.IDHM.MEAN <- mean(counties.2010.CENTRO_OESTE.IDHM)
counties.2010.CENTRO_OESTE.IDHM.MEDIAN <- median(counties.2010.CENTRO_OESTE.IDHM)
counties.2010.CENTRO_OESTE.IDHM.SD <- sd(counties.2010.CENTRO_OESTE.IDHM)

counties.1991.IDHM.MEAN <- mean(counties.1991$IDHM)
counties.1991.IDHM.MEDIAN <- median(counties.1991$IDHM)
counties.1991.IDHM.SD <- sd(counties.1991$IDHM)

counties.2000.IDHM.MEAN <- mean(counties.2000$IDHM)
counties.2000.IDHM.MEDIAN <- median(counties.2000$IDHM)
counties.2000.IDHM.SD <- sd(counties.2000$IDHM)

counties.2010.IDHM.MEAN <- mean(counties.2010$IDHM)
counties.2010.IDHM.MEDIAN <- median(counties.2010$IDHM)
counties.2010.IDHM.SD <- sd(counties.2010$IDHM)

IDHM.1991.MEAN <- c(counties.1991.NORTE.IDHM.MEAN, 
                    counties.1991.NORDESTE.IDHM.MEAN,
                    counties.1991.SUDESTE.IDHM.MEAN,
                    counties.1991.SUL.IDHM.MEAN,
                    counties.1991.CENTRO_OESTE.IDHM.MEAN)

IDHM.1991.MEDIAN <- c(counties.1991.NORTE.IDHM.MEDIAN, 
                      counties.1991.NORDESTE.IDHM.MEDIAN,
                      counties.1991.SUDESTE.IDHM.MEDIAN,
                      counties.1991.SUL.IDHM.MEDIAN,
                      counties.1991.CENTRO_OESTE.IDHM.MEDIAN)

IDHM.1991.SD <- c(counties.1991.NORTE.IDHM.SD, 
                  counties.1991.NORDESTE.IDHM.SD,
                  counties.1991.SUDESTE.IDHM.SD,
                  counties.1991.SUL.IDHM.SD,
                  counties.1991.CENTRO_OESTE.IDHM.SD)

IDHM.1991 <- data.frame(IDHM.1991.MEAN, IDHM.1991.MEDIAN, IDHM.1991.SD)
rownames(IDHM.1991) <- c_regions

IDHM.2000.MEAN <- c(counties.2000.NORTE.IDHM.MEAN, 
                    counties.2000.NORDESTE.IDHM.MEAN,
                    counties.2000.SUDESTE.IDHM.MEAN,
                    counties.2000.SUL.IDHM.MEAN,
                    counties.2000.CENTRO_OESTE.IDHM.MEAN)

IDHM.2000.MEDIAN <- c(counties.2000.NORTE.IDHM.MEDIAN, 
                      counties.2000.NORDESTE.IDHM.MEDIAN,
                      counties.2000.SUDESTE.IDHM.MEDIAN,
                      counties.2000.SUL.IDHM.MEDIAN,
                      counties.2000.CENTRO_OESTE.IDHM.MEDIAN)

IDHM.2000.SD <- c(counties.2000.NORTE.IDHM.SD, 
                  counties.2000.NORDESTE.IDHM.SD,
                  counties.2000.SUDESTE.IDHM.SD,
                  counties.2000.SUL.IDHM.SD,
                  counties.2000.CENTRO_OESTE.IDHM.SD)

IDHM.2000 <- data.frame(IDHM.2000.MEAN, IDHM.2000.MEDIAN, IDHM.2000.SD)
rownames(IDHM.2000) <- c_regions

IDHM.2010.MEAN <- c(counties.2010.NORTE.IDHM.MEAN, 
                    counties.2010.NORDESTE.IDHM.MEAN,
                    counties.2010.SUDESTE.IDHM.MEAN,
                    counties.2010.SUL.IDHM.MEAN,
                    counties.2010.CENTRO_OESTE.IDHM.MEAN)

IDHM.2010.MEDIAN <- c(counties.2010.NORTE.IDHM.MEDIAN, 
                      counties.2010.NORDESTE.IDHM.MEDIAN,
                      counties.2010.SUDESTE.IDHM.MEDIAN,
                      counties.2010.SUL.IDHM.MEDIAN,
                      counties.2010.CENTRO_OESTE.IDHM.MEDIAN)

IDHM.2010.SD <- c(counties.2010.NORTE.IDHM.SD, 
                  counties.2010.NORDESTE.IDHM.SD,
                  counties.2010.SUDESTE.IDHM.SD,
                  counties.2010.SUL.IDHM.SD,
                  counties.2010.CENTRO_OESTE.IDHM.SD)

IDHM.2010 <- data.frame(IDHM.2010.MEAN, IDHM.2010.MEDIAN, IDHM.2010.SD)
rownames(IDHM.2010) <- c_regions

# Grouped Boxplot
p <- ggplot(IDHM_BY_REGION.df, aes(x = GROUP_BY_REGION, y=IDHM_BY_REGION, fill = GROUP_BY_YEAR)) + geom_boxplot()

p + ggtitle("Índice de Desenvolvimento Humano Municipal por Região") + xlab(NULL) + ylab(NULL) + labs(fill="Anos") + theme(plot.title = element_text(hjust = 0.5))

getStatisticalData = function(df, parameter){
  eval(substitute(parameter), df)
  
}
