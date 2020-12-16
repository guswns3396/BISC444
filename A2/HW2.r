# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW2

# 1. Read through the help page for 'par'.
#    Describe three plotting parameters that are listed in par and seem useful to you,
#    but are not described in the documentation for 'plot'
# ANS: din, ps, tck

# 2. Use a for loop to generate the number series 2 * i + 1, going from i = 1 to i = 10.
ans_2 = c()
for (i in 1:10) {
  ans_2 = c(ans_2, 2 * i + 1)
}
print(ans_2)

# 3. Make a plot with the following properties:
#    a) x values are 1:10
#    b) y values are 21:30
#    c) plot type is points,
#    d) plot character is filled diamonds
#    e) points are plotted in red
#    f) the y-axis goes from 0 to 30 (hint. use ylim option), and 
#    g) the plot has a title that says 'My Plot'.
dev.new()
plot(x=1:10, y=21:30, type='p', col='red', pch=18, ylim=c(0, 30))
title('My Plot')

# 4. Make a new version of your plot where you add to the original plot using the points function.
#    Use the histogram "type", with x going from 1 to 10 and y going from 15 to 6,
#    and the color set to blue
points(x=1:10, y=15:6, type='h', col='blue')
dev.off()

# 5. Use the 'Orange' dataset that comes preloaded in base R.
#    For all tests in this question, conduct two-sided tests with default parameters,
#    unless otherwise specified.
#   a.	Conduct a one-sample t-test to determine whether the mean circumference
#       of all trees of age 118 is equal to 0. Report the p-value. What is the interpretation?
mydata = Orange
trees_118 = mydata[mydata$age == 118,]
result = t.test(x=trees_118$circumference, mu=0)
print(result$p.value)
#   ANS: the probability of the trees of age 118 having the observed circumferences given
#        the null hypothesis is true (mean circumference is 0) is very small (p = 1.036622 * 10^-6) thus
#        null hypothesis should be rejected => mean circumference of all trees of age 118 is not 0

#   b.	Conduct the same test as in 1a but set mu = 31. Report the p-value. What is the interpretation?
result = t.test(x=trees_118$circumference, mu=31)
print(result$p.value)
#   ANS: the probability of the trees of age 118 having the observed circumferences given
#        the null hypothesis is true (mean circumference is 31) is high (p = 1) thus
#        the null hypotheses should be accepted => mean circumference of all trees of age 118 is 31

#   c.	What are the null and alternative hypotheses for one-sample t-tests?
#   ANS: The null hypothesis is the hypothesis that the mean circumference of the population
#        (all trees of age 118) is the same as the mean circumference of the sample (trees of age 118
#        in the dataset) whereas the alternative hypothesis is that the two means are different.

# 6. Describe what you think your class project might be about in 2-3 sentences.
#    Can be very vague at this point.
# ANS: I would like to use the MRI images that have been segmented for White Matter Hyper-intensities
#      and see if there is a correlation between volume of WMH and cognitive deficits. I will take into
#      account other variables as well, such as age, whether the individual has neurological disease, sex,
#      etc.
