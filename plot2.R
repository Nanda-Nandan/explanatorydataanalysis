if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

baltimoreData <- NEI %>% 
  filter(fips == "24510") %>% 
  group_by(year) %>% 
  summarize(Annual.Total = sum(Emissions));
baltimore.scale <- pretty(baltimoreData$Annual.Total/1000);
plot(baltimoreData$year, baltimoreData$Annual.Total/1000, type = "l", lwd = 2, axes = FALSE,
     xlab = "Year", 
     ylab = expression("Total Tons of PM"[2.5]*" Emissions"), 
     main = expression("Total Tons of PM"[2.5]*" Emissions in Baltimore"));
axis(1, at = c(1999,2002,2005,2008));
axis(2, at = baltimore.scale, labels = paste(baltimore.scale, "K", sep = ""));
box()