# 1. Load data frame
data_summary <- readRDS("../summarySCC_PM25.rds")
data_source <- readRDS("../Source_Classification_Code.rds")

# 2. Question: How have emissions from motor vehicle sources changed from
# 1999–2008 in Baltimore City?
car_emissions_data <- subset(data_summary, data_summary$fips=="24510"
                             & data_summary$type=="ON-ROAD")

car_emissions_by_year <- aggregate(car_emissions_data$Emissions,
                                    by=list(car_emissions_data$year), FUN=sum)

colnames(car_emissions_by_year) <- c("Year", "Emissions")

# 3. Create the plot
png("plot5.png")
plot(car_emissions_by_year$Year, car_emissions_by_year$Emissions, type="o",
     main="Emissions from motor vehicles from 1999-2008 in Baltimore City",
     xlab="Year",
     ylab="Total Emissions (tons)")
dev.off()