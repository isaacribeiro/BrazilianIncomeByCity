# Required Libraries
library(readxl)
library(plotly)
library(MASS) #optional: Linear regression stepwise algorithm

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
# counties.1991 <- raw_data[raw_data$ANO == "1991", ]

# 2000's Census
# counties.2000 <- raw_data[raw_data$ANO == "2000", ]

# 2010's Census
counties.2010 <- raw_data[raw_data$ANO == "2010", ]

#### Multiple Regression will be created based on latest data --> 2010's census

# # Check Normality of Explanatory Vars
hist(counties.2010$E_ANOSESTUDO, xlab = NULL, main = "Histograma - Anos de Estudo")
hist(counties.2010$ESPVIDA, xlab = NULL, main = "Histograma - Esperança de Vida")
hist(counties.2010$T_ANALF18M, xlab = NULL, main = "Histograma - Taxa de Analfabetismo")
hist(counties.2010$T_FUND18M, xlab = NULL, main = "Histograma - População com Ensino Fundamental Completo")
hist(counties.2010$T_MED18M, xlab = NULL, main = "Histograma - População com Ensino Médio Completo")
hist(counties.2010$T_SUPER25M, xlab = NULL, main = "Histograma - População com Ensino Superio Completo")
hist(counties.2010$GINI, xlab = NULL, main = "Histograma - Índice de GINI")
hist(counties.2010$IDHM, xlab = NULL, main = "Histograma - IDHM")
# # hist(counties.2010$RENOCUP)   --> Available only for State level data
# # hist(counties.2010$PEA18M)    --> Available only for State level data
# # hist(counties.2010$T_ATIV18M) --> Available only for State level data

# Correlation between relevant variables
plot(counties.2010$E_ANOSESTUDO, counties.2010$RDPC, main = "Anos de Estudo X RDPC", xlab = "Anos", ylab = "Reais")
cor(counties.2010$E_ANOSESTUDO, counties.2010$RDPC) #0.5124129

plot(counties.2010$ESPVIDA, counties.2010$RDPC, main = "Esperança de Vida X RDPC", xlab = "Anos", ylab = "Reais")
cor(counties.2010$ESPVIDA, counties.2010$RDPC) #0.7841763

plot(counties.2010$T_ANALF18M, counties.2010$RDPC, main = "Taxa de Analfabetismo X RDPC", xlab = "", ylab = "Reais")
cor(counties.2010$T_ANALF18M, counties.2010$RDPC) #-0.8175425

plot(counties.2010$T_FUND18M, counties.2010$RDPC, main = "População com Ensino Fundamental Completo X RDPC", xlab = "", ylab = "Reais")
cor(counties.2010$T_FUND18M, counties.2010$RDPC) #0.756784

plot(counties.2010$T_MED18M, counties.2010$RDPC, main = "População com Ensino Médio Completo X RDPC", xlab = "", ylab = "Reais")
cor(counties.2010$T_MED18M, counties.2010$RDPC) #0.7453527

plot(counties.2010$T_SUPER25M, counties.2010$RDPC, main = "População com Ensino Superior Completo X RDPC", xlab = "", ylab = "Reais")
cor(counties.2010$T_SUPER25M, counties.2010$RDPC) #0.7754382

plot(counties.2010$GINI, counties.2010$RDPC, main = "GINI X RDPC", xlab = "", ylab = "Reais")
cor(counties.2010$GINI, counties.2010$RDPC) #-0.2735242

plot(counties.2010$IDHM, counties.2010$RDPC, main = "IDHM X RDPC", xlab = "", ylab = "Reais")
cor(counties.2010$IDHM, counties.2010$RDPC) #0.9079875

# Linear Regression
# Useful link https://www.statmethods.net/stats/regression.html

### 1st Try
# Linear Regression
fit_1 = lm(counties.2010$RDPC ~ counties.2010$T_ANALF18M +
                              counties.2010$T_FUND18M +
                              counties.2010$T_MED18M +
                              counties.2010$T_SUPER25M +
                              counties.2010$IDHM )

