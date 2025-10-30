#Q No. 2 — R Programming & Data Structures----
#Dataset-Based Questions
#i. Extract Salary Column & Calculate Average
salary <- c(50000, 60000, 70000, 80000, 50000, 65000, 45000, 60000)
mean_salary <- mean(salary)
mean_salary  # Output: 60000
#ii. Store Ages & Find Min/Max
ages <- c(34, 29, 40, 30, 35, 27, 41, 30)
min_age <- min(ages)
max_age <- max(ages)
min_age  # Output: 27
max_age  # Output: 41
#iii. Create List for One Employee
employee1 <- list(Name = "X", Dept = "HR", Age = 34, Salary = 50000)
employee1
#iv. Why Lists Are Better Than Vectors\
Lists can store multiple data types (e.g., character, numeric, logical) in one structure, while vectors require homogeneous types. This makes lists ideal for representing complex entities like employee records.
#v. R Code for Mean, SD, Correlation
salary <- c(50000, 60000, 70000, 80000, 50000, 65000, 45000, 60000)
experience <- c(5, 3, 10, 4, 2, 7, 9, 6)

mean_salary <- mean(salary)
sd_salary <- sd(salary)
correlation <- cor(salary, experience)

mean_salary  # Output: 60000
sd_salary    # Output: ~11180.34
correlation  # Output: ~0.476

#Q No. 3 — Data Visualization----
#i. Scatter Plot: hp vs mpg
plot(mtcars$hp, mtcars$mpg,
     main = "Horsepower vs MPG",
     xlab = "Horsepower",
     ylab = "Miles per Gallon",
     pch = 19, col = "blue")
abline(lm(mpg ~ hp, data = mtcars), col = "red")
#ii. Box Plot: mpg by cyl
boxplot(mpg ~ cyl, data = mtcars,
        main = "MPG Distribution by Cylinder Count",
        xlab = "Number of Cylinders",
        ylab = "Miles per Gallon",
        col = c("lightblue", "lightgreen", "lightpink"))
#iii. Histogram: Weight Distribution
hist(mtcars$wt,
     breaks = 8,
     main = "Distribution of Car Weights",
     xlab = "Weight (1000 lbs)",
     col = "lightgray",
     border = "black")
#iv. Bar Plot: Count of Cars by Cylinders
barplot(table(mtcars$cyl),
        main = "Count of Cars by Cylinder Count",
        xlab = "Number of Cylinders",
        ylab = "Count",
        col = c("lightblue", "lightgreen", "lightpink"),
        names.arg = c("4 Cyl", "6 Cyl", "8 Cyl"))

