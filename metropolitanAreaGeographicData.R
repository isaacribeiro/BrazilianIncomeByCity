#### Required Libraries
library(ggplot2)
library(ggmap)
library(rgdal)
library(raster)

# Function to Calculate Area based on Coordinate Reference System
calculate_CRS_area <- function(region){

  # Load required Library
  library(raster)

  # Kilometer Square Division Factor
  KM_SQUARE <- 1000000

  crs(region)
  region$area_sqkm <- area(region) / KM_SQUARE
  totalArea <- sum(region$area_sqkm)
  return(totalArea)
}

create_string_to_file <- function(region_name, area){

  KM_SQUARE_UNIT <- "KM^2"

  result <- paste(region_name,"=", area, KM_SQUARE_UNIT, sep = " ")
  return(result)
}

# Useful Constants
AESTHETIC_MAPPING <- aes(x = long, y = lat, group = group)
BLACK <- "black"
NO_FILL <- NA

# Brazil
brazil <- readOGR("data/brasil/UFEBRASIL.shp")
brazil.area <- calculate_CRS_area(brazil)
# write(x = create_string_to_file("Brazil", brazil.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Baixada Santista
baixada_santista <- readOGR("data/baixada_santista/SH RM_Baixada_Santista/RM_Baixada_Santista_UDH_region.shp")
baixada_santista.area <- calculate_CRS_area(baixada_santista)
# write(x = create_string_to_file("Baixada Santista", baixada_santista.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Belem
belem <- readOGR("data/belem/SH RM_Belem/RM_Belem_UDH_region.shp")
belem.area <- calculate_CRS_area(belem)
# write(x = create_string_to_file("Belem", belem.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Belo Horizonte
belo_horizonte <- readOGR("data/belo_horizonte/SH RM_Belo_Horizonte/RM_BeloHorizonte_UDH_region.shp")
belo_horizonte.area <- calculate_CRS_area(belo_horizonte)
# write(x = create_string_to_file("Belo Horizonte", belo_horizonte.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Campinas
campinas <- readOGR("data/campinas/SH RM_Campinas/RM_Campinas_UDH_Atlas_novo_region.shp")
campinas.area <- calculate_CRS_area(campinas)
# write(x = create_string_to_file("Campinas", campinas.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Cuiaba
cuiaba <- readOGR("data/cuiaba/SH RM_Cuiaba/RM_Cuiaba_UDH_region.shp")
cuiaba.area <- calculate_CRS_area(cuiaba)
# write(x = create_string_to_file("Cuiaba", cuiaba.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Curibita
curitiba <- readOGR("data/curitiba/SH RM_Curitiba/RM_Curitiba_UDH_region.shp")
curitiba.area <- calculate_CRS_area(curitiba)
# write(x = create_string_to_file("Curitiba", curitiba.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Distrito Federal
distrito_federal <- readOGR("data/distrito_federal/SH RIDE_DF/RM_RIDE_UDH_region.shp")
distrito_federal.area <- calculate_CRS_area(distrito_federal)
# write(x = create_string_to_file("Distrito Federal", distrito_federal.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Florianópolis
florianopolis <- readOGR("data/florianopolis/SH RM Florianópolis/RM_Florianopolis_por_UDH_region.shp")
florianopolis.area <- calculate_CRS_area(florianopolis)
# write(x = create_string_to_file("Florianopolis", florianopolis.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Fortaleza
fortaleza <- readOGR("data/fortaleza/SH RM_Fortaleza/RM_Fortaleza_UDH_3_region.shp")
fortaleza.area <- calculate_CRS_area(fortaleza)
# write(x = create_string_to_file("Fortaleza", fortaleza.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Goiania
goiania <- readOGR("data/goiania/SH RM_Goiania/RM_Goiania_UDH_region.shp")
goiania.area <- calculate_CRS_area(goiania)
# write(x = create_string_to_file("Goiania", goiania.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Maceio
maceio <- readOGR("data/maceio/SH RM_Maceio/RM_Maceio_UDH_region.shp")
maceio.area <- calculate_CRS_area(maceio)
# write(x = create_string_to_file("Maceio", maceio.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Manaus
manaus <- readOGR("data/manaus/SH RM_Manaus/RM_Manaus_UDH_2_region.shp")
manaus.area <- calculate_CRS_area(manaus)
# write(x = create_string_to_file("Manaus", manaus.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Natal
natal <- readOGR("data/natal/SH RM_Natal/RM_Natal_UDH_2_region.shp")
natal.area <- calculate_CRS_area(natal)
# write(x = create_string_to_file("Natal", natal.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Paraíba
paraiba <- readOGR("data/paraiba/SH RM_Vale_Paraiba/RM_Vale_Paraiba_UDH_region.shp")
paraiba.area <- calculate_CRS_area(paraiba)
# write(x = create_string_to_file("Paraíba", paraiba.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Petrolina_Juazeiro
petrolina_juazeiro <- readOGR("data/petrolina_juazeiro/SH RIDE Petrolina_Juazeiro/RIDE_Petrolina_por_UDH_region.shp")
petrolina_juazeiro.area <- calculate_CRS_area(petrolina_juazeiro)
# write(x = create_string_to_file("Petrolina / Juazeiro", petrolina_juazeiro.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Porto Alegre
porto_alegre <- readOGR("data/porto_alegre/SH RM_Porto_Alegre/RM_PortoAlegre_UDH_region.shp")
porto_alegre.area <- calculate_CRS_area(porto_alegre)
# write(x = create_string_to_file("Porto Alegre", porto_alegre.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Recife
recife <- readOGR("data/recife/SH RM_Recife/RM_Recife_UDH_region.shp")
recife.area <- calculate_CRS_area(recife)
# write(x = create_string_to_file("Recife", recife.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Rio de Janeiro
rio_de_janeiro <- readOGR("data/rio_de_janeiro/SH RM_Rio_de_Janeiro/RM_RiodeJaneiro_UDH_3_region.shp")
rio_de_janeiro.area <- calculate_CRS_area(rio_de_janeiro)
# write(x = create_string_to_file("Rio de Janeiro", rio_de_janeiro.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Salvador
salvador <- readOGR("data/salvador/SH RM_Salvador/RM_Salvador_UDH_4_region.shp")
salvador.area <- calculate_CRS_area(salvador)
# write(x = create_string_to_file("Salvador", salvador.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# São Luis
sao_luis <- readOGR("data/sao_luis/SH RM_Sao_Luis/RM_SaoLuis_UDH_region.shp")
sao_luis.area <- calculate_CRS_area(sao_luis)
# write(x = create_string_to_file("São Luis", sao_luis.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# São Paulo
sao_paulo <- readOGR("data/sao_paulo/SH RM São Paulo/RM_SaoPaulo_UDH_region.shp")
sao_paulo.area <- calculate_CRS_area(sao_paulo)
# write(x = create_string_to_file("São Paulo", sao_paulo.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Sorocaba
sorocaba <- readOGR("data/sorocaba/SH RM Sorocaba/RM_Sorocaba_por_UDH_region.shp")
sorocaba.area <- calculate_CRS_area(sorocaba)
# write(x = create_string_to_file("Sorocaba", sorocaba.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Teresina
teresina <- readOGR("data/teresina/SH RIDE Teresina_Timon/RIDE_Teresina_por_UDH_region.shp")
teresina.area <- calculate_CRS_area(teresina)
# write(x = create_string_to_file("Teresina", teresina.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)
rm
# Vitória
vitoria <- readOGR("data/vitoria/SH RM_Vitoria/RM_Vitoria_UDH_2_region.shp")
vitoria.area <- calculate_CRS_area(vitoria)
# write(x = create_string_to_file("Vitória", vitoria.area),
#       file = AREA_PROPERTIES_FILE_PATH,
#       append = TRUE)

# Aggregates area of census (Km square)
census.area = baixada_santista.area +
              belem.area +
              belo_horizonte.area +
              campinas.area +
              cuiaba.area +
              curitiba.area +
              distrito_federal.area +
              florianopolis.area +
              fortaleza.area +
              goiania.area +
              maceio.area +
              manaus.area +
              natal.area +
              paraiba.area +
              petrolina_juazeiro.area +
              porto_alegre.area +
              recife.area +
              rio_de_janeiro.area +
              salvador.area +
              sao_paulo.area +
              sao_luis.area +
              sorocaba.area +
              teresina.area +
              vitoria.area

areaDensity <- census.area / brazil.area

# Downloads the Brazilian Map using Google Maps API
mapImage <- get_googlemap(center = c(lon = -51.7, lat = -13.5),
                          zoom = 4,
                          maptype = "satellite",
                          color = "color")

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
  
  # Chart Labels and Titles, central alignment for Title
  ggtitle("Brazilian HDI - Geographic Distribution from Censuses of 2000 and 2010") +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Latitude", y = "Longitude")

# Save as a PNG file the final map
# ggsave(filename = "images/finalMap.png", device = "png")