summary(fit_1)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -260.03  -57.31   -8.34   43.43  694.12 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)              -1220.6743    32.6881 -37.343  < 2e-16 ***
#   counties.2010$T_ANALF18M    -1.9427     0.2551  -7.617 3.04e-14 ***
#   counties.2010$T_FUND18M     -1.5785     0.4731  -3.337 0.000854 ***
#   counties.2010$T_MED18M      -6.9713     0.6004 -11.612  < 2e-16 ***
#   counties.2010$T_SUPER25M    27.7428     0.6818  40.693  < 2e-16 ***
#   counties.2010$IDHM        2777.4231    48.4277  57.352  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 88.77 on 5559 degrees of freedom
# Multiple R-squared:  0.867,	Adjusted R-squared:  0.8668 
# F-statistic:  7246 on 5 and 5559 DF,  p-value: < 2.2e-16

plot(fit_1)

### 2nd Try --> Coefficient for counties.2010$T_ANALF18M is -1.6458... Low significance

fit_2 = lm(counties.2010$RDPC ~ poly(counties.2010$T_ANALF18M, degree=4, raw=FALSE) +
             poly(counties.2010$T_FUND18M, degree=3, raw=FALSE) +
             poly(counties.2010$T_MED18M, degree=2, raw=FALSE) +
             poly(counties.2010$T_SUPER25M, degree=2, raw=FALSE) +
             poly(counties.2010$IDHM, degree=2, raw=FALSE ))

summary(fit_2)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -315.52  -38.46   -4.69   32.44  619.33 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                                                493.6056     0.9007 548.054  < 2e-16 ***
#   poly(counties.2010$T_ANALF18M, degree = 4, raw = FALSE)1 -3409.6958   162.6161 -20.968  < 2e-16 ***
#   poly(counties.2010$T_ANALF18M, degree = 4, raw = FALSE)2  1318.2182    98.5419  13.377  < 2e-16 ***
#   poly(counties.2010$T_ANALF18M, degree = 4, raw = FALSE)3  -611.3481    76.4343  -7.998 1.52e-15 ***
#   poly(counties.2010$T_ANALF18M, degree = 4, raw = FALSE)4   361.8017    69.6593   5.194 2.13e-07 ***
#   poly(counties.2010$T_FUND18M, degree = 3, raw = FALSE)1  -1533.0078   297.5249  -5.153 2.66e-07 ***
#   poly(counties.2010$T_FUND18M, degree = 3, raw = FALSE)2   1542.4938   214.1675   7.202 6.71e-13 ***
#   poly(counties.2010$T_FUND18M, degree = 3, raw = FALSE)3    614.6031    98.8354   6.218 5.39e-10 ***
#   poly(counties.2010$T_MED18M, degree = 2, raw = FALSE)1   -5087.1646   317.6598 -16.015  < 2e-16 ***
#   poly(counties.2010$T_MED18M, degree = 2, raw = FALSE)2   -1907.3133   228.8990  -8.333  < 2e-16 ***
#   poly(counties.2010$T_SUPER25M, degree = 2, raw = FALSE)1  4138.9260   145.1820  28.509  < 2e-16 ***
#   poly(counties.2010$T_SUPER25M, degree = 2, raw = FALSE)2  1716.9567   111.3741  15.416  < 2e-16 ***
#   poly(counties.2010$IDHM, degree = 2, raw = FALSE)1       16065.1856   219.8741  73.065  < 2e-16 ***
#   poly(counties.2010$IDHM, degree = 2, raw = FALSE)2        3110.4503   121.6637  25.566  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 67.19 on 5551 degrees of freedom
# Multiple R-squared:  0.9239,	Adjusted R-squared:  0.9237 
# F-statistic:  5184 on 13 and 5551 DF,  p-value: < 2.2e-16

plot(fit_2)
hist(fitted(fit_2), main = "Distribuição dos Valores Previstos", xlab = NULL)

regression.result <- data.frame(counties.2010$UF,counties.2010$Município,counties.2010$RDPC, fitted(fit_2))

random_selection <- sample(1:5565, 100)

