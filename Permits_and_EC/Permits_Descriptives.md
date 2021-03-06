Permits
================
ignacio
March 30, 2017

### Information about the Dataset

The Permits Dataset has information for 21,556 permits from 2012 - 2016. For each permit the Dataset inclueds variables like:

-   Type of Permit
-   Applicant name (can be either a person or a company)
-   Location
-   SBL
-   Date Issued
-   Valuation (cost of the activity the applicant is requesting permit for)
-   Fee Amount (the monies for the City)

We used the types of permits to construct 4 categories that we will aggregate as variables at the Census Tract level.

There are 32 types of permits:

    ##  [1] "Com. New Building"       "Com. Reno/Rem/Chg Occ"  
    ##  [3] "Demolition"              "Electric"               
    ##  [5] "Elevator"                "Fire Alarm"             
    ##  [7] "HVAC/Mechanical"         "Misc.(deck, fence,ramp)"
    ##  [9] "Pool / Hot Tub"          "Res. New 1-2 Family"    
    ## [11] "Res. Remodel/Chg Occ"    "Security Alarm"         
    ## [13] "Sprinkler"               "Tank"

We have placed this types of Permits into 4 categories to analyze them separately. They are:

-   Residential Properties, 2 Types of permits in this category: "Res. Remodel/Chg Occ", "Res. New 1-2 Family"

-   Commercial Properties, 2 Types of permits in this category: "Com. New Building", "Com. Reno/Rem/Chg Occ"

-   Demolitions, 1 Type of permit in this category: Demolitions

-   Installations and Repairs (to public space, res and com), 9 Types of permits in this category: Electric, Elevator, Fire Alarm, HVAC/Mechanical, Misc.(deck, fence,ramp), Pool / Hot Tub, Security Alarm, Sprinkler, Tank.

Finally, 18 permit types have been ignored.

In what follows we explain the categories that we have constructed and show some descriptives.

### PROPOSED VARIABLES

#### **1.New/Reno of Residential Property**

<table style="width:90%;">
<colgroup>
<col width="12%" />
<col width="29%" />
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">type</th>
<th align="center">freq</th>
<th align="center">meanval</th>
<th align="center">minval</th>
<th align="center">maxval</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>10</strong></td>
<td align="center">Res. New 1-2 Family</td>
<td align="center">41</td>
<td align="center">122078</td>
<td align="center">0</td>
<td align="center">255539</td>
</tr>
<tr class="even">
<td align="center"><strong>11</strong></td>
<td align="center">Res. Remodel/Chg Occ</td>
<td align="center">2216</td>
<td align="center">6955</td>
<td align="center">0</td>
<td align="center">360000</td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">2012</th>
<th align="center">2013</th>
<th align="center">2014</th>
<th align="center">2015</th>
<th align="center">2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">279</td>
<td align="center">410</td>
<td align="center">565</td>
<td align="center">598</td>
<td align="center">404</td>
</tr>
</tbody>
</table>

<table style="width:68%;">
<colgroup>
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="13%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Min.</th>
<th align="center">1st Qu.</th>
<th align="center">Median</th>
<th align="center">Mean</th>
<th align="center">3rd Qu.</th>
<th align="center">Max.</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">1000</td>
<td align="center">3000</td>
<td align="center">9046</td>
<td align="center">9000</td>
<td align="center">360000</td>
</tr>
</tbody>
</table>

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-3-1.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-3-2.png)

### **2.New/Reno of Commercial Property**

<table style="width:79%;">
<colgroup>
<col width="30%" />
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">type</th>
<th align="center">freq</th>
<th align="center">meanval</th>
<th align="center">minval</th>
<th align="center">maxval</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Com. New Building</td>
<td align="center">56</td>
<td align="center">2440789</td>
<td align="center">1500</td>
<td align="center">15183229</td>
</tr>
<tr class="even">
<td align="center">Com. Reno/Rem/Chg Occ</td>
<td align="center">1660</td>
<td align="center">247949</td>
<td align="center">0</td>
<td align="center">31811000</td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">2012</th>
<th align="center">2013</th>
<th align="center">2014</th>
<th align="center">2015</th>
<th align="center">2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">382</td>
<td align="center">317</td>
<td align="center">327</td>
<td align="center">364</td>
<td align="center">318</td>
</tr>
</tbody>
</table>

