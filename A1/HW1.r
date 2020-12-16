# Hyun-Joon Yang
# yanghyun@usc.edu
# BISC 444
# HW1

# 1. Assign 'mtcars' to variable 'my_table'
my_table = mtcars

# 2. What are the dimensions of the table?
dim(my_table)
# ANS: 32 rows, 11 columns

# 3. Pull out the subset of cars that have a 'mpg' greater than 25 and a value of 'gear' equal to 4.
#    How many cars do you get? What are their names?
my_table[my_table$mpg > 25 & my_table$gear == 4,]
# ANS: 4 cars (Fiat 128, Honda Civic, Toyota Corolla, Fiat X1-9)

# 4. Convert the mpg column to kilometers per gallon and add it as another column to my_table
my_table$kpg = my_table$mpg * 1.60934 # 1mi = 1.60934 km
