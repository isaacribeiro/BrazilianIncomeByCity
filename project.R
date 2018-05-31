library(maptools)
porto_alegre <- readShapePoly("./data/porto_alegre/SH RM_Porto_Alegre/RM_PortoAlegre_Regional_region.shp")

library(RColorBrewer)
colors <- brewer.pal(9, "PuBuGn")

x_mean = format(round(mean(porto_alegre.points[,1]),2))
y_mean = format(round(mean(porto_alegre.points[,2]),2))

library(ggmap)
mapImage <- get_map(location = c(lon = -51.16, lat = -30.09),
                    color = "color",
                    source = "google",
                    maptype = "satellite",
                    zoom = 11)

porto_alegre.points <- fortify(porto_alegre)

ggmap(mapImage) + geom_polygon(aes(x = long, y = lat, group = group),
                               data = porto_alegre.points,
                               color = colors[9],
                               fill = colors[6],
                               alpha = 0.5) + labs(x = "Latitude", y = "Longitude")
