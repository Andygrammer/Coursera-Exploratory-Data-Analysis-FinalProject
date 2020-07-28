# 1. Load data frame
data_summary <- readRDS("../summarySCC_PM25.rds")
data_source <- readRDS("../Source_Classification_Code.rds")

# 2. Question: Of the four types of sources indicated by the type (point,
# nonpoint, onroad, nonroad) variable, which of these four sources have seen
# decreases in emissions from 1999–2008 for Baltimore City? Which have seen
# increases in emissions from 1999–2008?
total_emissions_by_year_baltimore_set <- subset(data_summary, 
                                                data_summary$fips=="24510")
total_emissions_by_year_baltimore <- aggregate(
  total_emissions_by_year_baltimore_set$Emissions, 
  by=list(total_emissions_by_year_baltimore_set$type,
          total_emissions_by_year_baltimore_set$year), FUN=sum)

colnames(total_emissions_by_year_baltimore) <- c("Type", "Year", "Emissions")

# 3. Create the plot (with ggplot2)
library(ggplot2)
ggsave("plot3.png", width=13, height=13, units="cm")

qplot(Year, Emissions, data=total_emissions_by_year_baltimore, 
      color=Type, geom="line") +
  ggtitle("Total Emissions of PM2.5 in Baltimore City, Maryland") +
  xlab("Year") +
  ylab("Total Emissions (tons)")




