# 1. Load data frame
data_summary <- readRDS("../summarySCC_PM25.rds")
data_source <- readRDS("../Source_Classification_Code.rds")

# 2. Question: Across the United States, how have emissions from coal
# combustion-related sources changed from 1999–2008?
coal_code <- data_source[grepl("Coal", data_source$Short.Name), ]
coal_data <- data_summary[data_summary$SCC %in% coal_code$SCC, ]

coal_emissions_by_year <- aggregate(coal_data$Emissions,
                                    by=list(coal_data$year), FUN=sum)

colnames(coal_emissions_by_year) <- c("Year", "Emissions")

# 3. Create the plot
png("plot4.png")
plot(coal_emissions_by_year$Year, coal_emissions_by_year$Emissions, type="o",
     main="Coal Emissions in the US from 1999-2008",
     xlab="Year",
     ylab="Total Emissions (tons)")
dev.off()