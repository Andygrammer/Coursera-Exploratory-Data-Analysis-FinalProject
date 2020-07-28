# 1. Load data frame
data_summary <- readRDS("../summarySCC_PM25.rds")
data_source <- readRDS("../Source_Classification_Code.rds")

# 2. Question: Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, California
# (fips == "06037"). Which city has seen greater changes over time in motor
# vehicle emissions?
car_emissions_LA_data <- subset(data_summary, data_summary$fips=="24510" |
                                   data_summary$fips=="06037" &
                                   data_summary$type=="ON-ROAD")

car_emissions_LA_by_year <- aggregate(car_emissions_LA_data$Emissions,
                                   by=list(car_emissions_LA_data$fips,
                                           car_emissions_LA_data$year), FUN=sum)

colnames(car_emissions_LA_by_year) <- c("City", "Year", "Emissions")

# 3. Create the plot
library(ggplot2)
ggsave("plot6.png", width=13, height=13, units="cm")

qplot(Year, Emissions, data=car_emissions_LA_by_year, 
      color=City, geom="line") +
  ggtitle("Total Emissions of PM2.5 in Baltimore City, and LA County") +
  xlab("Year") +
  ylab("Total Emissions (tons)")
