# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW7

# 1. Write code to simulate the throwing of a 6-sided die (singular of dice).
#    Using your code, throw a pair of dice 1000 times,
#    and calculate the number of times the numbers add up to 8.
sample(1:6, 1, replace=TRUE)
z <- vector()
for(i in 1:1000){
  x <- sample(1:6, 1, replace=TRUE)
  y <- sample(1:6, 1, replace=TRUE)
  z <- c(z, x+y)
}
print(sum(z == 8))

# 2. Open up your dataset in R.
#    (using read.table, read.csv, etc.
#    Or whatever function might be specific for your particular kind of data). 
mydata <- read.csv("abbgen1k.csv", stringsAsFactors=F)
head(mydata)

# 3. Describe the dataset to me. What are its dimensions?
#    What kind of data are in the columns?
#    If the dataset is gigantic, just pick a few of the important columns to describe to me. 
dim(mydata)
# ANS: The dataset is a 15912 x 179 table that contains information of SNP's of chromosome 22.
#      Columns 1 through 9 contain details about the SNP. Columns 10 to 90 contain
#      the genotype of different European individuals while columns 91 to 179 contain
#      the genotype of different African individuals.

# 4. Make a plot of something from your data. Make some kind of visual interpretation.
getHaplotype <- function(genotype, getLeft) {
  strlist <- strsplit(genotype, '|', fixed=T)
  # function for lapply to extract left or right
  getLeftOrRight <- function(vec, getLeft) {
    if(getLeft == T) {
      return(vec[1])
    } else {
      return(vec[2])
    }
  }
  # turn list into vector then return
  result <- unlist(lapply(strlist, getLeftOrRight, getLeft))
  return(result)
}

individual <- 10:179
region <- individual < 91
alts <- vector()
for (i in 10:179) {
  haplo <- getHaplotype(mydata[,i], T)
  num_alt <- sum(haplo == '1')
  alts <- c(alts, num_alt)
}
processed_data <- data.frame(cbind(individual, region, alts))
head(processed_data)

dev.new()
boxplot(processed_data$alts~processed_data$region)

# 5. Run some statistical analysis on your data to complement the plot you made in #3.
# Chances are the analysis will be something like an lm(), aov(), t.test(), wilcox.test() etc.
# but really it can be anything you find valuable. 
mydata_aov <- aov(alts~region, data=mydata)
summary(mydata_aov)
