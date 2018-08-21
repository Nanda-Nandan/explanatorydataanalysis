if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

annualData <- NEI %>% group_by(year) %>% 
  filter(year == 1999|2002|2005|2008) %>% 
  summarize(Annual.Total = sum(Emissions));
pts <- pretty(annualData$Annual.Total/1000000);
yrs <- c(1999,2002,2005,2008)
plot(annualData$year, annualData$Annual.Total/1000000, type = "l", lwd = 2, axes = FALSE,
     xlab = "Year(1999-2008)", 
     ylab = expression("Total Tons of PM"[2.5]*" Emissions"), 
     main = expression("Total Tons of PM"[2.5]*" Emissions in US"));
axis(1, at = yrs, labels = paste(yrs));
axis(2, at = pts, labels = paste(pts, "M", sep = ""));
box()