library(raster)

################################### IMPORT MINE POLYGONS ###################################
mine_poly <- shapefile('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Change Detection/mine_polygons.shp')


################################### IMPORT RASTERS 2014-2019 ###################################


raster_2019 <- stack('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Landsat 8 TOA 2013-2019/Raster Processing/Final merged layers/2019_raster.tif')
raster_2018 <- stack('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Landsat 8 TOA 2013-2019/Raster Processing/Final merged layers/2018_raster.tif')
raster_2017 <- stack('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Landsat 8 TOA 2013-2019/Raster Processing/Final merged layers/2017_raster2.tif')
raster_2016 <- stack('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Landsat 8 TOA 2013-2019/Raster Processing/Final merged layers/2016_raster.tif')
raster_2015 <- stack('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Landsat 8 TOA 2013-2019/Raster Processing/Final merged layers/2015_raster.tif')
raster_2014 <- stack('/Users/Anna/Library/Mobile Documents/com~apple~CloudDocs/Kandidat/Speciale/Landsat 8 TOA 2013-2019/Raster Processing/Final merged layers/2014_raster.tif')

################################### NORMALIZE RASTER BY 100.000 ###################################

raster_2019_norm = sampleRegular(raster_2019, 100000, asRaster=TRUE)
raster_2018_norm = sampleRegular(raster_2018, 100000, asRaster=TRUE)
raster_2017_norm = sampleRegular(raster_2017, 100000, asRaster=TRUE)
raster_2016_norm = sampleRegular(raster_2016, 100000, asRaster=TRUE)
raster_2015_norm = sampleRegular(raster_2015, 100000, asRaster=TRUE)
raster_2014_norm = sampleRegular(raster_2014, 100000, asRaster=TRUE)

################################### EXTRACT PIXELS WITHIN POLYGONS ###################################

val_2014 <- extract(raster_2014_norm, mine_poly, cellnumbers=TRUE, df=TRUE)
val_2015 <- extract(raster_2015_norm, mine_poly, cellnumbers=TRUE, df=TRUE)
val_2016 <- extract(raster_2016_norm, mine_poly, cellnumbers=TRUE, df=TRUE)
val_2017 <- extract(raster_2017_norm, mine_poly, cellnumbers=TRUE, df=TRUE)
val_2018 <- extract(raster_2018_norm, mine_poly, cellnumbers=TRUE, df=TRUE)
val_2019 <- extract(raster_2019_norm, mine_poly, cellnumbers=TRUE, df=TRUE)

################################### SAVE AS CSV ###################################

write.csv(val_2014,"/Users/Anna/Documents/GitHub/Speciale - Python/pixel_values/pixel_values_2014.csv")
write.csv(val_2015,"/Users/Anna/Documents/GitHub/Speciale - Python/pixel_values/pixel_values_2015.csv")
write.csv(val_2016,"/Users/Anna/Documents/GitHub/Speciale - Python/pixel_values/pixel_values_2016.csv")
write.csv(val_2017,"/Users/Anna/Documents/GitHub/Speciale - Python/pixel_values/pixel_values_2017.csv")
write.csv(val_2018,"/Users/Anna/Documents/GitHub/Speciale - Python/pixel_values/pixel_values_2018.csv")
write.csv(val_2019,"/Users/Anna/Documents/GitHub/Speciale - Python/pixel_values/pixel_values_2019.csv")

