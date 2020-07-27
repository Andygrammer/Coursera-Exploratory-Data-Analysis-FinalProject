# 1. Load data frame
data_summary <- readRDS("../summarySCC_PM25.rds")
data_source <- readRDS("../Source_Classification_Code.rds")

# 2. Question: Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008?
total_emissions_by_year <- aggregate(data_summary$Emissions, by=list(year=data_summary$year), FUN=sum)

total_emissions_by_year

# 3. Create the plot
png("plot1.png", width=480, height=480)
plot(total_emissions_by_year$year, total_emissions_by_year$x,
     type="l",
     main="Total Emissions of PM2.5 in the US",
     xlab="Year",
     ylab="Total Emissions of PM2.5 (tons)")
dev.off()