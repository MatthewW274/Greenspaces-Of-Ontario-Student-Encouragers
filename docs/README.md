# Greenspaces-Of-Ontario-Student-Encouragers

# Team
Harry Cheung
Brandon Que 
Matthew Woodward

# App Logo

<img src="../App Challenge Images/Park_Place-logo.png" style="height:300px; margin:0 .5em .25em 0; float: left;" /> 

# Mission Statement and Background

Historically, parks have been located on the outskirts of cities in newer subdivisions, leaving inner-city renters underpriveleged when it comes to greenspace access. In the City of Waterloo especially, as land is quickly being turned into high-rise rental properties within the inner-city, the greenspaces that inner-city renters do have access too are disappearing. This greenspace inequity is what inspired our app's name, Park Place. Park Place is one of the most expensive properties in the game Monopoly. The idea behind our app is to raise awarness that so called "park places" are getting less accessible for less fortunate renters in inner-cities and are increasingly being monopolized by richer suburbanites who can easily hop in a car. With greenspaces playing an ever-increasing role in mental health improvement, physical activity, and better air quality, there should be advocacy for those who cannot necessarily afford to own a home and a car in a suburb to still have access to a municipally maintained greenspace. Through a combination of accesibility and housing disparity analysis, Park Place's app advocates for change and sends an urgent message to decision makers to consider prioritizing greenspace preservation in accessible, transit-oriented, inner-city areas to help maintain resident's overall health.

# Explanation of Index

# Data Sources

Region of Waterloo Open Data Portal: Sidewalks, GRT Routes, Cycling Infrastructure, City Boundary, and Park Polygons.
Canadian Census and Census Mapper: Census Dissemination Area Polygons, Proportion of People Renting in each DA, Average Rent in each DA, Proportion of renters Spending > 30% of income on rent.

# Methodology (and assumptions)

1. Park data was loaded into ArcGIS Pro and park vertices were extracted from park polygons.
   a) Park vertices were the best approximation for park entrances in further analysis as many straight edges in parks are covered by treelines or fenclines
2. Sidewalk, GRT route, and cycling infrastructure data was added to the project and travel time information was added to the layers.
   a) Speed assumed to be 5 km/h for walking, 10 km/h for biking, and 40 km/h for buses
3. Networks were created for each route layer, and 15 minute service areas were created using park vertices as facilities.
4. Binary rasters based on presence or absence of a bike/bus/walking service areas clipped to the city boundary of Waterloo were created and summed with equal weight into an accessible transit index raster that has a scale from 0-3.
5. Census Dissemination area polygons were loaded into the project, clipped to the regional boundary, and joined to a census statistics table with information on the proportion of people renting in each area, the average rent in the area, and the proportion of renters spending > 30% of their income on housing.
   a) These metrics were selected to display inequitable distribution of parks for our area because Waterloo is a city with a large portion of its population
   renting due to its two universities and one college. Other metrics like average income could have been chosen as well.
6. Each census statistic we utilized was mapped and rasterized. The rasters were then reclassified on a scale of 1-5 for each statstic using the natural breaks method.
7. The census rasters were then added together with equal weighting, and subject to a sensitivity analysis (+/-5% wieghts for each of the 3 rasters) to see how robust the model was. This created our Rental Factors raster.
   a) The sensitivity analysis displayed no significant differences.
8. The Transit Index raster was then subtracted from the Rental Factors raster to create a suitability raster of the areas of Waterloo that have the highest housing hardship and have the least ability to access greenspace. 
9. This new raster of park disparity was then reclassified on a scale of 1-5 to show park disparity on a scale of 5 classes.

# Limitations 

1. Reclassification limits the amount of detail and granularity displayed by data.
2. We are assuming that people cannot access parks on roads without sidewalks, bus lanes, or bike infrastructure in this analysis. They can, just not as safely and being next to roads is often not an option for people with disabilities.
3. Speed assumptions are taken from worldwide averages. Some people walk faster or slower.
4. Using vertices of park polygons for entrances is a good approximation, but it may exclude entrances through dedicated park paths (for which the Region of Waterloo does not have data).
5. Using dissemination areas to represent a whole population creates loss of detail in data. For example, one person in a high rent area could be paying $400/month while somone else could be paying $1600/month.
6. This analysis excludes greenspaces maintained by the University of Waterloo and focuses on municipal services because most people do not live on UW campus.
7. This analysis excludes Laurel Creek Conservation Area because one needs to pay $8 to be admitted to the park.

# User Guide and App Capabilities

# General Workflow Process

# Discussion

# Other Sources

