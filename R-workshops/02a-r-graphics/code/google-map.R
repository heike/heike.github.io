library(ggmap)
# location of Ames, IA
ames <- c(-93.62, 42.034722)
ames_map <- get_map(ames)
ggmap(ames_map, extent = 'normal')

ames_map <- get_map(ames, zoom=6)

bb <- attr(ames_map,"bb")
ggmap(ames_map, extent = 'normal') + 
	xlim(c(bb$ll.lon, bb$ur.lon)) + ylim(c(bb$ll.lat, bb$ur.lat)) + 
#	geom_path(aes(x=Long, y=Lat, group=ID), data=coords) + 
	geom_point(aes(x=LONGITUD, y=LATITUDE), data=acc, alpha=0.25)