plot_ly(regression.result, x=1:100, y = ~counties.2010.RDPC[random_selection], name="Real", type="scatter", mode="lines+markers") %>%
  add_trace(y = ~fitted.fit_2.[random_selection], name="Estimado", type="scatter", mode="lines+markers") %>%
  layout(title = "RDPC Real X RDPC Estimado para uma amostra aleatória de 100 Cidades",
         xaxis = list(title="Cidades"),
         yaxis = list(title="RDPC"))

## 4rd Try - Third Model has some high p-values
# Apply an automated variable selection stepwise algorithm and selects the five more relevant ones.

fit_reference = lm(RDPC~ 1, data=counties.2010)
varSelection <- (RDCP ~ ESPVIDA + FECTOT + MORT1 + MORT5 + RAZDEP + SOBRE40 + SOBRE60 + T_ENV + E_ANOSESTUDO + T_ATRASO_0_FUND + T_ATRASO_0_MED + T_ATRASO_1_BASICO + T_ATRASO_1_MED + T_ATRASO_2_BASICO + T_ATRASO_2_FUND + T_ATRASO_2_MED + T_FREQ0A3 + T_FREQ11A14 + T_FREQ15A17 + T_FREQ18A24 + T_FREQ25A29 +T_FUND18M + T_MED18M + T_SUPER25M + GINI + PIND + P_FORMAL + IDHM)
fit_4 <- step(fit_reference, direction="both", scope=formula(varSelection), steps = 5)
summary(fit_4) 

fit_reference = lm(RDPC~ 1, data=counties.2010)
varSelection <- (RDCP ~ ESPVIDA + FECTOT + MORT1 + MORT5 + RAZDEP + SOBRE40 + SOBRE60 + T_ENV + E_ANOSESTUDO + T_ATRASO_0_FUND + T_ATRASO_0_MED + T_ATRASO_1_BASICO + T_ATRASO_1_MED + T_ATRASO_2_BASICO + T_ATRASO_2_FUND + T_ATRASO_2_MED + T_FREQ0A3 + T_FREQ11A14 + T_FREQ15A17 + T_FREQ18A24 + T_FREQ25A29 +T_FUND18M + T_MED18M + T_SUPER25M + GINI + PIND + P_FORMAL + IDHM)
fit_4 <- step(fit_reference, direction="both", scope=formula(varSelection), steps = 7)
summary(fit_4)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -287.07  -49.75   -8.23   37.33  644.31 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)       -2593.5740    42.0528  -61.67   <2e-16 ***
#   IDHM               4584.0813    60.0058   76.39   <2e-16 ***
#   T_SUPER25M           25.5744     0.6290   40.66   <2e-16 ***
#   T_MED18M            -12.5687     0.3189  -39.41   <2e-16 ***
#   T_ATRASO_2_BASICO     6.7855     0.2174   31.21   <2e-16 ***
#   MORT1                 4.8445     0.3101   15.62   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 81.79 on 5559 degrees of freedom
# Multiple R-squared:  0.8871,	Adjusted R-squared:  0.887 
# F-statistic:  8732 on 5 and 5559 DF,  p-value: < 2.2e-16

# Convert automated explanatory vars selection in a polynomial regression

fit_4_quad = lm(RDPC ~ poly(IDHM, degree=2, raw=FALSE) +
                       poly(T_SUPER25M, degree=2, raw=FALSE) +
                       poly(T_MED18M, degree=2, raw=FALSE) +
                       poly(T_ATRASO_2_BASICO, degree=2, raw=FALSE) +
                       poly(MORT1, degree=2, raw=FALSE), data = counties.2010)

summary(fit_4_quad)

fit_4_quad = lm(RDPC ~ poly(IDHM, degree=2, raw=FALSE) +
                  poly(T_SUPER25M, degree=2, raw=FALSE) +
                  poly(T_MED18M, degree=1, raw=FALSE) +
                  poly(T_ATRASO_2_BASICO, degree=2, raw=FALSE) +
                  poly(MORT1, degree=1, raw=FALSE) +
                  poly(T_FREQ11A14, degree=1, raw=FALSE) + 
                  poly(GINI, degree=1, raw=FALSE), data = counties.2010)

