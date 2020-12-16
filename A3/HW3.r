# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW3

# 1. What is statistical power? What is Type I error? What is Type II error?
# ANS: Statistical power is the probability that the test correctly rejects the false null hypothesis.
#      Type I error is when the null hypothesis is incorrectly rejected when it is actually true.
#      Type II error is when the null hypothesis is incorrectly accepted when it is actually false.

# 2. Let's imagine that I would have to pay a million dollars if I falsely rejected a null hypothesis.
#    I would not have to pay anything if I failed to reject a false null.
#    What alpha should I use if I didn't want to pay a million dollars?
# ANS: You should use a low value for alpha (lower value for lower risk ie 0 for no risk)

# 3. Single regression. Use the 'trees' dataset that comes with base R to conduct the following analysis.
mydata = trees
head(mydata)
#    a) Plot Volume as a function of Height
dev.new()
plot(mydata$Volume~mydata$Height)

#    b) Add a regression line to your plot in 1a
reg_line = lm(mydata$Volume~mydata$Height)
abline(reg_line)
dev.off()

#    c) Obtain the intercept and slope for the regression line
coefficients(reg_line)
#    ANS: intercept: -87.12361
#         slope: 1.54335

#    d) Obtain the p-value and adjusted R-squared for your regression model.
summary(reg_line)
#    ANS: p-value: 0.0003784
#         adjusted R-squared: 0.3358

#    e) Provide a brief interpretation of the results for this single regression.
#       Discuss the relationship between Height and Volume, as well as the obtained p-values
#       and adjusted R-squared. (Can be done in two sentences).
#    ANS: It seems like there is a positive correlation between height and volume.
#         The low p-value indicates that the probability of there being no correlation is low while
#         the low-ish adjusted R-squared value indicates perhaps there is another variable in play.

# 4. Multiple regression. Use the 'trees' dataset that comes with base R to conduct the following analysis.
mydata = trees
head(mydata)
#    a) Plot all pairwise combinations of Girth, Height, and Volume.
dev.new()
plot(mydata$Girth~mydata$Height)
plot(mydata$Girth~mydata$Volume)
plot(mydata$Height~mydata$Girth)
plot(mydata$Height~mydata$Volume)
plot(mydata$Volume~mydata$Girth)
plot(mydata$Volume~mydata$Height)
dev.off()

#    b) Conduct a multiple regression in which you model Volume as a function of Height and Girth.
#       What are the intercept and slope terms?
reg_line = lm(mydata$Volume ~ mydata$Height + mydata$Girth)
coefficients(reg_line)
#    ANS: intercept: -57.9876589
#         slope (height): 0.3392512
#         slope (girth): 4.7081605

#    c) Provide a brief interpretation of the results for this multiple regression.
summary(reg_line)
#    ANS: It seems height and girth are positively correlated with volume.
#         The low p-value indicates that the probability of correlation is high while
#         the high adjusted R-squared value indicates that both variables are good predictors of volume.
