lab5
================
ignacio
February 21, 2017

### 1. Load dataset of home prices and assests from Zillow

    #loading the dataset from Zillow
    dat <- read.csv( "https://github.com/lecy/hedonic-prices/raw/master/Data/Housing%20Price%20In-Class%20Exercise%20(Responses).csv", stringsAsFactors=FALSE ) 
    str( dat )

    #fixing some variables
    dat$House.Price <- as.numeric(gsub( ",","", dat$House.Price ))

### 2. Add a census tract FIPS ID to each home (spatial join)

    #cleaning the addresses
    Fadd <- dat$Street.Address.of.House
    Fadd <- gsub( ",","", Fadd ) #deleting comas
    Fadd <- gsub( "\\d{5}$","", Fadd ) #deleting ZIPcodes
    Fadd <- gsub( "Syracuse NY", "", Fadd) #delleting city and state
    Fadd <- gsub( "APT \\d{1,3}", "", Fadd) #delleting aptments
    Fadd <- gsub( "Street", "St", Fadd) #complying to my OCD for names
    Fadd <- gsub( "St.", "St", Fadd) #complying to my OCD for names
    Fadd <- gsub( "\\.", "", Fadd)
    Fadd <- gsub( "\\s{1,}$", "", Fadd) #remove blank spaces at the end
    Fadd <- paste(Fadd, "Syracuse", "NY", sep=", ")

    dat$Fadd <- Fadd #Adding the new addresses to the dataframe

    #Geocoding
    coo <- geocode(Fadd, messaging = F) #geocoding
    dat <- cbind(dat, coo) #binding the geocode with the dataset
    save(dat,file="dat_coo.Rda") #saving theobject to avoid geocoding every time.

Adding the FIPS tract to the Zillow dataframe (Spatial Joint)

``` r
load("dat_coo.Rda") #loading the data frame we worked on code chunks above
coordinates(dat) = ~lon+lat #making it a coordinates object

#In order to do the points in poly operation, we need to specify  the proj4strings for the dat dataframe
#look at: http://r-sig-geo.2731867.n2.nabble.com/point-in-polygon-or-over-help-td7583635.html
proj4string(dat) # the output is NA
```

    ## [1] NA

``` r
proj4string(dat) <- CRS("+proj=longlat +datum=WGS84") #fixing it 

#adding an id variable
dat@data <- data.frame(id = 1:nrow(dat@data), dat@data[,1:25])

#Removing outlier from dat file
plot(dat) #data has outliers
```

