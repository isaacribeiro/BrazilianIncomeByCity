# Required Libraries
library(readxl)
library(rgdal)
library(gridExtra)
library(ggplot2)

# (!) ESPVIDA - Esperança de vida ao nascer
# Número médio de anos que as pessoas deverão viver a partir do nascimento, se permanecerem constantes ao longo da vida o nível e o padrão de mortalidade por idade prevalecentes no ano do Censo.

# T_ENV - Taxa de envelhecimento
# Razão entre a população de 65 anos ou mais de idade e a população total multiplicado por 100.

# RAZDEP - Razão de dependência 
# Razão de dependência é medida pela razão entre o número de pessoas com 14 anos ou menos e de 65 anos ou mais de idade (população dependente) e o número de pessoas com idade de 15 a 64 anos (população potencialmente ativa) multiplicado por 100.

# (!) E_ANOSESTUDO - Expectativa de anos de estudo
# Número médio de anos de estudo que uma geração de crianças que ingressa na escola deverá completar ao atingir 18 anos de idade, se os padrões atuais se mantiverem ao longo de sua vida escolar.

# (!) T_ANALF18M - Taxa de analfabetismo da população de 18 anos ou mais de idade
# Razão entre a população de 18 anos ou mais de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# T_ANALF25A29 - Taxa de analfabetismo da população de 25 a 29 anos de idade
# Razão entre a população de 25 a 29 anos de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# T_ANALF25M - Taxa de analfabetismo da população de 25 anos ou mais de idade
# Razão entre a população de 25 anos ou mais de idade que não sabe ler nem escrever um bilhete simples e o total de pessoas nesta faixa etária multiplicado por 100.

# T_FUND15A17 - Percentual da população de 15 a 17 anos com fundamental completo
# Razão entre a população de 15 a 17 anos de idade que concluiu o ensino fundamental, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# T_FUND16A18 - Percentual da população de 16 a 18 anos de idade com o ensino fundamental completo
# Razão entre a população de 16 a 18 anos de idade que já concluiu o ensino fundamental em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# T_FUND18A24 - Percentual da população de 18 a 24 anos com fundamental completo
# Razão entre a população de 18 a 24 anos de idade que concluiu o ensino fundamental, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# (!) T_FUND18M - Percentual da população de 18 anos ou mais com fundamental completo
# Razão entre a população de 18 anos ou mais de idade que concluiu o ensino fundamental, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# T_FUND25M - Percentual da população de 25 anos ou mais com fundamental completo
# Razão entre a população de 25 anos ou mais de idade que concluiu o ensino fundamental, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100.

# T_MED18a20 - Percentual da população de 18 a 20 anos de idade com o ensino médio completo
# Razão entre a população de 18 a 20 anos de idade que já concluiu o ensino médio em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. As pessoas de 18 a 20 anos frequentando a 4ª série do ensino médio foram consideradas como já tendo concluído esse nível de ensino.

# T_MED18A24 - Percentual da população de 18 a 24 anos com ensino médio completo
# Razão entre a população de 18 a 24 anos de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# (!) T_MED18M - Percentual da população de 18 anos ou mais com ensino médio completo
# Razão entre a população de 18 anos ou mais de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# T_MED19A21 - Percentual da população de 19 a 21 anos de idade com o ensino médio completo
# Razão entre a população de 19 a 21 anos de idade que já concluiu o ensino médio em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. As pessoas de 19 a 21 anos frequentando a 4ª série do ensino médio foram consideradas como já tendo concluído esse nível de ensino.

# T_MED25M - Percentual da população de 25 anos ou mais com ensino médio incompleto
# Razão entre a população de 25 anos ou mais de idade que concluiu o ensino médio, em quaisquer de suas modalidades (regular seriado, não seriado, EJA ou supletivo) e o total de pessoas nesta faixa etária multiplicado por 100. Foram consideradas como tendo concluído o ensino médio as pessoas frequentando a 4ª série desse nível.

# (!) T_SUPER25M - Percentual da população de 25 anos ou mais com superior completo
# Razão entre a população de 25 anos ou mais de idade que concluiu pelo menos a graduação do ensino superior e o total de pessoas nesta faixa etária multiplicado por 100.

