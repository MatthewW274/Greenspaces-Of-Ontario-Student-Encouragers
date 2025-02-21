# Greenspaces-Of-Ontario-Student-Encouragers (GOOSE)
###### Desktop Oriented Web Application

# Team
- Harry Cheung
- Brandon Que 
- Matthew Woodward

# App Logo

<img src="../App Challenge Images/Park_Place-logo.png" style="height:300px; margin:0 .5em .25em 0; float: left;" /> 

# Mission Statement and Background

As urban populations grow, there is an increasing demand for housing, commercial spaces, and infrastructure, such as roads, schools, and hospitals. This demand often leads to land repurposing previously dedicated to parks, gardens, and other green spaces. Urban planners may prioritise new construction projects to accommodate the rising population rather than preserving or expanding existing green space.

This reduction in parkland results from the growing pressure on land in cities. As cities sprawl outward or undergo vertical development, the available space for recreational areas often shrinks. In some cases, where green spaces remain, they may be smaller and less accessible due to increased traffic, commercial developments, or higher property values pushing out the people, such as low-income renters, who rely on these parks for their well-being.

The City of Waterloo has experienced drastic urbanization in the past few decades; as more and more land develops into student housing, research & technology parks, and high-rise rental properties within the city core, the greenspace that urban renters have access to is disappearing at an alarming rate. Boasting a unique reputation as a student town due to its prestigious post-secondary institutions, [Waterloo has also seen a decrease in homeownership rates and more renters in the market compared to the provincial and federal average](https://www.waterloo.ca/en/government/resources/Documents/Economic-Development/2021-Census-Bulletin-AODA.pdf). With the announcement of future infrastructure projects, such as a new "state-of-the-art" hospital soon to be built on the University of Waterloo campus, the overall amount of accessible greenspace will only continue to decrease. 

Park Place, inspired by the iconic and high-value property in Monopoly, symbolises the growing wealth divide in urban areas. The name reflects the historical idea that certain parks, often located in central or desirable areas of a city, are seen as premium spaces—just as Park Place in Monopoly is one of the most expensive properties on the board. However, these so-called "park places" are increasingly out of reach for low-income renters, particularly in inner-city neighbourhoods. The rise of gentrification and urban development has led to a situation where these green spaces, originally designed to be public and accessible, are now monopolised by those who can afford to live nearby or own property in these desirable areas.

Park Place, built in response to the widening gaps of urban green space inequity, is a powerful tool to raise awareness about the growing issue of parkland accessibility. Our app raises awareness that so-called "park places" are becoming less accessible and highlights the disparities in how green spaces are distributed and used in urban areas. By focusing on the inequalities in park access, especially in low-income, inner-city communities, the app brings the issue to the forefront of public conversation.

With greenspaces playing an ever-increasing role in mental health, physical wellness, air quality, the urban heat island effect, and more, there should be advocacy for those who cannot necessarily afford to own a home in a suburb to retain access to a municipally maintained greenspace. Park Place's analysis advocates for change and sends an urgent message to decision-makers to consider prioritizing and preserving accessible green space in transit-oriented inner-city areas to help maintain residents' overall health.

# Data Sources and Acknowledgements

Region of Waterloo Open Data Portal: [Sidewalks](https://opendata-city-of-waterloo.opendata.arcgis.com/datasets/f49efdef08544349bf08cf7ba4fd7ec5_0/explore), [GRT Routes](https://opendata-city-of-waterloo.opendata.arcgis.com/datasets/16e0ab66dadf4044a5be144e9d88effb_4/explore), [Cycling Infrastructure](https://opendata-city-of-waterloo.opendata.arcgis.com/datasets/416741dbcb40451899b84ca7e10a80ee_0/explore), [Parks](https://opendata-city-of-waterloo.opendata.arcgis.com/datasets/f23fd60e88de4624b77cc328f16378bd_0/explore), and [Municipal Boundary](https://opendata-city-of-waterloo.opendata.arcgis.com/datasets/eda133697fd446db92dec930f162a700_0/explore) polygons.

Statistics Canada (2021 Census): Total - Private households by tenure; Total - Tenant households in non-farm, non-reserve private dwellings; Average monthly shelter costs for rented dwellings ($) by censusdissemination area.

Statistics Canada, Data from 2021 Census, accessed February 17, 2025. Reproduced and distributed on an "as is" basis with the permission of Statistics Canada, per the Statistics Canada Open Licence.
von Bergmann, J., Aaron Jacobs, Dmitry Shkolnik (2022). [cancensus: R package to access, retrieve, and work with Canadian Census data and geography.](https://mountainmath.github.io/cancensus/index.html) v0.5.7.

# Methodology (and Assumptions)

1. City of Waterloo park data was loaded into ArcGIS Pro. Due to the point-to-point logic constraints of network analysis, park polygons were converted into points using the feature vertices to points tool. For simplicity, these vertices serve as approximations of pedestrian entry points into the parks. 
2. The sidewalk, GRT route, and cycling infrastructure datasets were updated to include travel time information. Travel speeds of 5 km/h for walking, 10 km/h for biking, and 40 km/h for buses were assumed based on GRT and Google Maps data.
3. Utilizing ArcGIS's Network Analyst extension, 15-minute service areas were created using park vertices as facilities and route layers as the network.
4. Binary rasters based on the presence or absence of a bike/bus/walking service area clipped to the city boundary of Waterloo were created and summed with equal weight into an accessible transit index raster with a scale from 0-3.
5. Dissemination area polygons were loaded into the project, clipped to the regional boundary, and joined to a census statistics table with information on the proportion of people renting in each area, the average rent in the area, and the proportion of renters spending > 30% of their income on housing, which was chosen to display the inequitable park area because Waterloo has a large renting population due to its post-secondary institutions. Other metrics, such as average income, could have also been chosen.
6. Each census statistic was mapped and rasterized. The rasters were then reclassified on a scale of 1-5 for each statistic with the Natural Breaks method.
7. The census rasters were weighted equally, merged, and subjected to a sensitivity analysis (+/-5% weights for each of the three rasters) to check the model robustness and create the rental factors raster. The sensitivity analysis displayed no significant differences between the rasters.
8. The Transit Index raster was then subtracted from the Rental Factors raster to create a suitability raster of Waterloo areas with the highest housing hardship and the lowest green space accessibility. 
9. The resulting park disparity raster was reclassified on a scale of 1-5 to show park disparity on a scale of 5 classes.

## List of Geoprocessing Tools Used

1. Feature vertices to points
2. Calculate field
3. Create feature dataset
4. Import feature class
5. Create network dataset
6. Build network
7. Import facilities
8. Solve (service areas)
9. Polygon to raster
10. Reclassify
11. Weighted sum
12. Minus

# Limitations 

1. Reclassification involves grouping data into broader categories, which reduces the level of detail and precision. While this simplifies complex datasets for easier analysis or interpretation, it sacrifices the ability to observe subtle variations that might be present in more granular data. Though useful for simplifying information or protecting privacy, reclassification can lead to oversimplification and missing nuanced trends.
2. We are operating under the assumption that accessing parks via roads without dedicated sidewalks, bus lanes, or bike infrastructure is unsafe or less feasible, particularly for individuals with disabilities. While it's technically possible for people to access these parks using such roads, it presents significant safety risks, as roads without proper pedestrian or cycling infrastructure can be hazardous, increasing the likelihood of accidents or injury. For people with disabilities, this is a concern, as they may face additional barriers in navigating areas not designed with accessibility in mind. 
3. The 2021 census, while valuable in providing a snapshot of housing conditions, does not fully capture the ongoing dynamics of the housing crisis. Housing markets are constantly changing, such as shifts in supply and demand, economic fluctuations, government policies, and social trends. Despite these limitations, the 2021 census remains the closest approximation to understanding the scale and distribution of the housing crisis, offering a foundation for policymakers and researchers to assess trends, identify gaps, and make informed decisions until more up-to-date data becomes available.
4. Speed assumptions are taken from worldwide averages. Some people walk faster or slower.
5. Park polygon vertices for entrances are a good approximation, but they may exclude entrances through dedicated park paths. The Region of Waterloo does not have park entrance data available.
6. Using dissemination areas to represent a whole population creates a loss of detail in data. The average monthly in an area can range drastically, where the possible rental rates range from $400-$1600/month.
7. As the scope of this analysis focuses on municipally-owned greenspaces, this analysis excludes greenspaces maintained by public institutions, such as the University of Waterloo.
8. This analysis excludes Laurel Creek Conservation Area, as the park requires an $8 admission fee and is not freely accessible. 

# User Guide and App Capabilities

The Park Place app is built in ArcGIS Experience Builder, a no- to low-code solution that promotes re-use and replication by other municipalities and community groups. Park Place is best viewed in desktop environments (i.e., on a PC or laptop).

The app is set up with three views, accessible from the top-right corner of the screen; Park Disparity, Rental Factors and Transit Index. The Park Disparity view shows access to parks and greenspaces on a five-step scale from low to high, while the Rental Factors shows its respective suitability raster on a four-step scale. The Transit Index view shows access to transit throughout the City of Waterloo, with areas accessible using pedestrian, cycling and/or transit facilities classified on a three-step scale. Layers can be turned on or off using the layer control button along the right edge of the app.

The app also features a widget controller for each view, containing Query, Filter, and Add Data functionalities. The Query widget allows you to retrieve information from a data source by running an attribute or spatial filter query. The results of a query generate an output data source that other widgets can use. The Filter widget allows you to limit the visibility of features in one or more layers to only those that meet the expression criteria. You can apply filters to multiple layers with group filters. Changes made in a Filter widget affect data across your app, so other widgets that use the same layers are filtered accordingly. The Add Data widget allows you to temporarily add data sources to the app at run time. You can add data from ArcGIS content, a URL, or local storage. You can manage and filter added data and view data in maps and tables. Importantly, you cannot save data.

# Discussion

Our map displays large areas of park disparity in central Waterloo and the city outskirts. Though greenspaces are accessible through walking, biking, and public transit, people do not have adequate greenspace access because of the scarcity created by urbanization. Generally, residents in the city core have access to fewer usable green spaces and higher rental costs. Additionally, [rental corporations have significantly increased rents in student housing](https://www.therecord.com/news/waterloo-region/apartment-vacancies-surge-in-waterloo-region-as-foreign-students-depart-but-rents-keep-rising/article_cd494dc3-bcc1-5a52-9d5c-ce4d80884292.html) near the Waterloo and Laurier campuses, leading to higher rental disparity. On the outskirts of Waterloo, park disparity occurs because of high rental inequity and lack of accessible methods to get to greenspaces. While many green spaces exist on the city's edge, they are often only accessible by cars, not by cycling, walking, or public transit. While people could walk or cycle on the side of the road, higher speed limits in rural areas compared to the city center and lack of pedestrian infrastructure create valid safety concerns.
Furthermore, rent in this area is generally higher because people live in single-family homes or luxury apartments, which leads to a higher rental disparity score. There are both accessible parks and lower rental costs between central Waterloo and the outskirts of the city, so these areas generally have the lowest park disparity.

# Other Sources

