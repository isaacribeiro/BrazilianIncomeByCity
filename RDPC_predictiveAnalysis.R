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
# hist(counties.2010$E_ANOSESTUDO)
# hist(counties.2010$ESPVIDA)
# hist(counties.2010$T_ANALF18M)
# hist(counties.2010$T_FUND18M)
# hist(counties.2010$T_MED18M)
# hist(counties.2010$T_SUPER25M)
# hist(counties.2010$GINI)
# hist(counties.2010$IDHM)
# # hist(counties.2010$RENOCUP)   --> Available only for State level data
# # hist(counties.2010$PEA18M)    --> Available only for State level data
# # hist(counties.2010$T_ATIV18M) --> Available only for State level data

# # Correlation between relevant variables
# plot(counties.2010$E_ANOSESTUDO, counties.2010$RDPC)
# cor(counties.2010$E_ANOSESTUDO, counties.2010$RDPC) #0.5124129
# 
# plot(counties.2010$ESPVIDA, counties.2010$RDPC)
# cor(counties.2010$ESPVIDA, counties.2010$RDPC) #0.7841763
# 
# plot(counties.2010$T_ANALF18M, counties.2010$RDPC)
# cor(counties.2010$T_ANALF18M, counties.2010$RDPC) #-0.8175425
# 
# plot(counties.2010$T_MED18M, counties.2010$RDPC)
# cor(counties.2010$T_MED18M, counties.2010$RDPC) #0.7453527
# 
# plot(counties.2010$T_SUPER25M, counties.2010$RDPC)
# cor(counties.2010$T_SUPER25M, counties.2010$RDPC) #0.7754382
# 
# plot(counties.2010$GINI, counties.2010$RDPC)
# cor(counties.2010$GINI, counties.2010$RDPC) #-0.2735242
# 
# plot(counties.2010$IDHM, counties.2010$RDPC)
# cor(counties.2010$IDHM, counties.2010$RDPC) #0.9079875

# Linear Regression
# Useful link https://www.statmethods.net/stats/regression.html

### 1st Try
# Linear Regression
fit_1 = lm(counties.2010$RDPC~ counties.2010$E_ANOSESTUDO +
                              counties.2010$ESPVIDA +
                              counties.2010$T_ANALF18M +
                              counties.2010$T_FUND18M +
                              counties.2010$T_MED18M +
                              counties.2010$T_SUPER25M +
                              counties.2010$GINI +
                              counties.2010$IDHM )

summary(fit_1)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -274.80  -53.03   -7.59   43.21  596.74 
# 
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
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 82.96 on 5556 degrees of freedom
# Multiple R-squared:  0.8839,	Adjusted R-squared:  0.8837 
# F-statistic:  5286 on 8 and 5556 DF,  p-value: < 2.2e-16

# plot(fit_1)

### 2nd Try --> Coefficient for counties.2010$T_ANALF18M is -1.6458... Low significance

fit_2 = lm(counties.2010$RDPC~ counties.2010$E_ANOSESTUDO +
            counties.2010$ESPVIDA +
            counties.2010$T_FUND18M +
            counties.2010$T_MED18M +
            counties.2010$T_SUPER25M +
            counties.2010$GINI +
            counties.2010$IDHM )

summary(fit_2)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -283.75  -53.65   -7.11   43.70  593.05 
# 
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
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 83.27 on 5557 degrees of freedom
# Multiple R-squared:  0.883,	Adjusted R-squared:  0.8828 
# F-statistic:  5990 on 7 and 5557 DF,  p-value: < 2.2e-16

plot(fit_2)

## 3rd Try - Model can be adjusted into a Quadratic Regression Model

fit_3 = lm(counties.2010$RDPC~ poly(counties.2010$E_ANOSESTUDO, degree=2, raw=FALSE) +
            poly(counties.2010$ESPVIDA, degree=2, raw=FALSE) +
            poly(counties.2010$T_FUND18M, degree=2, raw=FALSE) +
            poly(counties.2010$T_MED18M, degree=2, raw=FALSE) +
            poly(counties.2010$T_SUPER25M, degree=2, raw=FALSE) +
            poly(counties.2010$GINI, degree=2, raw=FALSE) +
            poly(counties.2010$IDHM, degree=2, raw=FALSE ))

summary(fit_3)

# Residuals:
#   Min      1Q  Median      3Q     Max 
# -271.86  -38.11   -2.44   33.12  508.66 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept)                                                  493.6056     0.8343 591.662  < 2e-16 ***
#   poly(counties.2010$E_ANOSESTUDO, degree = 2, raw = FALSE)1 -2527.2232    92.8155 -27.228  < 2e-16 ***
#   poly(counties.2010$E_ANOSESTUDO, degree = 2, raw = FALSE)2  -173.3386    75.2933  -2.302  0.02136 *  
#   poly(counties.2010$ESPVIDA, degree = 2, raw = FALSE)1      -2633.0599   145.2101 -18.133  < 2e-16 ***
#   poly(counties.2010$ESPVIDA, degree = 2, raw = FALSE)2         78.2363    77.7070   1.007  0.31407    
#   poly(counties.2010$T_FUND18M, degree = 2, raw = FALSE)1    -1729.1769   265.3151  -6.517 7.78e-11 ***
#   poly(counties.2010$T_FUND18M, degree = 2, raw = FALSE)2     2271.1177   185.3577  12.253  < 2e-16 ***
#   poly(counties.2010$T_MED18M, degree = 2, raw = FALSE)1     -7151.8082   282.8631 -25.284  < 2e-16 ***
#   poly(counties.2010$T_MED18M, degree = 2, raw = FALSE)2     -1970.6762   200.9949  -9.805  < 2e-16 ***
#   poly(counties.2010$T_SUPER25M, degree = 2, raw = FALSE)1    2829.2426   140.7726  20.098  < 2e-16 ***
#   poly(counties.2010$T_SUPER25M, degree = 2, raw = FALSE)2    1999.1857    92.5719  21.596  < 2e-16 ***
#   poly(counties.2010$GINI, degree = 2, raw = FALSE)1          2012.2160    77.3307  26.021  < 2e-16 ***
#   poly(counties.2010$GINI, degree = 2, raw = FALSE)2           246.6886    66.7291   3.697  0.00022 ***
#   poly(counties.2010$IDHM, degree = 2, raw = FALSE)1         27067.5146   272.0393  99.499  < 2e-16 ***
#   poly(counties.2010$IDHM, degree = 2, raw = FALSE)2          3277.3799   118.7625  27.596  < 2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 62.24 on 5550 degrees of freedom
# Multiple R-squared:  0.9347,	Adjusted R-squared:  0.9346 
# F-statistic:  5676 on 14 and 5550 DF,  p-value: < 2.2e-16