# (!) GINI - Índice de Gini
# Mede o grau de desigualdade existente na distribuição de indivíduos segundo a renda domiciliar per capita. Seu valor varia de 0, quando não há desigualdade (a renda domiciliar per capita de todos os indivíduos tem o mesmo valor), a 1, quando a desigualdade é máxima (apenas um indivíduo detém toda a renda).O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PREN10RICOS - Percentual da renda total apropriada pelos 10% da população com maior renda domiciliar per capita
# Percentual da renda total apropriada pelos indivíduos pertencentes ao décimo mais rico da distribuição dos indivíduos segundo a renda domiciliar per capita. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PREN20 - Percentual da renda total apropriada pelos 20% da população com menor renda domiciliar per capita
# Percentual da renda total apropriada pelos indivíduos pertencentes ao quinto mais pobre da distribuição dos indivíduos segundo a renda domiciliar per capita. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PREN20RICOS - Percentual da renda total apropriada pelos 20% da população com maior renda domiciliar per capita
# Percentual da renda total apropriada pelos indivíduos pertencentes ao quinto mais rico da distribuição dos indivíduos segundo a renda domiciliar per capita. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PREN40 - Percentual da renda total apropriada pelos 40% da população com menor renda domiciliar per capita
# Percentual da renda total apropriada pelos indivíduos pertencentes aos dois quintos mais pobres da distribuição dos indivíduos segundo a renda domiciliar per capita. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PREN60 - Percentual da renda total apropriada pelos 60% da população com menor renda domiciliar per capita
# Percentual da renda total apropriada pelos indivíduos pertencentes aos três quintos mais pobres da distribuição dos indivíduos segundo a renda domiciliar per capita. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PREN80 - Percentual da renda total apropriada pelos 80% da população com menor renda domiciliar per capita
# Percentual da renda total apropriada pelos indivíduos pertencentes aos quatro quintos mais pobres da distribuição dos indivíduos segundo a renda domiciliar per capita. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# PRENTRAB - Percentual da renda proveniente de rendimentos do trabalho
# Participação percentual das rendas provenientes do trabalho (principal e outros) na renda total, considerando-se apenas as pessoas que vivem em domicílios particulares permanentes.

# R1040 - Razão 10% mais ricos / 40% mais pobres
# Medida do grau de desigualdade existente na distribuição de indivíduos segundo a renda domiciliar per capita. Compara a renda per capita média dos indivíduos pertencentes ao décimo mais rico dessa distribuição com a renda capita média dos indivíduos pertencentes aos dois quintos mais pobres. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# R2040 - Razão 20% mais ricos / 40% mais pobres
# Medida do grau de desigualdade existente na distribuição de indivíduos segundo a renda domiciliar per capita. Compara a renda per capita média dos indivíduos pertencentes ao quinto mais rico dessa distribuição com a renda per capita média dos indivíduos pertencentes aos dois quintos mais pobres. O universo de indivíduos é limitado àqueles que vivem em domicílios particulares permanentes.

# (Y) RDPC - Renda per capita média
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

# (!) PEA18M - PEA (18 anos ou mais)
# População economicamente ativa. Corresponde ao número de pessoas nessa faixa etária que, na semana de referência do Censo, encontravam-se ocupadas no mercado de trabalho ou que, encontrando-se desocupadas, tinham procurado trabalho no mês anterior à data da pesquisa.

# PESORUR - População rural
# População residente na área rural

# PESOURB - População urbana
# População residente na área urbana

# (!) PESOTOT - População total
# População residente total

# REN0 - % dos ocupados sem rendimento - 18 anos ou mais
# Razão entre o número de pessoas de 18 anos ou mais de idade ocupadas e sem rendimento do trabalho e o número total de pessoas ocupadas nessa faixa etária multiplicado por 100.

# REN1 - % dos ocupados com rendimento de até 1 s.m. - 18 anos ou mais
# Razão entre o número de pessoas de 18 anos ou mais de idade ocupadas e com rendimento mensal de todos os trabalhos inferior a 1 salário mínimo de julho de 2010 e o número total de pessoas ocupadas nessa faixa etária multiplicado por 100.

# REN2 - % dos ocupados com rendimento de até 2 s.m. - 18 anos ou mais
# Razão entre o número de pessoas de 18 anos ou mais de idade ocupadas e com rendimento mensal de todos os trabalhos inferior a 2 salários mínimos de julho de 2010 e o número total de pessoas ocupadas nessa faixa etária multiplicado por 100.

