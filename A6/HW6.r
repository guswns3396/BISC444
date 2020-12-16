# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW6

wine<-read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep=",")
names(wine)<-c(
  'wine_type',
  'Alcohol',
  'Malic_acid',
  'Ash',
  'Alcalinity_of_ash',
  'Magnesium',
  'Total_phenols',
  'Flavanoids',
  'Nonflavanoid_phenols',
  'Proanthocyanins',
  'Color_intensity',
  'Hue',
  'OD280_div_OD315',
  'Proline'
)

# 1. Lean and use the tapply function to calculate the mean Color_intensity per wine type.
# (so you should report three different means).
index = wine$wine_type
means = tapply(wine$Color_intensity, index, mean)

# 2. Make a plot of Flavanoids by Nonflavanoid_phenols.
# Instead of symbols, use text() to plot wine_type.
dev.new()
wine_plot_data = c(wine$Nonflavanoid_phenols, wine$Flavanoids, wine$wine_type)
head(wine_plot_data)
plot(x=wine$Nonflavanoid_phenols, y=wine$Flavanoids, type='n')
plot_func = function(my_data) {
  len = length(my_data)
  nonflav = my_data[1:(len/3)]
  flav = my_data[((len/3)+1):(2*len/3)]
  type = my_data[((2*len/3)+1):(len)]
  print(length(nonflav))
  print(length(flav))
  print(length(type))
  text(x=nonflav, y=flav, labels=type[1])
}
tapply(wine_plot_data, c(index, index, index), plot_func)
dev.off()

# 3. Read in time series data 
births <-scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthstimeseries<-ts(births, frequency=12, start=c(1946,1))
# Describe what the ts() function is doing here.
# Plot the data and qualitatively interpret the birth trend. 
# ANS: The ts() function is taking the data for births and making a time series object.
#      It starts from the year 1946 and takes 1 entry from the births vector for each of the 12 months
plot(birthstimeseries)
# ANS: There is a periodic fluctuation in births every year according to the month.
#      but in general, the number of births increase every year since 1948.