plot(fit_3)

## 4rd Try - Third Model has some high p-values
# Apply an automated variable selection stepwise algorithm and selects the five more relevant ones.

fit_reference = lm(RDPC~ 1, data=counties.2010)
varSelection <- (RDCP ~ ESPVIDA + FECTOT + MORT1 + MORT5 + RAZDEP + SOBRE40 + SOBRE60 + T_ENV + E_ANOSESTUDO + T_ATRASO_0_FUND + T_ATRASO_0_MED + T_ATRASO_1_BASICO + T_ATRASO_1_MED + T_ATRASO_2_BASICO + T_ATRASO_2_FUND + T_ATRASO_2_MED + T_FREQ0A3 + T_FREQ11A14 + T_FREQ15A17 + T_FREQ18A24 + T_FREQ25A29 +T_FUND18M + T_MED18M + T_SUPER25M + GINI + PIND + P_FORMAL + IDHM)
fit_5 <- step(fit_reference, direction="both", scope=formula(varSelection), steps = 5)
summary(fit_5)

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

fit_5_quad = lm(RDPC ~ poly(IDHM, degree=2, raw=FALSE) +
                       poly(T_SUPER25M, degree=2, raw=FALSE) +
                       poly(T_MED18M, degree=2, raw=FALSE) +
                       poly(T_ATRASO_2_BASICO, degree=2, raw=FALSE) +
                       poly(MORT1, degree=2, raw=FALSE), data = counties.2010)



summary(fit_5_quad)

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

fit_5_quad_adjusted <- lm(RDPC ~ poly(IDHM, degree=2, raw=FALSE) +
                    poly(T_SUPER25M, degree=2, raw=FALSE) +
                    poly(T_MED18M, degree=1, raw=FALSE) +
                    poly(T_ATRASO_2_BASICO, degree=2, raw=FALSE) +
                    poly(MORT1, degree=1, raw=FALSE), data = counties.2010)

summary(fit_5_quad_adjusted)

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

#################################################################################
# Other useful functions 
coefficients(fit3)

# Confidence Interval
confint(fit_5_quad_adjusted) #level=0.95

#                                                        2.5 %     97.5 %
# (Intercept)                                         491.8973   495.3139
# poly(IDHM, degree = 2, raw = FALSE)1              24750.0144 25762.5793
# poly(IDHM, degree = 2, raw = FALSE)2               3620.9747  3996.8394
# poly(T_SUPER25M, degree = 2, raw = FALSE)1         3103.0435  3621.5464
# poly(T_SUPER25M, degree = 2, raw = FALSE)2         1506.0267  1799.8505
# poly(T_MED18M, degree = 1, raw = FALSE)           -8345.1206 -7701.4911
# poly(T_ATRASO_2_BASICO, degree = 2, raw = FALSE)1  3576.0556  4054.3121
# poly(T_ATRASO_2_BASICO, degree = 2, raw = FALSE)2 -1008.2204  -694.2012
# poly(MORT1, degree = 1, raw = FALSE)                967.5997  1493.5176

fitted(fit3) # predicted values
residuals(fit3) # residuals
anova(fit3) # anova table 
vcov(fit3) # covariance matrix for model parameters 
influence(fit3) # regression diagnostics

# Bidirection Stepwise Algorithm
step <- stepAIC(fit3, direction = "both")

step$anova

anova(fit1, fit2, fit3)

# diagnostic plots 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit3)

# fit3_quadratic <- lm(fit3 = lm(counties.2010$RDPC~ counties.2010$E_ANOSESTUDO +
                                 # counties.2010$ESPVIDA +
                                 # counties.2010$T_FUND18M +
                                 # counties.2010$T_MED18M +
                                 # counties.2010$T_SUPER25M +
                                 # counties.2010$GINI +
                                 # counties.2010$IDHM)

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

regression.result <- data.frame(counties.2010$UF,counties.2010$Município,counties.2010$RDPC, fitted(fit1_2))

random_selection <- sample(1:5565, 100)

plot_ly(regression.result, x=1:100, y = ~counties.2010.RDPC[random_selection], name="Real", type="scatter", mode="lines+markers") %>%
                          add_trace(y = ~fitted.fit1_2.[random_selection], name="Estimado", type="scatter", mode="lines+markers") %>%
layout(title = "RDPC Real X RDPC Estimado para uma amostra aleatória de 100 Cidades",
       xaxis = list(title="Cidades"),
       yaxis = list(title="RDPC"))