# REN3 - % dos ocupados com rendimento de até 3 s.m. - 18 anos ou mais
# Razão entre o  número de pessoas de 18 anos ou mais de idade ocupadas e com rendimento mensal de todos os trabalhos inferior a 3 salários mínimos de julho de 2010 e o número total de pessoas ocupadas nessa faixa etária multiplicado por 100.

# REN5 - % dos ocupados com rendimento de até 5 s.m. - 18 anos ou mais
# Razão entre o número de pessoas de 18 anos ou mais de idade ocupadas e com rendimento mensal de todos os trabalhos inferior a 5 salários mínimos de julho de 2010 e o número total de pessoas ocupadas nessa faixa etária multiplicado por 100.

# (!) RENOCUP - Rendimento médio dos ocupados - 18 anos ou mais
# Média dos rendimentos de todos os trabalhos das pessoas ocupadas de 18 anos ou mais de idade. Valores em reais de agosto de 2010.

# T_ATIV1517 - Taxa de atividade das pessoas de 15 a 17 anos de idade
# Razão entre as pessoas de 15 a 17 anos de idade que eram economicamente ativas, ou seja, que estavam ocupadas ou desocupadas na semana de referência do Censo e o total de pessoas nesta faixa etária multiplicado por 100. Considera-se desocupada a pessoa que, não estando ocupada na semana de referência, havia procurado trabalho no mês anterior a essa pesquisa.

# T_ATIV1824 - Taxa de atividade das pessoas de 18 a 24 anos de idade
# Razão entre as pessoas de 18 a 24 anos de idade que eram economicamente ativas, ou seja, que estavam ocupadas ou desocupadas na semana de referência do Censo e o total de pessoas nesta faixa etária multiplicado por 100. Considera-se desocupada a pessoa que, não estando ocupada na semana de referência, havia procurado trabalho no mês anterior a essa pesquisa.

# (!) T_ATIV18M - Taxa de atividade das pessoas de 18 anos ou mais de idade
# Razão entre as pessoas de 18 anos ou mais de idade que eram economicamente ativas, ou seja, que estavam ocupadas ou desocupadas na semana de referência do Censo e o total de pessoas nesta faixa etária multiplicado por 100. Considera-se desocupada a pessoa que, não estando ocupada na semana de referência, havia procurado trabalho no mês anterior a essa pesquisa.

# T_ATIV2529 - Taxa de atividade das pessoas de 25 a 29 anos de idade
# Razão entre as pessoas de 25 a 29 anos de idade que eram economicamente ativas, ou seja, que estavam ocupadas ou desocupadas na semana de referência do Censo e o total de pessoas nesta faixa etária multiplicado por 100. Considera-se desocupada a pessoa que, não estando ocupada na semana de referência, havia procurado trabalho no mês anterior a essa pesquisa.

# T_DES1517 - Taxa de desocupação da população de 15 a 17 anos de idade
# Percentual da população economicamente ativa (PEA) nessa faixa etária que estava desocupada, ou seja, que não estava ocupada na semana anterior à data do Censo mas havia procurado trabalho ao longo do mês anterior à data dessa pesquisa.

# T_DES1824 - Taxa de desocupação da população de 18 a 24 anos de idade
# Percentual da população economicamente ativa (PEA) nessa faixa etária que estava desocupada, ou seja, que não estava ocupada na semana anterior à data do Censo mas havia procurado trabalho ao longo do mês anterior à data dessa pesquisa.

# (!) T_DES18M - Taxa de desocupação da população de 18 anos ou mais de idade
# Percentual da população economicamente ativa (PEA) nessa faixa etária que estava desocupada, ou seja, que não estava ocupada na semana anterior à data do Censo mas havia procurado trabalho ao longo do mês anterior à data dessa pesquisa.

# T_DES2529 - Taxa de desocupação da população de 25 a 29 anos de idade
# Percentual da população economicamente ativa (PEA) nessa faixa etária que estava desocupada, ou seja, que não estava ocupada na semana anterior à data do Censo mas havia procurado trabalho ao longo do mês anterior à data dessa pesquisa.

# THEILtrab - Índice de Theil-L dos rendimentos do trabalho - 18 anos ou mais
# Mede a desigualdade na distribuição de indivíduos de 18 anos ou mais de idade ocupados, segundo o rendimento de todos os trabalhos, excluídos aqueles sem rendimento do trabalho.É o logaritmo da razão entre as médias aritmética e geométrica do rendimento dos indivíduos, sendo nulo quando não existir desigualdade de renda entre eles e tendente ao infinito quando a desigualdade tender ao máximo.