summary(fit_4_quad)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -326.34  -37.01   -4.70   30.93  596.97 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                                         493.6056     0.8716 566.348   <2e-16 ***
#   poly(IDHM, degree = 2, raw = FALSE)1              25270.0297   294.8266  85.712   <2e-16 ***
#   poly(IDHM, degree = 2, raw = FALSE)2               3810.7943   122.0455  31.224   <2e-16 ***
#   poly(T_SUPER25M, degree = 2, raw = FALSE)1         3360.2134   138.0033  24.349   <2e-16 ***
#   poly(T_SUPER25M, degree = 2, raw = FALSE)2         1649.9118    93.0337  17.735   <2e-16 ***
#   poly(T_MED18M, degree = 2, raw = FALSE)1          -8028.3499   175.0506 -45.863   <2e-16 ***
#   poly(T_MED18M, degree = 2, raw = FALSE)2              4.9352   119.6424   0.041    0.967    
#   poly(T_ATRASO_2_BASICO, degree = 2, raw = FALSE)1  3816.2010   122.5350  31.144   <2e-16 ***
#   poly(T_ATRASO_2_BASICO, degree = 2, raw = FALSE)2  -852.1759    82.3485 -10.348   <2e-16 ***
#   poly(MORT1, degree = 2, raw = FALSE)1              1236.8754   149.3500   8.282   <2e-16 ***
#   poly(MORT1, degree = 2, raw = FALSE)2                -7.3086    85.6150  -0.085    0.932    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 65.02 on 5554 degrees of freedom
# Multiple R-squared:  0.9287,	Adjusted R-squared:  0.9286 
# F-statistic:  7234 on 10 and 5554 DF,  p-value: < 2.2e-16

# Remove high p-values from quadratic regression model

fit_4_quad_adjusted <- lm(RDPC ~ poly(IDHM, degree=2, raw=FALSE) +
                    poly(T_SUPER25M, degree=2, raw=FALSE) +
                    poly(T_MED18M, degree=1, raw=FALSE) +
                    poly(T_ATRASO_2_BASICO, degree=2, raw=FALSE) +
                    poly(MORT1, degree=1, raw=FALSE), data = counties.2010)

summary(fit_4_quad_adjusted)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -326.56  -37.04   -4.63   30.95  596.97 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                                         493.6056     0.8714 566.449   <2e-16 ***
#   poly(IDHM, degree = 2, raw = FALSE)1              25256.2969   258.2559  97.796   <2e-16 ***
#   poly(IDHM, degree = 2, raw = FALSE)2               3808.9071    95.8647  39.732   <2e-16 ***
#   poly(T_SUPER25M, degree = 2, raw = FALSE)1         3362.2949   132.2448  25.425   <2e-16 ***
#   poly(T_SUPER25M, degree = 2, raw = FALSE)2         1652.9386    74.9401  22.057   <2e-16 ***
#   poly(T_MED18M, degree = 1, raw = FALSE)           -8023.3058   164.1584 -48.875   <2e-16 ***
#   poly(T_ATRASO_2_BASICO, degree = 2, raw = FALSE)1  3815.1838   121.9799  31.277   <2e-16 ***
#   poly(T_ATRASO_2_BASICO, degree = 2, raw = FALSE)2  -851.2108    80.0910 -10.628   <2e-16 ***
#   poly(MORT1, degree = 1, raw = FALSE)               1230.5587   134.1360   9.174   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 65.01 on 5556 degrees of freedom
# Multiple R-squared:  0.9287,	Adjusted R-squared:  0.9286 
# F-statistic:  9046 on 8 and 5556 DF,  p-value: < 2.2e-16

fit_5 <- lm(RDPC ~ poly(IDHM, degree=2, raw=FALSE) +
                   poly(T_SUPER25M, degree=2, raw=FALSE) +
                   poly(T_MED18M, degree=1, raw=FALSE) +
                   poly(T_ATRASO_2_BASICO, degree=3, raw=FALSE) +
                   poly(MORT1, degree=1, raw=FALSE), data = counties.2010)