<table style="width:74%;">
<colgroup>
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="13%" />
<col width="13%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Min.</th>
<th align="center">1st Qu.</th>
<th align="center">Median</th>
<th align="center">Mean</th>
<th align="center">3rd Qu.</th>
<th align="center">Max.</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">8500</td>
<td align="center">34000</td>
<td align="center">319500</td>
<td align="center">132400</td>
<td align="center">31810000</td>
</tr>
</tbody>
</table>

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-4-1.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-4-2.png)

### **3.Demolitions**

<table style="width:75%;">
<colgroup>
<col width="11%" />
<col width="15%" />
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"> </th>
<th align="center">type</th>
<th align="center">freq</th>
<th align="center">meanval</th>
<th align="center">minval</th>
<th align="center">maxval</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>3</strong></td>
<td align="center">Demolition</td>
<td align="center">595</td>
<td align="center">17511</td>
<td align="center">0</td>
<td align="center">3e+05</td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">2012</th>
<th align="center">2013</th>
<th align="center">2014</th>
<th align="center">2015</th>
<th align="center">2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">90</td>
<td align="center">87</td>
<td align="center">125</td>
<td align="center">164</td>
<td align="center">129</td>
</tr>
</tbody>
</table>

<table style="width:68%;">
<colgroup>
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="13%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Min.</th>
<th align="center">1st Qu.</th>
<th align="center">Median</th>
<th align="center">Mean</th>
<th align="center">3rd Qu.</th>
<th align="center">Max.</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">6000</td>
<td align="center">11500</td>
<td align="center">17510</td>
<td align="center">18120</td>
<td align="center">3e+05</td>
</tr>
</tbody>
</table>

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-5-1.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-5-2.png)

### **4.Installations and Repairs on all properties**

\*At the end of this page each type of permit that makes up this category is plotted.

<table style="width:94%;">
<colgroup>
<col width="12%" />
<col width="33%" />
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">type</th>
<th align="center">freq</th>
<th align="center">meanval</th>
<th align="center">minval</th>
<th align="center">maxval</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>4</strong></td>
<td align="center">Electric</td>
<td align="center">5712</td>
<td align="center">23317</td>
<td align="center">0</td>
<td align="center">8e+06</td>
</tr>
<tr class="even">
<td align="center"><strong>5</strong></td>
<td align="center">Elevator</td>
<td align="center">170</td>
<td align="center">73308</td>
<td align="center">0</td>
<td align="center">1172000</td>
</tr>
<tr class="odd">
<td align="center"><strong>6</strong></td>
<td align="center">Fire Alarm</td>
<td align="center">607</td>
<td align="center">52336</td>
<td align="center">0</td>
<td align="center">8e+06</td>
</tr>
<tr class="even">
<td align="center"><strong>7</strong></td>
<td align="center">HVAC/Mechanical</td>
<td align="center">2156</td>
<td align="center">52791</td>
<td align="center">0</td>
<td align="center">9764733</td>
</tr>
<tr class="odd">
<td align="center"><strong>8</strong></td>
<td align="center">Misc.(deck, fence,ramp)</td>
<td align="center">1159</td>
<td align="center">5167</td>
<td align="center">0</td>
<td align="center">2100000</td>
</tr>
<tr class="even">
<td align="center"><strong>9</strong></td>
<td align="center">Pool / Hot Tub</td>
<td align="center">71</td>
<td align="center">6721</td>
<td align="center">0</td>
<td align="center">30000</td>
</tr>
<tr class="odd">
<td align="center"><strong>12</strong></td>
<td align="center">Security Alarm</td>
<td align="center">542</td>
<td align="center">1215</td>
<td align="center">0</td>
<td align="center">91968</td>
</tr>
<tr class="even">
<td align="center"><strong>13</strong></td>
<td align="center">Sprinkler</td>
<td align="center">1778</td>
<td align="center">10725</td>
<td align="center">0</td>
<td align="center">1396500</td>
</tr>
<tr class="odd">
<td align="center"><strong>14</strong></td>
<td align="center">Tank</td>
<td align="center">66</td>
<td align="center">17794</td>
<td align="center">0</td>
<td align="center">3e+05</td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">2012</th>
<th align="center">2013</th>
<th align="center">2014</th>
<th align="center">2015</th>
<th align="center">2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">2645</td>
<td align="center">2691</td>
<td align="center">2506</td>
<td align="center">2389</td>
<td align="center">2013</td>
</tr>
</tbody>
</table>

<table style="width:69%;">
<colgroup>
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="13%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Min.</th>
<th align="center">1st Qu.</th>
<th align="center">Median</th>
<th align="center">Mean</th>
<th align="center">3rd Qu.</th>
<th align="center">Max.</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">1000</td>
<td align="center">2600</td>
<td align="center">25990</td>
<td align="center">8035</td>
<td align="center">9765000</td>
</tr>
</tbody>
</table>

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-6-1.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-6-2.png)