# State - Raw Data
state_raw <- read_excel("./data/atlas2013_dadosbrutos_pt.xlsx", sheet = "UF 91-00-10")

##############################################################################################
# 1991's Census

state.1991 <- state_raw[state_raw$ANO == "1991", ]

# state.1991.NORTE <- state.1991[state.1991$UF < 20, ]
# state.1991.NORDESTE <- state.1991[state.1991$UF >= 20 & state.1991$UF < 30, ]
# state.1991.SUDESTE <- state.1991[state.1991$UF >= 30 & state.1991$UF < 40, ]
# state.1991.SUL <- state.1991[state.1991$UF >= 40 & state.1991$UF < 50, ]
# state.1991.CENTRO_OESTE <- state.1991[state.1991$UF >= 50, ]

##############################################################################################
# 2000's Census

state.2000 <- state_raw[state_raw$ANO == "2000", ]

# state.2000.NORTE <- state.2000[state.2000$UF < 20, ]
# state.2000.NORDESTE <- state.2000[state.2000$UF >= 20 & state.2000$UF < 30, ]
# state.2000.SUDESTE <- state.2000[state.2000$UF >= 30 & state.2000$UF < 40, ]
# state.2000.SUL <- state.2000[state.2000$UF >= 40 & state.2000$UF < 50, ]
# state.2000.CENTRO_OESTE <- state.2000[state.2000$UF >= 50, ]

##############################################################################################
# 2010's Census

state.2010 <- state_raw[state_raw$ANO == "2010", ]

# state.2010.NORTE <- state.2010[state.2010$UF < 20, ]
# state.2010.NORDESTE <- state.2010[state.2010$UF >= 20 & state.2010$UF < 30, ]
# state.2010.SUDESTE <- state.2010[state.2010$UF >= 30 & state.2010$UF < 40, ]
# state.2010.SUL <- state.2010[state.2010$UF >= 40 & state.2010$UF < 50, ]
# state.2010.CENTRO_OESTE <- state.2010[state.2010$UF >= 50, ]


##############################################################################################
############## HEAT MAPs for each indicator, by Region

# Geographical Data

# Brazil
brazil <- readOGR("data/brasil/UFEBRASIL.shp")

###########################################################
# Esperança de vida ao nascer - ESPVIDA

colors <- colorRampPalette(c("deeppink", "green4"))

title <- expression(bold("Esperança Média de Vida ao Nascer por Estados (anos de vida)"))

brazil$ESPVIDA.1991 <- state.1991$ESPVIDA
brazil$ESPVIDA.2000 <- state.2000$ESPVIDA
brazil$ESPVIDA.2010 <- state.2010$ESPVIDA

spplot(brazil,
       c("ESPVIDA.1991", "ESPVIDA.2000", "ESPVIDA.2010"),
       col.regions=colors(max(state_raw$ESPVIDA)),
       main=title)

###########################################################
# Taxa de envelhecimento - T_ENV

title <- expression(bold("Taxa de Envelhecimento Média por Estado (%)"))

brazil$T_ENV.1991 <- state.1991$T_ENV
brazil$T_ENV.2000 <- state.2000$T_ENV
brazil$T_ENV.2010 <- state.2010$T_ENV

spplot(brazil,
       c("T_ENV.1991", "T_ENV.2000", "T_ENV.2010"),
       main=title)

###########################################################
# Razão de dependência - RAZDEP

title <- expression(bold("Taxa de Envelhecimento Média por Estado (%)"))

brazil$T_ENV.1991 <- state.1991$T_ENV
brazil$T_ENV.2000 <- state.2000$T_ENV
brazil$T_ENV.2010 <- state.2010$T_ENV

spplot(brazil,
       c("T_ENV.1991", "T_ENV.2000", "T_ENV.2010"),
       main=title)

###########################################################
# Renda per Capita Média - RDPC

colors <- colorRampPalette(c("white", "blue4"))

title <- expression(paste("Renda ", italic("per capta"), " Média"))

brazil$RDPC.1991 <- state.1991$RDPC
brazil$RDPC.2000 <- state.2000$RDPC
brazil$RDPC.2010 <- state.2010$RDPC

spplot(brazil,
       c("RDPC.1991", "RDPC.2000", "RDPC.2010"),
       col.regions=colors(max(state_raw$RDPC)),
       main=title,
       scales = list(draw = FALSE))

