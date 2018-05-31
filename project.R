#Mandatory Packages
download.packages(maptools)
download.packages(RColorBrewer)
download.packages(ggmap)

#load shapeFile from data repository
library(maptools)
porto_alegre <- readShapePoly("./data/porto_alegre/SH RM_Porto_Alegre/RM_PortoAlegre_Regional_region.shp")

#load color palette for map integration
library(RColorBrewer)
colors <- brewer.pal(9, "PuBuGn")

#retrieve map
library(ggmap)
mapImage <- get_map(location = c(lon = -51.16, lat = -30.09),
                    color = "color",
                    source = "google",
                    maptype = "satellite",
                    zoom = 11)

#convert shape file into a data frame format for integration with GIS
porto_alegre.points <- fortify(porto_alegre)

ggmap(mapImage) + 
geom_polygon(aes(x = long, y = lat, group = group),
                     data = porto_alegre.points,
                     color = colors[9],
                     fill = colors[6],
                     alpha = 0.5) + 
slabs(x = "Latitude", y = "Longitude")