### All Categories at a glance

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-7-1.png)

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-1.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-2.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-3.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-4.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-5.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-6.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-7.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-8.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-8-9.png)

### **Categories not taken into account**

All permits we found it was not useful to include:

<table style="width:85%;">
<colgroup>
<col width="36%" />
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">type</th>
<th align="center">freq</th>
<th align="center">meanval</th>
<th align="center">minval</th>
<th align="center">maxval</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Antenna / Dish</td>
<td align="center">112</td>
<td align="center">22830</td>
<td align="center">0</td>
<td align="center">80000</td>
</tr>
<tr class="even">
<td align="center">Block Party (Business)</td>
<td align="center">157</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Block Party (Residential)</td>
<td align="center">149</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Curb Cut</td>
<td align="center">62</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Electric (Meter Set)</td>
<td align="center">767</td>
<td align="center">288.1</td>
<td align="center">0</td>
<td align="center">14500</td>
</tr>
<tr class="even">
<td align="center">Encroach (Deminimus)</td>
<td align="center">5</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Encroach (Major)</td>
<td align="center">37</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Encroachment (Converted)</td>
<td align="center">29</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Footing / Foundation</td>
<td align="center">16</td>
<td align="center">353372</td>
<td align="center">0</td>
<td align="center">2116550</td>
</tr>
<tr class="even">
<td align="center">Liability Waiver</td>
<td align="center">598</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Loading Zone (Business)</td>
<td align="center">175</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Parking Meter Rental</td>
<td align="center">111</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Public Assembly</td>
<td align="center">172</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Road Cut</td>
<td align="center">595</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Sidewalk Cafe</td>
<td align="center">236</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">Sidewalk Replace</td>
<td align="center">773</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">Sign</td>
<td align="center">328</td>
<td align="center">6879</td>
<td align="center">0</td>
<td align="center">143000</td>
</tr>
<tr class="even">
<td align="center">Site Work</td>
<td align="center">214</td>
<td align="center">264969</td>
<td align="center">0</td>
<td align="center">7400000</td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">2012</th>
<th align="center">2013</th>
<th align="center">2014</th>
<th align="center">2015</th>
<th align="center">2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">541</td>
<td align="center">813</td>
<td align="center">970</td>
<td align="center">1064</td>
<td align="center">1145</td>
</tr>
</tbody>
</table>

    ## [1] "total cases: 4536"

<table style="width:69%;">
<colgroup>
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="13%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Min.</th>
<th align="center">1st Qu.</th>
<th align="center">Median</th>
<th align="center">Mean</th>
<th align="center">3rd Qu.</th>
<th align="center">Max.</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">0</td>
<td align="center">0</td>
<td align="center">14860</td>
<td align="center">150</td>
<td align="center">7400000</td>
</tr>
</tbody>
</table>

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-9-1.png)

#### **Why is New Foundations not included?**

"Footing / foundation" type of permits are not being included because it is only 16 and it is not clear whether they overlap with the permits for new residential and/or new commercial. In other words, a new building will have a foundaiton permit and a new construction permit (either residential or commercial).

<table style="width:89%;">
<colgroup>
<col width="11%" />
<col width="29%" />
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"> </th>
<th align="center">type</th>
<th align="center">freq</th>
<th align="center">meanval</th>
<th align="center">minval</th>
<th align="center">maxval</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>9</strong></td>
<td align="center">Footing / Foundation</td>
<td align="center">16</td>
<td align="center">353372</td>
<td align="center">0</td>
<td align="center">2116550</td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">2012</th>
<th align="center">2013</th>
<th align="center">2014</th>
<th align="center">2015</th>
<th align="center">2016</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">5</td>
<td align="center">2</td>
<td align="center">1</td>
<td align="center">7</td>
<td align="center">1</td>
</tr>
</tbody>
</table>

<table style="width:69%;">
<colgroup>
<col width="9%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="13%" />
<col width="9%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">Min.</th>
<th align="center">1st Qu.</th>
<th align="center">Median</th>
<th align="center">Mean</th>
<th align="center">3rd Qu.</th>
<th align="center">Max.</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">0</td>
<td align="center">0</td>
<td align="center">37500</td>
<td align="center">353400</td>
<td align="center">4e+05</td>
<td align="center">2117000</td>
</tr>
</tbody>
</table>

![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-10-1.png)![](Permits_Descriptives_files/figure-markdown_github/unnamed-chunk-10-2.png)
