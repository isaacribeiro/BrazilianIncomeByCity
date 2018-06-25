# Required Libraries
library(readxl)
library(plotly)
library(MASS) #optional: Linear regression stepwise algorithm

# Variables
# census_vars <- read_excel("data/atlas2013_dadosbrutos_pt.xlsx", sheet = "Siglas")

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
# counties.1991 <- raw_data[raw_data$ANO == "1991", ]

# 2000's Census
# counties.2000 <- raw_data[raw_data$ANO == "2000", ]

# 2010's Census
counties.2010 <- raw_data[raw_data$ANO == "2010", ]

#### Multiple Regression will be created based on latest data --> 2010's census

# Check Normality of Explanatory Vars
hist(counties.2010$E_ANOSESTUDO)
hist(counties.2010$ESPVIDA)
hist(counties.2010$T_ANALF18M)
hist(counties.2010$T_FUND18M)
hist(counties.2010$T_MED18M)
hist(counties.2010$T_SUPER25M)
hist(counties.2010$GINI)
hist(counties.2010$IDHM)
# hist(counties.2010$RENOCUP)   --> Available only for State level data
# hist(counties.2010$PEA18M)    --> Available only for State level data
# hist(counties.2010$T_ATIV18M) --> Available only for State level data

# Correlation between relevant variables
plot(counties.2010$E_ANOSESTUDO, counties.2010$RDPC)
cor(counties.2010$E_ANOSESTUDO, counties.2010$RDPC) #0.5124129

plot(counties.2010$ESPVIDA, counties.2010$RDPC)
cor(counties.2010$ESPVIDA, counties.2010$RDPC) #0.7841763

plot(counties.2010$T_ANALF18M, counties.2010$RDPC)
cor(counties.2010$T_ANALF18M, counties.2010$RDPC) #-0.8175425

plot(counties.2010$T_MED18M, counties.2010$RDPC)
cor(counties.2010$T_MED18M, counties.2010$RDPC) #0.7453527

plot(counties.2010$T_SUPER25M, counties.2010$RDPC)
cor(counties.2010$T_SUPER25M, counties.2010$RDPC) #0.7754382

plot(counties.2010$GINI, counties.2010$RDPC)
cor(counties.2010$GINI, counties.2010$RDPC) #-0.2735242

plot(counties.2010$IDHM, counties.2010$RDPC)
cor(counties.2010$IDHM, counties.2010$RDPC) #0.9079875

# Linear Regression
# Useful link https://www.statmethods.net/stats/regression.html

### 1st Try

fit1 = lm(counties.2010$RDPC~ counties.2010$E_ANOSESTUDO +
                              counties.2010$ESPVIDA +
                              counties.2010$T_ANALF18M +
                              counties.2010$T_FUND18M +
                              counties.2010$T_MED18M +
                              counties.2010$T_SUPER25M +
                              counties.2010$GINI +
                              counties.2010$IDHM )

summary(fit1)

# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                -938.3221    62.8145 -14.938  < 2e-16 ***
#   counties.2010$E_ANOSESTUDO  -30.1754     1.5219 -19.827  < 2e-16 ***
#   counties.2010$ESPVIDA       -13.2722     0.9587 -13.843  < 2e-16 ***
#   counties.2010$T_ANALF18M     -1.6458     0.2517  -6.539 6.74e-11 ***
#   counties.2010$T_FUND18M      -4.3617     0.4537  -9.615  < 2e-16 ***
#   counties.2010$T_MED18M       -6.7000     0.5668 -11.820  < 2e-16 ***
#   counties.2010$T_SUPER25M     23.0936     0.6779  34.064  < 2e-16 ***
#   counties.2010$GINI          371.6844    20.7631  17.901  < 2e-16 ***
#   counties.2010$IDHM         4163.4084    70.4829  59.070  < 2e-16 ***

### 2nd Try

fit2 = lm(counties.2010$RDPC~ counties.2010$E_ANOSESTUDO +
                              counties.2010$ESPVIDA +
                              counties.2010$T_FUND18M +
                              counties.2010$T_MED18M +
                              counties.2010$T_SUPER25M +
                              counties.2010$GINI +
                              counties.2010$IDHM )

summary(fit2)

# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                -1171.8166    51.8727 -22.590  < 2e-16 ***
#   counties.2010$E_ANOSESTUDO   -31.9609     1.5028 -21.267  < 2e-16 ***
#   counties.2010$ESPVIDA        -12.0721     0.9445 -12.781  < 2e-16 ***
#   counties.2010$T_FUND18M       -3.5632     0.4385  -8.125 5.47e-16 ***
#   counties.2010$T_MED18M        -7.6390     0.5504 -13.879  < 2e-16 ***
#   counties.2010$T_SUPER25M      22.8136     0.6791  33.593  < 2e-16 ***
#   counties.2010$GINI           365.1974    20.8172  17.543  < 2e-16 ***
#   counties.2010$IDHM          4361.1427    63.9059  68.243  < 2e-16 ***

## 3rd Try

fit3 = lm(counties.2010$RDPC~ counties.2010$E_ANOSESTUDO +
            counties.2010$ESPVIDA +
            counties.2010$T_FUND18M +
            counties.2010$T_MED18M +
            counties.2010$T_SUPER25M +
            counties.2010$GINI +
            counties.2010$IDHM)

summary(fit3)

# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                -1171.8166    51.8727 -22.590  < 2e-16 ***
#   counties.2010$E_ANOSESTUDO   -31.9609     1.5028 -21.267  < 2e-16 ***
#   counties.2010$ESPVIDA        -12.0721     0.9445 -12.781  < 2e-16 ***
#   counties.2010$T_FUND18M       -3.5632     0.4385  -8.125 5.47e-16 ***
#   counties.2010$T_MED18M        -7.6390     0.5504 -13.879  < 2e-16 ***
#   counties.2010$T_SUPER25M      22.8136     0.6791  33.593  < 2e-16 ***
#   counties.2010$GINI           365.1974    20.8172  17.543  < 2e-16 ***
#   counties.2010$IDHM          4361.1427    63.9059  68.243  < 2e-16 ***

#################################################################################
# Other useful functions 
coefficients(fit3)

# Confidence Interval
confint(fit3) #level=0.95

# 2.5 %       97.5 %
#   (Intercept)                -1273.507370 -1070.125883
# counties.2010$E_ANOSESTUDO   -34.907029   -29.014754
# counties.2010$ESPVIDA        -13.923735   -10.220383
# counties.2010$T_FUND18M       -4.422873    -2.703438
# counties.2010$T_MED18M        -8.718007    -6.559966
# counties.2010$T_SUPER25M      21.482217    24.144923
# counties.2010$GINI           324.387646   406.007185
# counties.2010$IDHM          4235.862155  4486.423317

fitted(fit3) # predicted values
residuals(fit3) # residuals
anova(fit3) # anova table 
vcov(fit3) # covariance matrix for model parameters 
influence(fit3) # regression diagnostics

step <- stepAIC(fit3, direction = "both")

step$anova

# diagnostic plots 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit3)

# Residual Factors
plot(fitted(fit3), residuals(fit3), xlab="Valores Ajustados", ylab="Resíduos")
abline(h=0)

plot(counties.2010$E_ANOSESTUDO, residuals(fit3), xlab="Anos de Estudo", ylab="Resíduos")
abline(h=0)

plot(counties.2010$ESPVIDA, residuals(fi3t), xlab="Expectativa de Vida", ylab="Resíduos")
abline(h=0)

plot(counties.2010$GINI, residuals(fit3), xlab="Índice de Gini", ylab="Resíduos")
abline(h=0)

plot(counties.2010$IDHM, residuals(fit3), xlab="IDHM", ylab="Resíduos")
abline(h=0)

# Homoscedasticity test: Property of having equal Statistical Variance
RDPC.median <- median(counties.2010$ESPVIDA)
var.test(residuals(fit3)[counties.2010$ESPVIDA>RDPC.median], residuals(fit3)[counties.2010$ESPVIDA<RDPC.median])

regression.result <- data.frame(counties.2010$UF,counties.2010$Município,counties.2010$RDPC, fitted(fit3))

random_selection <- sample(1:5565, 100)

plot_ly(regression.result, x=1:100, y = ~counties.2010.RDPC[random_selection], name="Real", type="scatter", mode="lines+markers") %>%
                          add_trace(y = ~fitted.fit3.[random_selection], name="Estimado", type="scatter", mode="lines+markers") %>%
layout(title = "RDPC Real X RDPC Estimado para uma amostra aleatória de 100 Cidades",
       xaxis = list(title="Cidades"),
       yaxis = list(title="RDPC"))