###########################################################
# E_ANOSESTUDO - Expectativa de anos de estudo

title <- expression(bold("Expectativa de anos de estudo"))

brazil$E_ANOESTUDO.1991 <- state.1991$E_ANOSESTUDO
brazil$E_ANOESTUDO.2000 <- state.2000$E_ANOSESTUDO
brazil$E_ANOESTUDO.2010 <- state.2010$E_ANOSESTUDO

spplot(brazil,
       c("E_ANOESTUDO.1991", "E_ANOESTUDO.2000", "E_ANOESTUDO.2010"),
       main=title)

###########################################################
# GINI - Índice de Gini

title <- expression(bold("Índice de Gini"))

brazil$GINI.1991 <- state.1991$GINI
brazil$GINI.2000 <- state.2000$GINI
brazil$GINI.2010 <- state.2010$GINI

spplot(brazil,
       c("GINI.1991", "GINI.2000", "GINI.2010"),
       main=title)

###########################################################
# T_FUND18M - Percentual da população de 18 anos ou mais com fundamental completo
# T_MED18M - Percentual da população de 18 anos ou mais com ensino médio completo
# T_SUPER25M - Percentual da população de 25 anos ou mais com superior completo

title <- expression(bold("Percentual da População de 18 anos ou mais com Ensino Fundamental Completo"))

brazil$T_FUND18M.1991 <- state.1991$T_FUND18M
brazil$T_FUND18M.2000 <- state.2000$T_FUND18M
brazil$T_FUND18M.2010 <- state.2010$T_FUND18M

spplot(brazil,
       c("T_FUND18M.1991", "T_FUND18M.2000", "T_FUND18M.2010"),
       main=title)

title <- expression(bold("Percentual da População de 18 anos ou mais com Ensino Médio Completo"))

brazil$T_MED18M.1991 <- state.1991$T_MED18M
brazil$T_MED18M.2000 <- state.2000$T_MED18M
brazil$T_MED18M.2010 <- state.2010$T_MED18M

spplot(brazil,
       c("T_MED18M.1991", "T_MED18M.2000", "T_MED18M.2010"),
       main=title)

title <- expression(bold("Percentual da População de 25 anos ou mais com Ensino Superior Completo"))

brazil$T_SUPER25M.1991 <- state.1991$T_SUPER25M
brazil$T_SUPER25M.2000 <- state.2000$T_SUPER25M
brazil$T_SUPER25M.2010 <- state.2010$T_SUPER25M

spplot(brazil,
       c("T_SUPER25M.1991", "T_SUPER25M.2000", "T_SUPER25M.2010"),
       main=title)

###########################################################
# T_ANALF18M - Taxa de analfabetismo da população de 18 anos ou mais de idade

title <- expression(bold("Taxa de Analfabetismo da População de 18 anos ou mais de Idade"))

brazil$T_ANALF18M.1991 <- state.1991$T_ANALF18M
brazil$T_ANALF18M.2000 <- state.2000$T_ANALF18M
brazil$T_ANALF18M.2010 <- state.2010$T_ANALF18M

spplot(brazil,
       c("T_ANALF18M.1991", "T_ANALF18M.2000", "T_ANALF18M.2010"),
       main=title)

###########################################################
# HOMEMTOT - População residente masculina
# MULHERTOT - População residente feminina

colors_masc <- colorRampPalette(c("white", "blue4"))
colors_femin <- colorRampPalette(c("white", "violetred2"))

title_masc <- expression(paste("Percentual da População Masculina em Relação à População Total"))
title_femin <- expression(paste("Percentual da População Feminina em Relação à População Total"))

brazil$HOMEMTOT.1991 <- state.1991$HOMEMTOT
brazil$HOMEMTOT.2000 <- state.2000$HOMEMTOT
brazil$HOMEMTOT.2010 <- state.2010$HOMEMTOT

brazil$MULHERTOT.1991 <- state.1991$MULHERTOT
brazil$MULHERTOT.2000 <- state.2000$MULHERTOT
brazil$MULHERTOT.2010 <- state.2010$MULHERTOT

brazil$POPTOT.1991 = (brazil$HOMEMTOT.1991 + brazil$MULHERTOT.1991)
brazil$POPTOT.2000 = (brazil$HOMEMTOT.2000 + brazil$MULHERTOT.2000)
brazil$POPTOT.2010 = (brazil$HOMEMTOT.2010 + brazil$MULHERTOT.2010)

