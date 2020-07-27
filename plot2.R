# 1. Load data frame
data_summary <- readRDS("../summarySCC_PM25.rds")
data_source <- readRDS("../Source_Classification_Code.rds")

# 2. Question: Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008?
total_emissions_by_year_baltimore_set <- subset(data_summary, 
                                                data_summary$fips=="24510")
total_emissions_by_year_baltimore <- aggregate(
  total_emissions_by_year_baltimore_set$Emissions, 
  by=list(total_emissions_by_year_baltimore_set$year), FUN=sum)

# 3. Create the plot
png("plot2.png", width=480, height=480)
plot(total_emissions_by_year_baltimore$Group.1, 
     total_emissions_by_year_baltimore$x,
     type="l",
     main="Total Emissions of PM2.5 in Baltimore City, Maryland",
     xlab="Year",
     ylab="Total Emissions of PM2.5 (tons)")
dev.off()