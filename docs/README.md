# Greenspaces-Of-Ontario-Student-Encouragers

# Team
Harry Cheung
Brandon Que 
Matthew Woodward

# App Logo

<img src="../App Challenge Images/Park_Place-logo.png" style="height:300px; margin:0 .5em .25em 0; float: left;" /> 

# Mission Statement and Background

As urban populations grow, there is an increasing demand for housing, commercial spaces, and infrastructure, such as roads, schools, and hospitals. This demand often leads to land repurposing previously dedicated to parks, gardens, and other green spaces. Urban planners may prioritize new construction projects to accommodate the rising population rather than preserving or expanding existing green space.

This reduction in parkland results from the growing pressure on land in cities. As cities sprawl outward or undergo vertical development, the available space for recreational areas often shrinks. In some cases, where green spaces remain, they may be smaller and less accessible due to increased traffic, commercial developments, or higher property values pushing out the people, such as low-income renters, who rely on these parks for their well-being.

The City of Waterloo has experienced drastic urbanization in the past few decades; as more and more land develops into student housing, research & technology parks, and high-rise rental properties within the city core, the greenspace that urban renters have access to is disappearing at an alarming rate. Boasting a unique reputation as a student town due to its prestigious post-secondary institutions, Waterloo has also seen a decrease in homeownership rates and more renters in the market compared to the provincial and federal average (2021 City of Waterloo Census Bulletin). With the announcement of future infrastructure projects, such as a new "state-of-the-art" hospital soon to be built on the University of Waterloo campus, the overall amount of accessible greenspace will only continue to decrease. 

Park Place, inspired by the iconic and high-value property in Monopoly, symbolizes the growing wealth divide in urban areas. The name reflects the historical idea that certain parks, often located in central or desirable areas of a city, are seen as premium spaces—just as Park Place in Monopoly is one of the most expensive properties on the board. However, these so-called "park places" are increasingly out of reach for low-income renters, particularly in inner-city neighbourhoods. The rise of gentrification and urban development has led to a situation where these green spaces, originally designed to be public and accessible, are now monopolized by those who can afford to live nearby or own property in these desirable areas.

Park Place, built in response to the widening gaps of urban green space inequity, is a powerful tool to raise awareness about the growing issue of parkland accessibility. Our app raises awareness that so-called "park places" are becoming less accessible and highlights the disparities in how green spaces are distributed and used in urban areas. By focusing on the inequalities in park access, especially in low-income, inner-city communities, the app brings the issue to the forefront of public conversation.

With greenspaces playing an ever-increasing role in mental health, physical wellness, air quality, the urban heat island effect, and more, there should be advocacy for those who cannot necessarily afford to own a home in a suburb to retain access to a municipally maintained greenspace. Park Place's analysis advocates for change and sends an urgent message to decision-makers to consider prioritizing and preserving accessible green space in transit-oriented inner-city areas to help maintain residents' overall health.

# Explanation of Index

# Data Sources

Region of Waterloo Open Data Portal: Sidewalks, GRT Routes, Cycling Infrastructure, City Boundary, and Park Polygons.
Canadian Census and Census Mapper: Census Dissemination Area Polygons, Proportion of People Renting in each DA, Average Rent in each DA, Proportion of renters Spending > 30% of income on rent.

# Methodology (and assumptions)

1. Park data was loaded into ArcGIS Pro and park vertices were extracted from park polygons.
   a) Park vertices were the best approximation for park entrances in further analysis as many straight edges in parks are covered by treelines or fencelines
2. Sidewalk, GRT route, and cycling infrastructure data were added to the project and travel time information was added to the layers.
   a) Speed assumed to be 5 km/h for walking, 10 km/h for biking, and 40 km/h for buses
3. Networks were created for each route layer, and 15-minute service areas were created using park vertices as facilities.
4. Binary rasters based on the presence or absence of a bike/bus/walking service area clipped to the city boundary of Waterloo were created and summed with equal weight into an accessible transit index raster that has a scale from 0-3.
5. Census Dissemination area polygons were loaded into the project, clipped to the regional boundary, and joined to a census statistics table with information on the proportion of people renting in each area, the average rent in the area, and the proportion of renters spending > 30% of their income on housing.
   a) These metrics were selected to display the inequitable distribution of parks for our area because Waterloo is a city with a large portion of its population
   renting due to its two universities and one college. Other metrics like average income could have been chosen as well.
6. Each census statistic we utilized was mapped and rasterized. The rasters were then reclassified on a scale of 1-5 for each statistic using the natural breaks method.
7. The census rasters were then added together with equal weighting, and subject to a sensitivity analysis (+/-5% weights for each of the 3 rasters) to see how robust the model was. This created our Rental Factors raster.
   a) The sensitivity analysis displayed no significant differences.
8. The Transit Index raster was then subtracted from the Rental Factors raster to create a suitability raster of the areas of Waterloo that have the highest housing hardship and have the least ability to access green space. 
9. This new raster of park disparity was then reclassified on a scale of 1-5 to show park disparity on a scale of 5 classes.

# Limitations 

1. Reclassification limits the amount of detail and granularity displayed by data.
2. We are assuming that people cannot access parks on roads without sidewalks, bus lanes, or bike infrastructure in this analysis. They can, just not as safely and being next to roads is often not an option for people with disabilities.
3. Speed assumptions are taken from worldwide averages. Some people walk faster or slower.
4. Using vertices of park polygons for entrances is a good approximation, but it may exclude entrances through dedicated park paths (for which the Region of Waterloo does not have data).
5. Using dissemination areas to represent a whole population creates a loss of detail in data. For example, one person in a high-rent area could be paying $400/month while someone else could be paying $1600/month.
6. This analysis excludes greenspaces maintained by the University of Waterloo and focuses on municipal services because most people do not live on the University of Waterloo campus.
7. This analysis excludes Laurel Creek Conservation Area because one needs to pay $8 to be admitted to the park.

# User Guide and App Capabilities

# General Workflow Process

# Discussion

# Other Sources