# Heatmap plot
brazil$T_POPMASC.1991 <- brazil$HOMEMTOT.1991 / brazil$POPTOT.1991 * 100
brazil$T_POPMASC.2000 <- brazil$HOMEMTOT.2000 / brazil$POPTOT.2000 * 100
brazil$T_POPMASC.2010 <- brazil$HOMEMTOT.2010 / brazil$POPTOT.2010 * 100

brazil$T_POPFEMIN.1991 <- brazil$MULHERTOT.1991 / brazil$POPTOT.1991 * 100
brazil$T_POPFEMIN.2000 <- brazil$MULHERTOT.2000 / brazil$POPTOT.2000 * 100
brazil$T_POPFEMIN.2010 <- brazil$MULHERTOT.2010 / brazil$POPTOT.2010 * 100

spplot(brazil,
       c("T_POPMASC.1991", "T_POPMASC.2000", "T_POPMASC.2010"),
       col.regions=colors_masc(max(state_raw$RDPC)),
       main=title_masc)

spplot(brazil,
       c("T_POPFEMIN.1991", "T_POPFEMIN.2000", "T_POPFEMIN.2010"),
       col.regions=colors_femin(max(state_raw$RDPC)),
       main=title_femin)

# Pie Chart
populational_data <- data.frame(year = c("1991", "1991", "2000", "2000", "2010", "2010"),
                                gender = c("Masculino", "Feminino", "Masculino", "Feminino", "Masculino", "Feminino"),
                                rate = c(sum(brazil$HOMEMTOT.1991) / sum(brazil$POPTOT.1991),
                                         sum(brazil$MULHERTOT.1991) / sum(brazil$POPTOT.1991),
                                         sum(brazil$HOMEMTOT.2000) / sum(brazil$POPTOT.2000),
                                         sum(brazil$MULHERTOT.2000) / sum(brazil$POPTOT.2000),
                                         sum(brazil$HOMEMTOT.2010) / sum(brazil$POPTOT.2010),
                                         sum(brazil$MULHERTOT.2010) / sum(brazil$POPTOT.2010)))

ggplot(data=populational_data,
       aes(x=" ", y=rate, fill=factor(gender))) +
geom_bar(stat= "identity") +
geom_text(aes(label = round(rate, digits = 4)*100), position = position_stack(vjust = 0.5)) +
facet_grid(facets = . ~ year) +
  coord_polar(theta = "y") +
  ggtitle(label = "Proporção da População por Gênero") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("") + ylab("") + labs(fill = "Gênero")

# PESOTOT - População total
title <- expression(bold("População Total por Estado"))

brazil$PESOTOT.1991 <- state.1991$pesotot
brazil$PESOTOT.2000 <- state.2000$pesotot
brazil$PESOTOT.2010 <- state.2010$pesotot

spplot(brazil,
       c("PESOTOT.1991", "PESOTOT.2000", "PESOTOT.2010"),
       main=title)

###########################################################
# RENOCUP - Rendimento médio dos ocupados - 18 anos ou mais
# Data available only in 2010's census

title <- expression(bold("Rendimento Médio dos Ocupados em 2010"))

brazil$RENOCUP.2010 <- state.2010$RENOCUP

spplot(brazil,
       "RENOCUP.2010",
       main=title)

###########################################################
# PEA18M - PEA (18 anos ou mais)
# CUSTOM_PEA18M = PEA18M / PESO18

title <- expression(bold("Relação entre a PEA e a População Residente Total com mais de 18 Anos"))

# brazil$PEA18M.1991 <- state.1991$PEA18M
brazil$CUSTOM_PEA18M.2000 <- state.2000$PEA18M / state.2000$PESO18
brazil$CUSTOM_PEA18M.2010 <- state.2010$PEA18M / state.2010$PESO18

spplot(brazil,
       c("CUSTOM_PEA18M.2000", "CUSTOM_PEA18M.2010"),
       main=title)

###########################################################
# T_ATIV18M - Taxa de atividade das pessoas de 18 anos ou mais de idade

title <- expression(bold("Taxa de Atividade das Pessoas de 18 Anos ou mais de Idade"))

# brazil$T_ATIV18M.1991 <- state.1991$T_ATIV18M
brazil$T_ATIV18M.2000 <- state.2000$T_ATIV18M
brazil$T_ATIV18M.2010 <- state.2010$T_ATIV18M

