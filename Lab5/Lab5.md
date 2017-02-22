lab5
================
ignacio
February 21, 2017

1.  Load dataset of home prices and assests from Zillow

<!-- -->

    #loading the dataset
    dat <- read.csv( "https://github.com/lecy/hedonic-prices/raw/master/Data/Housing%20Price%20In-Class%20Exercise%20(Responses).csv", stringsAsFactors=FALSE )
    str( dat )

    #fixing some variables
    dat$House.Price <- as.numeric(gsub( ",","", dat$House.Price ))

1.  Add a census tract FIPS ID to each home (spatial join)

<!-- -->

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
    dat$Fadd <- Fadd
    coo <- geocode(Fadd, messaging = F)
    dat <- cbind(dat, coo)
    save(dat,file="dat_coo.Rda")

``` r
#Geocoding

load("dat_coo.Rda")
head(dat)[,19:21]
```

    ##   Driving.distance.to.the.nearest.Starbucks...in.MILES...
    ## 1                                                     3.2
    ## 2                                                     2.6
    ## 3                                                     2.6
    ## 4                                                     2.6
    ## 5                                                     2.3
    ## 6                                                     1.9
    ##   Walking.distance.to.the.nearest.large.park..at.least.4.square.blocks..in.MINUTES.
    ## 1                                                                                18
    ## 2                                                                                 5
    ## 3                                                                                 7
    ## 4                                                                                 8
    ## 5                                                                                20
    ## 6                                                                                11
    ##   Driving.distance.to.the.nearest.strip.or.shopping.mall...in.MILES...
    ## 1                                                                  1.3
    ## 2                                                                  0.6
    ## 3                                                                  0.5
    ## 4                                                                  0.8
    ## 5                                                                  0.6
    ## 6                                                                  2.5

\`\`\`

1.  Add census data to each home
2.  Aggregate crimes by census tract(spatial join) and add to the dataset.

Lab6
----

1.  Create a map of property values in Buffalo
2.  Create a map of the change in property values