summary(fit_5)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -326.33  -36.59   -4.49   31.30  594.88 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                                         493.6056     0.8704 567.129  < 2e-16 ***
#   poly(IDHM, degree = 2, raw = FALSE)1              25341.5932   258.9287  97.871  < 2e-16 ***
#   poly(IDHM, degree = 2, raw = FALSE)2               3800.5126    95.7756  39.681  < 2e-16 ***
#   poly(T_SUPER25M, degree = 2, raw = FALSE)1         3320.4769   132.5475  25.051  < 2e-16 ***
#   poly(T_SUPER25M, degree = 2, raw = FALSE)2         1671.4443    75.0098  22.283  < 2e-16 ***
#   poly(T_MED18M, degree = 1, raw = FALSE)           -8025.8793   163.9633 -48.949  < 2e-16 ***
#   poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)1  3788.8294   122.0325  31.048  < 2e-16 ***
#   poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)2  -845.2316    80.0106 -10.564  < 2e-16 ***
#   poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)3   255.3660    67.4558   3.786 0.000155 ***
#   poly(MORT1, degree = 1, raw = FALSE)               1337.1111   136.9000   9.767  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 64.93 on 5555 degrees of freedom
# Multiple R-squared:  0.9289,	Adjusted R-squared:  0.9288 
# F-statistic:  8062 on 9 and 5555 DF,  p-value: < 2.2e-16

plot(fit_5)

# fit_6 = lm(counties.2010$RDPC~ poly(counties.2010$E_ANOSESTUDO, degree=1, raw=FALSE) +
#              poly(counties.2010$ESPVIDA, degree=1, raw=FALSE) +
#              poly(counties.2010$T_FUND18M, degree=3, raw=FALSE) +
#              poly(counties.2010$T_MED18M, degree=2, raw=FALSE) +
#              poly(counties.2010$T_SUPER25M, degree=2, raw=FALSE) +
#              poly(counties.2010$GINI, degree=2, raw=FALSE) +
#              poly(counties.2010$IDHM, degree=2, raw=FALSE ))
# 
# summary(fit_6)
# 
# plot(fit_6)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -255.10  -38.15   -2.61   33.29  505.81 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                                                 493.6056     0.8315 593.634  < 2e-16 ***
#   poly(counties.2010$E_ANOSESTUDO, degree = 1, raw = FALSE) -2551.2834    92.1458 -27.687  < 2e-16 ***
#   poly(counties.2010$ESPVIDA, degree = 1, raw = FALSE)      -2640.4985   142.6117 -18.515  < 2e-16 ***
#   poly(counties.2010$T_FUND18M, degree = 3, raw = FALSE)1   -1504.5642   263.9090  -5.701 1.25e-08 ***
#   poly(counties.2010$T_FUND18M, degree = 3, raw = FALSE)2    2629.1001   187.8477  13.996  < 2e-16 ***
#   poly(counties.2010$T_FUND18M, degree = 3, raw = FALSE)3     570.2191    85.7353   6.651 3.19e-11 ***
#   poly(counties.2010$T_MED18M, degree = 2, raw = FALSE)1    -7369.8871   280.1750 -26.305  < 2e-16 ***
#   poly(counties.2010$T_MED18M, degree = 2, raw = FALSE)2    -2336.9738   204.8854 -11.406  < 2e-16 ***
#   poly(counties.2010$T_SUPER25M, degree = 2, raw = FALSE)1   2734.5212   141.0927  19.381  < 2e-16 ***
#   poly(counties.2010$T_SUPER25M, degree = 2, raw = FALSE)2   1716.9951   102.6224  16.731  < 2e-16 ***
#   poly(counties.2010$GINI, degree = 2, raw = FALSE)1         1968.8426    77.0830  25.542  < 2e-16 ***
#   poly(counties.2010$GINI, degree = 2, raw = FALSE)2          197.6275    65.1714   3.032  0.00244 ** 
#   poly(counties.2010$IDHM, degree = 2, raw = FALSE)1        27059.2989   268.0820 100.937  < 2e-16 ***
#   poly(counties.2010$IDHM, degree = 2, raw = FALSE)2         3521.5878   101.4488  34.713  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 62.03 on 5551 degrees of freedom
# Multiple R-squared:  0.9351,	Adjusted R-squared:  0.935 
# F-statistic:  6156 on 13 and 5551 DF,  p-value: < 2.2e-16