![](Lab5_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
#limits of syracuse
min.lon <- -76.25 #x values
max.lon <- -76.05
min.lat <-  42.96 #y values
max.lat <-  43.12

#removing latitudes and lon that are out of the map of syr
dat <- dat[ dat$lat > min.lat & dat$lat < max.lat , ]
dat <- dat[ dat$lon > min.lon & dat$lon < max.lon , ]

plot(dat) #now we droped the outliers
```

![](Lab5_files/figure-markdown_github/unnamed-chunk-1-2.png)

``` r
############################################################3

#loading TIGER shape file extracted from Census website
shapes <- readShapePoly(fn="C:\\Users\\icps\\Dropbox\\3. Maxwell\\3. Spring Term\\5. Data Driven II\\Labs\\Instructions\\Lab3_4\\shapefiles\\tl_2010_36067_tract10"
                          ,proj4string=CRS("+proj=longlat +datum=WGS84"))

#fixing the data of the shapes files to get only the variables I want
#names(shapes@data)
shapes@data <- shapes@data[,c(3,11,12)]
colnames(shapes@data) <- c("Tract", "centroid.lat", "centroid.lon")

plot(shapes)
  points(dat, pch=20)
```

![](Lab5_files/figure-markdown_github/unnamed-chunk-1-3.png)

``` r
#making zoom to the plot 
plot(shapes
     , xlim=c(min.lon, max.lon) 
     , ylim=c(min.lat, max.lat)
     , axes = T
     ) 
  points(dat, pch=20, col="dodgerblue4")
```

![](Lab5_files/figure-markdown_github/unnamed-chunk-1-4.png)

``` r
#Running Points in poly to add shape id to points in dat
dat <- point.in.poly( dat, shapes )


############################################################

#Number of Points in each poly
x <- tapply(dat@data$id, dat@data$Tract, FUN=length)
x <- x[is.na(x) == F]
x <- data.frame(Tract = names(x), Points = as.numeric(x))

#average price per census tract
x2 <- tapply(dat@data$House.Price, dat@data$Tract, FUN=mean)
x2 <- x2[is.na.data.frame(x2) == F]

# table(x$Tract == names(x2)) #checking to see if order is the same, it is

#agregating the av. price to the dataframe
x$Avg.Hprice <- as.numeric(x2)
head(x) %>% pander
```

<table style="width:40%;">
<colgroup>
<col width="11%" />
<col width="12%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Tract</th>
<th align="center">Points</th>
<th align="center">Avg.Hprice</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">000100</td>
<td align="center">1</td>
<td align="center">87000</td>
</tr>
<tr class="even">
<td align="center">000200</td>
<td align="center">4</td>
<td align="center">53470</td>
</tr>
<tr class="odd">
<td align="center">000300</td>
<td align="center">9</td>
<td align="center">69667</td>
</tr>
<tr class="even">
<td align="center">000400</td>
<td align="center">8</td>
<td align="center">82888</td>
</tr>
<tr class="odd">
<td align="center">000501</td>
<td align="center">6</td>
<td align="center">42683</td>
</tr>
<tr class="even">
<td align="center">000600</td>
<td align="center">5</td>
<td align="center">71900</td>
</tr>
</tbody>
</table>

### 3. Adding census data to each home

``` r
# download acs5 2015 for Population, Median Household income, White, Black, Asian, Hispanic or latino, Unemployed, Income < poverty level last 12 months and In Labor Force
censuskey <- "5a9ad013c3692d7dfdd344a9b2b774f36c50b43d"
census <- getCensus(name="acs5", vintage=2015, key=censuskey, 
                       vars=c("B01001_001E", "B19013_001E", "B01001A_001E","B01001B_001E", "B01001D_001E", "B01001I_001E", "B23025_005E", "B17001_002E", "B23025_002E"), region="tract:*", regionin = "state: 36 + county: 067")

colnames(census)[4:12] <- c("Pop", "MHincome", "White", "Black", "Asian", "Hispanic", "Unemployed", "Poverty", "Labor")

census$p.Poverty <- census$Poverty / census$Labor
census$p.White <- census$White / census$Pop
census$p.Black <- census$Black / census$Pop
census$p.Asian <- census$Asian / census$Pop
census$p.Hispanic <- census$Hispanic / census$Pop
census$p.Unemployed <- census$Unemployed / census$Labor

#reducing sice of the census dataset
census <- census[,c(3:5,13:18)]

#getting a variables with the correct order to merge (match function)
these.order <- match(dat@data$Tract, census$tract)
#table(dat@data$Tract == census$tract[these.order]) #just checking its right, it is...

#using the order vector to merge the aggregate crimes into the shapes file
dat@data <- cbind(dat@data, census[these.order,2:9])
```

### 4. Aggregate crimes by census tract(spatial joint) and add to the dataset.

``` r
crime <- read.csv("https://raw.githubusercontent.com/lecy/hedonic-prices/master/Data/crime.lat.lon.csv", stringsAsFactors = F)
crime$id <- 1:nrow(crime) #adding an id to the crimes

coordinates(crime) = ~lon+lat #making it a coordinates object
proj4string(crime) <- CRS("+proj=longlat +datum=WGS84") #fixing the  "+proj=longlat +datum=WGS84" of the dat object

plot(shapes
     , xlim=c(min.lon, max.lon) 
     , ylim=c(min.lat, max.lat)
     , axes = T) 
  points(crime
         , cex = .8
         , pch=20
         , col="steel blue"
         ) 
```

![](Lab5_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
#Aggregating crimes in each poly
crime <- point.in.poly( crime, shapes ) #Is there a way to chose what variables i want to merge? 

#Aggregating the number of crimes in each Tract
x <- tapply(crime@data$id, crime@data$Tract, FUN=length)
x <- data.frame(Tract = names(x), Crimes = as.numeric(x))
x$Crimes[is.na(x$Crimes)] <- 0 #making the NAs into 0
head(x) %>% pander
```

<table style="width:22%;">
<colgroup>
<col width="11%" />
<col width="11%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Tract</th>
<th align="center">Crimes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">000100</td>
<td align="center">45</td>
</tr>
<tr class="even">
<td align="center">000200</td>
<td align="center">11</td>
</tr>
<tr class="odd">
<td align="center">000300</td>
<td align="center">2</td>
</tr>
<tr class="even">
<td align="center">000400</td>
<td align="center">10</td>
</tr>
<tr class="odd">
<td align="center">000501</td>
<td align="center">13</td>
</tr>
<tr class="even">
<td align="center">000600</td>
<td align="center">9</td>
</tr>
</tbody>
</table>

``` r
#getting a variables with the correct order to merge (match function)
these.order <- match(shapes@data$Tract, x$Tract)
#table(shapes@data$Tract == x$Tract[these.order]) #just checking its right, it is...

#using the order vector to merge the aggregate crimes into the shapes file
shapes@data$Crimes <- x$Crimes[these.order] 

##################################################
#Graphing Crime density

#formatting the colors
#summary(shapes@data$Crimes) #45 levels
f.color <- colorRampPalette( c("white", "light grey","dodgerblue4"))
colors <- f.color( 20 ) # number of colors

#dividing the ranked data into groups and adding color
shape.colors <- cut( rank(shapes@data$Crimes), breaks=20, labels=colors)
shape.colors <- as.character(shape.colors)

#an alernative way of making colors is to fix the buildin palette of colors like this: palette(colors) and then in the plot just reference a number or a factor and the palette will be automatically used.

#Using layout to output two plots next to each other
layout(matrix(c(rep(1,12), 3, 2, 3), nrow=3, ncol=5), widths=c(5,1))

#plotting the graphof crime density
  par(mar= c(2,4,3,1), oma=c(1,1,1,1), las=1)
  plot(shapes, col=shape.colors, main="Crimes in Syracuse"
       , xlim=c(min.lon, max.lon) 
       , ylim=c(min.lat, max.lat)
       , axes = T
       , cex.axis=.8
       ) 
#plotting a second image as the  legend
  par(mar=c(0,1,2,4))
  image(matrix(1:20, ncol = 20, nrow= 1), col=colors, axes=F)
  title(main="Rate", line = 1, outer = F, cex.main = 1, adj = 0)
  axis(4, at= seq(0,1, by=1/4), cex.axis = 1, labels= rev(c("High", "",  "Mid", "", "Low")))
```

![](Lab5_files/figure-markdown_github/unnamed-chunk-3-2.png)

Lab6
----

### 1. Create a map of property values in Buffalo

### 2. Create a map of the change in property values
