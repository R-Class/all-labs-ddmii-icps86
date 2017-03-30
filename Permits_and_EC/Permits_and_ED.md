Permits and ED
================
ignacio
March 30, 2017

### Looking at the Permit Data set

``` r
types <- data.frame(type = names(table(dat$Type)), freq = as.numeric(table(dat$Type)))
types <- types[order(types$freq, decreasing = T),]
rownames(types) <- NULL
pander(types)
```

<table style="width:44%;">
<colgroup>
<col width="36%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">type</th>
<th align="center">freq</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Electric</td>
<td align="center">5807</td>
</tr>
<tr class="even">
<td align="center">Res. Remodel/Chg Occ</td>
<td align="center">2226</td>
</tr>
<tr class="odd">
<td align="center">HVAC/Mechanical</td>
<td align="center">2170</td>
</tr>
<tr class="even">
<td align="center">Sprinkler</td>
<td align="center">1793</td>
</tr>
<tr class="odd">
<td align="center">Com. Reno/Rem/Chg Occ</td>
<td align="center">1689</td>
</tr>
<tr class="even">
<td align="center">Misc.(deck, fence,ramp)</td>
<td align="center">1166</td>
</tr>
<tr class="odd">
<td align="center">Sidewalk Replace</td>
<td align="center">773</td>
</tr>
<tr class="even">
<td align="center">Electric (Meter Set)</td>
<td align="center">767</td>
</tr>
<tr class="odd">
<td align="center">Fire Alarm</td>
<td align="center">616</td>
</tr>
<tr class="even">
<td align="center">Demolition</td>
<td align="center">599</td>
</tr>
<tr class="odd">
<td align="center">Liability Waiver</td>
<td align="center">598</td>
</tr>
<tr class="even">
<td align="center">Road Cut</td>
<td align="center">595</td>
</tr>
<tr class="odd">
<td align="center">Security Alarm</td>
<td align="center">542</td>
</tr>
<tr class="even">
<td align="center">Sign</td>
<td align="center">328</td>
</tr>
<tr class="odd">
<td align="center">Sidewalk Cafe</td>
<td align="center">236</td>
</tr>
<tr class="even">
<td align="center">Site Work</td>
<td align="center">214</td>
</tr>
<tr class="odd">
<td align="center">Loading Zone (Business)</td>
<td align="center">175</td>
</tr>
<tr class="even">
<td align="center">Elevator</td>
<td align="center">172</td>
</tr>
<tr class="odd">
<td align="center">Public Assembly</td>
<td align="center">172</td>
</tr>
<tr class="even">
<td align="center">Block Party (Business)</td>
<td align="center">157</td>
</tr>
<tr class="odd">
<td align="center">Block Party (Residential)</td>
<td align="center">149</td>
</tr>
<tr class="even">
<td align="center">Antenna / Dish</td>
<td align="center">112</td>
</tr>
<tr class="odd">
<td align="center">Parking Meter Rental</td>
<td align="center">111</td>
</tr>
<tr class="even">
<td align="center">Pool / Hot Tub</td>
<td align="center">71</td>
</tr>
<tr class="odd">
<td align="center">Tank</td>
<td align="center">67</td>
</tr>
<tr class="even">
<td align="center">Curb Cut</td>
<td align="center">62</td>
</tr>
<tr class="odd">
<td align="center">Com. New Building</td>
<td align="center">60</td>
</tr>
<tr class="even">
<td align="center">Res. New 1-2 Family</td>
<td align="center">42</td>
</tr>
<tr class="odd">
<td align="center">Encroach (Major)</td>
<td align="center">37</td>
</tr>
<tr class="even">
<td align="center">Encroachment (Converted)</td>
<td align="center">29</td>
</tr>
<tr class="odd">
<td align="center">Footing / Foundation</td>
<td align="center">16</td>
</tr>
<tr class="even">
<td align="center">Encroach (Deminimus)</td>
<td align="center">5</td>
</tr>
</tbody>
</table>

**Residential**

-   Res. Remodel/Chg Occ : Residential remodeling / Change in occupanc?
-   Res. New 1-2 Family

**businesses**

-   Loading Zone (Business)
-   Block Party (Business)
-   Parking Meter Rental

**uncertain** - difficult to tell if its residential or business

-   Com. New Building
-   Demolition
-   Site Work
-   Footing / Foundation

**Not sure if should be used**

-   HVAC/Mechanical: Heating, ventilation, AC or mechanical repair. (uncertain)
-   Com. Reno/Rem/Chg Occ: ???????
-   Electric (Meter Set)

**to be Ignored**

-   Sprinkler
-   Misc.(deck, fence,ramp)
-   Sidewalk Replace
-   Fire Alarm
-   Electric
-   Liability Waiver
-   Road Cut
-   Security Alarm
-   Sign
-   Sidewalk Cafe
-   Elevator
-   Public Assembly
-   Block Party (Residential)
-   Antenna / Dish
-   Pool / Hot Tub
-   Tank
-   Curb Cut
-   Encroach (Major)
-   Encroachment (Converted)
-   Encroach (Deminimus)

``` r
types$type <- as.character(types$type)
class(types$type)
```

    ## [1] "character"

``` r
#x <- types$type == "Res. Remodel/Chg Occ" | "Res. New 1-2 Family" | "Loading Zone (Business)" | "Block Party (Business)" | "Parking Meter Rental" | "Com. New Building" | "Demolition" | "Site Work" | "Footing / Foundation" | "HVAC/Mechanical" | "Com. Reno/Rem/Chg Occ" | "Electric (Meter Set)"
```
