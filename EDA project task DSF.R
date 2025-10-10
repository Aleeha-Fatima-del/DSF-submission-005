install.packages("NHANES")
library(NHANES)
data(NHANES)
View(NHANES)
#1.Data Cleaning----
library(NHANES)
library(dplyr)
#Goal: Handle missing values, drop irrelevant columns, and fix data types.
# Load dataset
data("NHANES")

# Check structure
str(NHANES)

# Remove columns with too many NAs
NHANES_clean <- NHANES %>% select(where(~ mean(!is.na(.)) > 0.7))

# Remove rows with missing values
NHANES_clean <- na.omit(NHANES_clean)

# Convert categorical variables to factors
NHANES_clean <- NHANES_clean %>% mutate_if(is.character, as.factor)

# View cleaned data
summary(NHANES_clean)





#2. Data Transformation----
#Goal: Create new variables, normalize numeric data, and recode factors.
library(scales)

# Create BMI category
NHANES_clean <- NHANES_clean %>%
  mutate(BMI_Category = case_when(
    BMI < 18.5 ~ "Underweight",
    BMI >= 18.5 & BMI < 25 ~ "Normal",
    BMI >= 25 & BMI < 30 ~ "Overweight",
    BMI >= 30 ~ "Obese"
  ))

# Normalize Age and Weight
NHANES_clean <- NHANES_clean %>%
  mutate(Age_scaled = rescale(Age),
         Weight_scaled = rescale(Weight))

# Recode Gender
NHANES_clean$Gender <- factor(NHANES_clean$Gender, levels = c("male", "female"))
# View transformed data
summary(NHANES_clean)

#3. Exploratory Data Analysis (EDA)/visualizations
#Univariate Analysis----
#Question: What is the distribution of BMI, Age, and Gender?
library(ggplot2)

# Histogram of BMI
ggplot(NHANES_clean, aes(x = BMI)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  labs(title = "BMI Distribution")

# Bar plot of Gender
ggplot(NHANES_clean, aes(x = Gender)) +
  geom_bar(fill = "coral") +
  labs(title = "Gender Count")
#Health Status (Pie Chart)
library(dplyr)
library(ggplot2)

health_data <- NHANES_clean %>%
  count(HealthGen) %>%
  mutate(percent = n / sum(n) * 100)

ggplot(health_data, aes(x = "", y = percent, fill = HealthGen)) +
  geom_col(width = 1) +
  coord_polar("y") +
  labs(title = "General Health Status Distribution") +
  theme_void()

#Bivariate Analysis----
#Question: How does BMI vary by Gender? Is there a relationship between Age and Weight?
# Boxplot of BMI by Gender
ggplot(NHANES_clean, aes(x = Gender, y = BMI)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "BMI by Gender")

# Scatter plot of Age vs Weight
ggplot(NHANES_clean, aes(x = Age, y = Weight)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Age vs Weight")
# Correlation between Age and Weight
cor(NHANES_clean$Age, NHANES_clean$Weight)

#Multivariate Analysis----
#Question: How do Age, Gender, and BMI together influence HealthStatus?

# Multivariate plot
ggplot(NHANES_clean, aes(x = Age, y = BMI, color = HealthGen)) +
  geom_point(alpha = 0.6) +
  facet_wrap(~ Gender) +
  labs(title = "Age vs BMI Colored by Health Status")
#Age vs BMI Colored by Health Status (Faceted by Gender)
ggplot(NHANES_clean, aes(x = Age, y = BMI, color = HealthGen)) +
  geom_point(alpha = 0.6) +
  facet_wrap(~ Gender) +
  labs(title = "Age vs BMI Colored by Health Status", x = "Age", y = "BMI")
#Physical Activity vs BMI (if variable exists)
ggplot(NHANES_clean, aes(x = PhysActive, y = BMI, fill = PhysActive)) +
  geom_boxplot() +
  labs(title = "BMI by Physical Activity", x = "Physically Active", y = "BMI")
#save 