#################################################################################
# Other useful functions 
coefficients(fit_5)

# (Intercept)                                          poly(IDHM, degree = 2, raw = FALSE)1 
# 493.6056                                             25341.5932 
# poly(IDHM, degree = 2, raw = FALSE)2                 poly(T_SUPER25M, degree = 2, raw = FALSE)1 
# 3800.5126                                            3320.4769 
# poly(T_SUPER25M, degree = 2, raw = FALSE)2           poly(T_MED18M, degree = 1, raw = FALSE) 
# 1671.4443                                            -8025.8793 
# poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)1    poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)2 
# 3788.8294                                            -845.2316 
# poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)3    poly(MORT1, degree = 1, raw = FALSE) 
# 255.3660                                             1337.1111 

# Confidence Interval
confint(fit_5) #level=0.95

# (Intercept)                                         491.8994   495.3119
# poly(IDHM, degree = 2, raw = FALSE)1              24833.9916 25849.1948
# poly(IDHM, degree = 2, raw = FALSE)2               3612.7549  3988.2702
# poly(T_SUPER25M, degree = 2, raw = FALSE)1         3060.6320  3580.3218
# poly(T_SUPER25M, degree = 2, raw = FALSE)2         1524.3957  1818.4929
# poly(T_MED18M, degree = 1, raw = FALSE)           -8347.3115 -7704.4472
# poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)1  3549.5979  4028.0609
# poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)2 -1002.0837  -688.3795
# poly(T_ATRASO_2_BASICO, degree = 3, raw = FALSE)3   123.1263   387.6057
# poly(MORT1, degree = 1, raw = FALSE)               1068.7336  1605.4886

# fitted(fit_5) # predicted values
# residuals(fit_5) # residuals
# anova(fit_5) # anova table 
# vcov(fit_5) # covariance matrix for model parameters 
# influence(fit_5) # regression diagnostics

# # Residual Factors
# plot(fitted(fit_5), residuals(fit_5), xlab="Valores Ajustados", ylab="Resíduos", main = "Resíduos X Valores Ajustados")
# abline(h=0)

# plot(counties.2010$E_ANOSESTUDO, residuals(fit3), xlab="Anos de Estudo", ylab="Resíduos")
# abline(h=0)
# 
# plot(counties.2010$ESPVIDA, residuals(fi3t), xlab="Expectativa de Vida", ylab="Resíduos")
# abline(h=0)
# 
# plot(counties.2010$GINI, residuals(fit3), xlab="Índice de Gini", ylab="Resíduos")
# abline(h=0)
# 
# plot(counties.2010$IDHM, residuals(fit3), xlab="IDHM", ylab="Resíduos")
# abline(h=0)

# Homoscedasticity test: Property of having equal Statistical Variance
# RDPC.median <- median(counties.2010$ESPVIDA)
# var.test(residuals(fit3)[counties.2010$ESPVIDA>RDPC.median], residuals(fit3)[counties.2010$ESPVIDA<RDPC.median])

regression.result <- data.frame(counties.2010$UF,counties.2010$Município,counties.2010$RDPC, fitted(fit_5))

random_selection <- sample(1:5565, 100)

plot_ly(regression.result, x=1:100, y = ~counties.2010.RDPC[random_selection], name="Real", type="scatter", mode="lines+markers") %>%
                          add_trace(y = ~fitted.fit_5.[random_selection], name="Estimado", type="scatter", mode="lines+markers") %>%
layout(title = "RDPC Real X RDPC Estimado para uma amostra aleatória de 100 Cidades",
       xaxis = list(title="Cidades"),
       yaxis = list(title="RDPC"))
