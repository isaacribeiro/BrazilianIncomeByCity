#### Required Libraries
library(ggplot2)
library(ggmap)

# Useful Constants
AESTHETIC_MAPPING <- aes(x = long, y = lat, group = group)
BLACK <- "black"
NO_FILL <- NA

# Brazil
brazil <- readOGR("data/brasil/UFEBRASIL.shp")

# Baixada Santista
baixada_santista <- readOGR("data/baixada_santista/SH RM_Baixada_Santista/RM_Baixada_Santista_UDH_region.shp")

# Belem
belem <- readOGR("data/belem/SH RM_Belem/RM_Belem_UDH_region.shp")

# Belo Horizonte
belo_horizonte <- readOGR("data/belo_horizonte/SH RM_Belo_Horizonte/RM_BeloHorizonte_UDH_region.shp")

# Campinas
campinas <- readOGR("data/campinas/SH RM_Campinas/RM_Campinas_UDH_Atlas_novo_region.shp")

# Cuaiaba
cuiaba <- readOGR("data/cuiaba/SH RM_Cuiaba/RM_Cuiaba_UDH_region.shp")

# Curibita
curitiba <- readOGR("data/curitiba/SH RM_Curitiba/RM_Curitiba_UDH_region.shp")

# Distrito Federal
distrito_federal <- readOGR("data/distrito_federal/SH RIDE_DF/RM_RIDE_UDH_region.shp")

# Florianópolis
florianopolis <- readOGR("data/florianopolis/SH RM Florianópolis/RM_Florianopolis_por_UDH_region.shp")

# Fortaleza
fortaleza <- readOGR("data/fortaleza/SH RM_Fortaleza/RM_Fortaleza_UDH_3_region.shp")

# Goiania
goiania <- readOGR("data/goiania/SH RM_Goiania/RM_Goiania_UDH_region.shp")

# Maceio
maceio <- readOGR("data/maceio/SH RM_Maceio/RM_Maceio_UDH_region.shp")

# Manaus
manaus <- readOGR("data/manaus/SH RM_Manaus/RM_Manaus_UDH_2_region.shp")

# Natal
natal <- readOGR("data/natal/SH RM_Natal/RM_Natal_UDH_2_region.shp")

# Paraíba
paraiba <- readOGR("data/paraiba/SH RM_Vale_Paraiba/RM_Vale_Paraiba_UDH_region.shp")

# Petrolina_Juazeiro
petrolina_juazeiro <- readOGR("data/petrolina_juazeiro/SH RIDE Petrolina_Juazeiro/RIDE_Petrolina_por_UDH_region.shp")

# Porto Alegre
porto_alegre <- readOGR("data/porto_alegre/SH RM_Porto_Alegre/RM_PortoAlegre_UDH_region.shp")

# Recife
recife <- readOGR("data/recife/SH RM_Recife/RM_Recife_UDH_region.shp")

# Rio de Janeiro
rio_de_janeiro <- readOGR("data/rio_de_janeiro/SH RM_Rio_de_Janeiro/RM_RiodeJaneiro_UDH_3_region.shp")

# Salvador
salvador <- readOGR("data/salvador/SH RM_Salvador/RM_Salvador_UDH_4_region.shp")

# São Luis
sao_luis <- readOGR("data/sao_luis/SH RM_Sao_Luis/RM_SaoLuis_UDH_region.shp")

# São Paulo
sao_paulo <- readOGR("data/sao_paulo/SH RM São Paulo/RM_SaoPaulo_UDH_region.shp")

# Sorocaba
sorocaba <- readOGR("data/sorocaba/SH RM Sorocaba/RM_Sorocaba_por_UDH_region.shp")

# Teresina
teresina <- readOGR("data/teresina/SH RIDE Teresina_Timon/RIDE_Teresina_por_UDH_region.shp")

# Vitória
vitoria <- readOGR("data/vitoria/SH RM_Vitoria/RM_Vitoria_UDH_2_region.shp")

# Download the Brazilian Map using Google Maps API
mapImage <- get_googlemap(center = c(lon = -51.7, lat = -13.5),
                          zoom = 4,
                          maptype = "satellite",
                          color = "color",
                          filename = "images/map")

  # Map Image from Google with 30% of transparency
  ggmap(mapImage, darken = c(0.3, "white")) +
  
  # Brazil  
  geom_polygon(data = brazil, AESTHETIC_MAPPING, fill = NO_FILL, color = BLACK) + 
  
  # Baixada Santista
  geom_polygon(data = baixada_santista, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) + 
    
  # Belem
  geom_polygon(data = belem, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) + 
    
  # Belo Horizonte
  geom_polygon(data = belo_horizonte, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) + 
  
  # Campinas
  geom_polygon(data = campinas, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +     
    
  # Cuiaba
  geom_polygon(data = cuiaba, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
    
  # Curitiba  
  geom_polygon(data = curitiba, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Distrito Federal
  geom_polygon(data = distrito_federal, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) + 
  
  # Florianópolis
  geom_polygon(data = florianopolis, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +     
  
  # Fortaleza
  geom_polygon(data = fortaleza, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Goiania 
  geom_polygon(data = goiania, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +     

  # Maceio 
  geom_polygon(data = maceio, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Manaus
  geom_polygon(data = manaus, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) + 
  
  # Natal
  geom_polygon(data = natal, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +     
  
  # Paraíba
  geom_polygon(data = paraiba, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Petrolina - Juazeiro 
  geom_polygon(data = petrolina_juazeiro, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +   
      
  # Porto Alegre
  geom_polygon(data = porto_alegre, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) + 
  
  # Recife
  geom_polygon(data = recife, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +     
  
  # Rio de Janeiro
  geom_polygon(data = rio_de_janeiro, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Salvador 
  geom_polygon(data = salvador, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +   
  
  # São luis
  geom_polygon(data = sao_luis, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +    
    
  # São Paulo
  geom_polygon(data = sao_paulo, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Sorocaba
  geom_polygon(data = sorocaba, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +
  
  # Teresina
  geom_polygon(data = teresina, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +  
  
  # Vitória
  geom_polygon(data = vitoria, AESTHETIC_MAPPING, fill = BLACK, color = BLACK) +
  
  # Chart Labels and Titles
  labs(title = "Brazilian HDI - Geographic Distribution from Censuses of 2000 and 2010", x = "Latitude", y = "Longitude")