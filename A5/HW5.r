# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW5

# Perform a Principal Components Analysis on Aplodontia skull data (file= 617aplodontiadata.txt).
# Note that this is a real data file, and real data files can have errors, missing values, and mistakes.
# In the real world, you will need to make decisions about how to deal with such messiness. 

# Read in the data. Summarize the Sex column and the Subspecies column.
# How many unique values are there in each column, and how many skulls exist for each value?
# How many specimens are NA in those two columns?  
mydata = read.table(file='617aplodontiadata.txt', header=TRUE, stringsAsFactors=FALSE, sep='\t')
head(mydata)
table(mydata$Sex, useNA='always')
table(mydata$Subspecies, useNA='always')

# Run PCA on the 22 data columns "Basal" through "AlveolarLgthLwrChkth".
# (HINT: first you will have to index out the right columns.
# ANOTHER HINT: PCA can't work on data with missing values (NA),
# so you will have to throw out any skulls with missing measurements.
# You can do this with the complete.cases() function)
a = which(names(mydata) == 'Basal')
b = which(names(mydata) == 'AlveolarLgthLwrChkth')
mydata_pca = mydata[,a:b]
head(mydata_pca)
complete = complete.cases(mydata_pca)
mydata_pca = mydata_pca[complete == TRUE,]
head(mydata_pca)
result_pca = prcomp(mydata_pca, scale=TRUE, center=TRUE)

#	How much variance is explained by PC1? 
summary(result_pca)

# How many specimens have a known (and legitimate entry) for Sex and Subspecies?
# INDEX only those specimens that have legitimate entries for both Sex and Subspecies.
# Using only specimens with legitimate Sex and Subspeciecs,
# test whether PC1 is a function of both Sex and Subspecies.
# To simply output, you can pass your lm object into the anova function,
# like this: anova(lm()). Interpret the results
complete_sex = complete.cases(mydata$Sex) & (mydata$Sex == 'FE' | mydata$Sex == 'MA')
complete_subspecies = complete.cases(mydata$Subspecies) & mydata$Subspecies != ''
indices = which(complete_sex & complete_subspecies)
length(indices)
table(mydata[indices,c('Sex', 'Subspecies')])
PC1 = result_pca$x[,'PC1']
anova(lm(PC1[indices] ~ mydata[indices,'Sex'] + mydata[indices, 'Subspecies']))

# Make a plot of x=PC1 and y=PC2. Interpret.
# Are there any outliers? Learn and use the identify(x=PC1, PC2, n=1, labels=?)
# to identify the Catalog number of the outlier. 
PC2 = result_pca$x[,'PC2']
dev.new()
plot(x=PC1, y=PC2)
index = identify(x=PC1, y=PC2, n=1, labels='?')
dev.off()
print(paste(PC1[index], PC2[index]))