spplot(brazil,
       c("T_ATIV18M.2000", "T_ATIV18M.2010"),
       main=title)

###########################################################
# T_DES18M - Taxa de desocupação da população de 18 anos ou mais de idade

title <- expression(bold("Taxa de Desocupação da População de 18 Anos ou mais de Idade"))

# brazil$T_DES18M.1991 <- state.1991$T_DES18M
brazil$T_DES18M.2000 <- state.2000$T_DES18M
brazil$T_DES18M.2010 <- state.2010$T_DES18M

spplot(brazil,
       c("T_DES18M.2000", "T_DES18M.2010"),
       main=title)

###########################################################
# IDHM -Índice de Desenvolvimento Humano Municipal
# IDHM_E - Índice de Desenvolvimento Humano Municipal - Dimensão Educação
# IDHM_L - Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade
# IDHM_R - IDHM Renda

title <- expression(bold("Índice de Desenvolvimento Humano Municipal"))

brazil$IDHM.1991 <- state.1991$IDHM
brazil$IDHM.2000 <- state.2000$IDHM
brazil$IDHM.2010 <- state.2010$IDHM

spplot(brazil,
       c("IDHM.1991", "IDHM.2000", "IDHM.2010"),
       main=title)

title <- expression(bold("Índice de Desenvolvimento Humano Municipal - Dimensão Educação"))

brazil$IDHM_E.1991 <- state.1991$IDHM_E
brazil$IDHM_E.2000 <- state.2000$IDHM_E
brazil$IDHM_E.2010 <- state.2010$IDHM_E

spplot(brazil,
       c("IDHM_E.1991", "IDHM_E.2000", "IDHM_E.2010"),
       main=title)

title <- expression(bold("Índice de Desenvolvimento Humano Municipal - Dimensão Longevidade"))

brazil$IDHM_L.1991 <- state.1991$IDHM_L
brazil$IDHM_L.2000 <- state.2000$IDHM_L
brazil$IDHM_L.2010 <- state.2010$IDHM_L

spplot(brazil,
       c("IDHM_L.1991", "IDHM_L.2000", "IDHM_L.2010"),
       main=title)

title <- expression(bold("Índice de Desenvolvimento Humano Municipal - Dimensão Renda"))

brazil$IDHM_R.1991 <- state.1991$IDHM_R
brazil$IDHM_R.2000 <- state.2000$IDHM_R
brazil$IDHM_R.2010 <- state.2010$IDHM_R
#
# spplot(brazil,
#        c("IDHM_R.1991", "IDHM_R.2000", "IDHM_R.2010"),
#        main=title)

####################################################################################################################
# norte <- subset(brazil, NM_ESTADO == "RONDÃ”NIA" | NM_ESTADO == "ACRE"
#                 | NM_ESTADO == "AMAZONAS" | NM_ESTADO == "RORAIMA"
#                 | NM_ESTADO == "PARÃ\u0081" | NM_ESTADO == "AMAPÃ\u0081"
#                 | NM_ESTADO == "TOCANTINS")
# 
# nordeste <- subset(brazil, NM_ESTADO == "MARANHÃƒO" | NM_ESTADO == "PIAUÃ\u008d"
#                    | NM_ESTADO == "CEARÃ\u0081" | NM_ESTADO == "RIO GRANDE DO NORTE"
#                    | NM_ESTADO == "PARAÃ\u008dBA" | NM_ESTADO == "PERNAMBUCO"
#                    | NM_ESTADO == "ALAGOAS" | NM_ESTADO == "SERGIPE" | NM_ESTADO == "BAHIA")
# 
# sudeste <- subset(brazil, NM_ESTADO == "MINAS GERAIS" | NM_ESTADO == "ESPIRITO SANTO"
#                   | NM_ESTADO == "RIO DE JANEIRO" | NM_ESTADO == "SÃƒO PAULO")
# 
# sul <- subset(brazil, NM_ESTADO == "PARANÃ\u0081" | NM_ESTADO == "SANTA CATARINA" | NM_ESTADO == "RIO GRANDE DO SUL")
# 
# centro_oeste <- subset(brazil, NM_ESTADO == "MATO GROSSO DO SUL" | NM_ESTADO == "MATO GROSSO"
#                        | NM_ESTADO == "GOIÃ\u0081S" | NM_ESTADO == "DISTRITO FEDERAL" )