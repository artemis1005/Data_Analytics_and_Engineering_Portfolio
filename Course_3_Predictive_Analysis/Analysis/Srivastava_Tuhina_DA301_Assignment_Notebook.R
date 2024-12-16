# Assignment 5 scenario
## Turtle Games’s sales department has historically preferred to use R when performing 
## sales analyses due to existing workflow systems. As you’re able to perform data analysis 
## in R, you will perform exploratory data analysis and present your findings by utilising 
## basic statistics and plots. You'll explore and prepare the data set to analyse sales per 
## product. The sales department is hoping to use the findings of this exploratory analysis 
## to inform changes and improvements in the team.

################################################################################################################################

## Assignment 5 objective
## Load and wrangle the data. Use summary statistics and groupings if required to sense-check
## and gain insights into the data. Make sure to use different visualisations such as scatterplots, 
## histograms, and boxplots to learn more about the data set. Explore the data and comment on the 
## insights gained from your exploratory data analysis. For example, outliers, missing values, 
## and distribution of data. Also make sure to comment on initial patterns and distributions or 
## behaviour that may be of interest to the business.

###############################################################################################################################

# 1. Set Up the R Environment

# Set up libraries
library(ggplot2)  # For data visualisation
library(dplyr)    # For data wrangling
library(tidyr)    # For data manipulation
library(readr)    # For reading CSV files

# Load the CSV file correctly
data <- read.csv("cleaned_turtle_reviews.csv", stringsAsFactors = FALSE)

# View the first few rows
head(data)

# Specify the correct file path
file_path <- "cleaned_turtle_reviews.csv"  # Adjust path if necessary

# Try reading the first 10 lines from the file
lines <- readLines(file_path, n = 10)  # Reads the first 10 lines
print(lines)  # Display the lines to inspect the file content
# Print the lines

########################################################################################################################

# 2. View the Data

# View the first few rows of the data
head(data)

# Summary of the dataset (summary statistics)
summary(data)

########################################################################################################################

# 3. Data Cleaning

data_cleaned <- data %>%
  rename(
    'Loyalty Points' = Loyalty.Points,   # Rename 'Loyalty.Points' to 'Loyalty.Points'
    'Spending Score' = Spending.Score    # Rename 'Spending.Score' to 'Spending.Score'
  )

# View the cleaned data
head(data_cleaned)

########################################################################################################################

# 4. Exploratory Data Analysis (EDA)

# 4a. Summary Statistics

# Summary of the cleaned data
summary(data_cleaned)

# 4b. Visual Exploration

# Scatterplot of Spending Score vs Loyalty Points
library(ggplot2)
library(dplyr)

# Ensure that data is cleaned and there are no NA values
data_cleaned <- data_cleaned %>%
  filter(!is.na('Spending Score'), !is.na('Loyalty Points'))

# Create the scatterplot with proper aesthetics
ggplot(data_cleaned, aes(x = `Spending Score`, y = `Loyalty Points`)) +
  geom_point(color = "blue") +  # Plot the points
  labs(title = "Scatterplot of Spending Score vs Loyalty Points",
       x = "Spending Score",
       y = "Loyalty Points") +
  theme_minimal()

# Histogram of Loyalty Points

# Check the class of 'Loyalty Points'
class(data_cleaned$`Loyalty Points`)

# Convert 'Loyalty Points' to numeric (if it’s not already)
data_cleaned$`Loyalty Points` <- as.numeric(data_cleaned$`Loyalty Points`)

# Check the structure again
str(data_cleaned)

# Plot the histogram of Loyalty Points
ggplot(data_cleaned, aes(x = `Loyalty Points`)) +
  geom_histogram(bins = 30, fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Loyalty Points",
       x = "Loyalty Points",
       y = "Frequency") +
  theme_minimal()

# Boxplot of Loyalty Points by Remuneration

# Ensure Remuneration is treated as a categorical variable
data_cleaned$Remuneration <- as.factor(data_cleaned$Remuneration)

# Create the boxplot with correct column references
ggplot(data_cleaned, aes(x = Remuneration, y = `Loyalty Points`)) +
  geom_boxplot(fill = "purple", color = "black") +
  labs(title = "Boxplot of Loyalty Points by Remuneration",
       x = "Remuneration",
       y = "Loyalty Points") +
  theme_minimal()

########################################################################################################################

# 6. Comments on Distributions, Patterns, or Outliers

# Distributions:
# The histogram of Loyalty Points suggests that the data is right-skewed. 
# The majority of the values seem clustered around lower values (close to 0), 
# with fewer observations extending into the higher values. This indicates 
# a positive skew, meaning most customers have relatively low loyalty points, 
# while a small number have significantly higher points. It does not appear 
# to be normally distributed, as a normal distribution would have a bell-shaped 
# curve with values symmetrically distributed around the mean.

# Patterns:
# The scatterplot between Spending Score and Loyalty Points reveals a positive correlation. 
# As the Spending Score increases, the Loyalty Points tend to increase as well. 
# This suggests that customers who spend more are likely to accumulate more loyalty points, 
# indicating a direct relationship between spending and loyalty. However, there are some points 
# at higher spending scores with relatively low loyalty points, suggesting there could be additional 
# factors at play.

# Outliers:
# The boxplot of Loyalty Points by Remuneration clearly shows several outliers. 
# There are points with Loyalty Points far outside the interquartile range, 
# especially in the higher remuneration brackets. These points are either far above 
# or below the typical range and may need further investigation to understand if 
# they are data errors or legitimate extreme values.

# Summary of Insights:
# - Skewed Distribution: The Loyalty Points distribution is right-skewed, meaning most customers 
#   have relatively low points, and only a few have very high loyalty points.
# - Positive Correlation: There is a positive correlation between Spending Score and Loyalty Points, 
#   indicating that higher spending leads to higher loyalty points.
# - Outliers: There are several outliers in the Loyalty Points data, particularly in the higher ranges 
#   of Remuneration, which could indicate either extreme values or data issues.

########################################################################################################################

# 7. Identify Useful Groupings

# Group by remuneration and summarise loyalty points
grouped_data <- data_cleaned %>%
  group_by(Remuneration) %>%
  summarise(mean_loyalty_points = mean('Loyalty Points'),
            sd_loyalty_points = sd('Loyalty Points'),
            median_loyalty_points = median('Loyalty Points'))

# View grouped data
print(grouped_data)

########################################################################################################################

#8. Insights and Recommendations

# Based on the visualisations and statistical analysis, here are some potential insights:
  
# Patterns: There might be a positive correlation between spending score and loyalty points. 
#           Customers who spend more are likely to accumulate more loyalty points.

# Outliers: If there are high or low outliers in the loyalty points distribution, 
#           these might be interesting to investigate further (e.g., very high spending customers accumulating 
#           significantly more points).

# Groupings: Grouping by remuneration could reveal whether customers with higher earnings accumulate more 
#            points on average.

##############################################################################################################################################################
##############################################################################################################################################################

# Assignment 6 scenario

## In Module 5, you were requested to redo components of the analysis using Turtle Games’s preferred 
## language, R, in order to make it easier for them to implement your analysis internally. As a final 
## task the team asked you to perform a statistical analysis and create a multiple linear regression 
## model using R to predict loyalty points using the available features in a multiple linear model. 
## They did not prescribe which features to use and you can therefore use insights from previous modules 
## as well as your statistical analysis to make recommendations regarding suitability of this model type,
## the specifics of the model you created and alternative solutions. As a final task they also requested 
## your observations and recommendations regarding the current loyalty programme and how this could be 
## improved. 

################################################################################################################################################################

## Assignment 6 objective
## You need to investigate customer behaviour and the effectiveness of the current loyalty program based 
## on the work completed in modules 1-5 as well as the statistical analysis and modelling efforts of module 6.
##  - Can we predict loyalty points given the existing features using a relatively simple MLR model?
##  - Do you have confidence in the model results (Goodness of fit evaluation)
##  - Where should the business focus their marketing efforts?
##  - How could the loyalty program be improved?
##  - How could the analysis be improved?

################################################################################################################################################################

# 1. Data Exploration

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(caret)

# Explore the data
head(data_cleaned)
summary(data_cleaned)
str(data_cleaned)

# Check for missing values
sum(is.na(data_cleaned))

# Summary statistics
summary(data_cleaned)

################################################################################################################################################################

# 2. Select Features for Multiple Linear Regression

# Based on the previous analysis, the most relevant features for predicting Loyalty Points include:
  
# **Spending Score**: Strongly correlated with Loyalty Points.
# **Remuneration**: Higher remuneration may be linked to higher loyalty points.
# **Age**: May have an impact, though it might be less significant.
# Other features like Education or Product might not be as directly predictive, 
# but could still provide valuable insights.

# Justification:
# Spending Score and Remuneration are numeric features that can be used directly in the model.
# Age may also be predictive, but its relationship with loyalty points should be further 
# evaluated through the correlation analysis.

################################################################################################################################################################

# 3. Create the Multiple Linear Regression Model

# Create the multiple linear regression model using the correct syntax
mlr_model <- lm(`Loyalty Points` ~ `Spending Score` + Remuneration + Age, data = data_cleaned)

# Display the summary of the model
summary(mlr_model)

# Goodness of Fit:
# R-squared (R²): The R-squared value of 0.8499 suggests that about 85% of the variance in Loyalty Points 
# can be explained by the predictors (in this case, Spending Score, Remuneration, and Age). 
# This indicates a good fit for the model.

# Adjusted R-squared: The Adjusted R-squared value of 0.8449 is slightly lower than the R-squared but still high. 
# Adjusted R-squared is useful because it accounts for the number of predictors in the model, 
# and penalises adding irrelevant predictors. 
# The close values of R-squared and Adjusted R-squared indicate that adding more 
# variables did not lead to overfitting.

# F-statistic: The F-statistic value of 168.5 with a p-value < 2.2e-16 indicates that the overall regression model 
# is statistically significant. 
# This means that at least one of the predictors is significantly related to the Loyalty Points.

################################################################################################################################################################

# 4. Visualise the Model

# Visualise the relationship between Spending.Score and predicted Loyalty Points
data_cleaned$predicted_loyalty_points <- predict(mlr_model, data_cleaned)

ggplot(data_cleaned, aes(x = `Spending Score`, y = `Loyalty Points`)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Spending Score vs Loyalty Points with Regression Line",
       x = "Spending Score",
       y = "Loyalty Points") +
  theme_minimal()

################################################################################################################################################################

# 7. Interpretation of the Multiple Linear Regression (MLR) Model and Its Usefulness:
#
# The multiple linear regression (MLR) model was developed to predict 'Loyalty Points' using the following predictors:
# - 'Spending Score'
# - 'Remuneration'
# - 'Age'
#
# 1. **Intercept**: The intercept value is -2069.74, which represents the baseline level of Loyalty Points when 
#    both 'Spending Score' and 'Remuneration' are zero. While this intercept is not practically relevant (since 
#    spending and remuneration would rarely be zero), it is necessary for defining the regression model.
#
# 2. **Spending Score**: The coefficient for 'Spending Score' is 34.57. This indicates that for each unit increase 
#    in 'Spending Score', Loyalty Points are expected to increase by 34.57 points, assuming all other factors remain 
#    constant. This shows a **strong positive relationship** between 'Spending Score' and 'Loyalty Points', 
#    meaning that customers who spend more tend to accumulate more loyalty points.
#
# 3. **Remuneration**: The effect of 'Remuneration' varies based on its level. For example:
#    - A 'Remuneration' of 13.12 increases Loyalty Points by 544.14.
#    - Higher levels of 'Remuneration', such as 50.02, have a greater impact on Loyalty Points, with an increase of 1453.11.
#    This suggests that 'Remuneration' has a significant and increasing effect on Loyalty Points.
#
# 4. **Age**: The coefficient for 'Age' is 12.85, indicating that for each additional year in age, Loyalty Points are 
#    expected to increase by 12.85, while controlling for other factors. However, the effect of 'Age' appears smaller 
#    compared to 'Spending Score' and 'Remuneration'.
#
# **Goodness of Fit**:
# - The R-squared value of 0.8499 indicates that 85% of the variance in Loyalty Points is explained by the model, 
#   which is a very good fit.
# - The Adjusted R-squared value of 0.8449 suggests that the model accounts for the number of predictors without 
#   overfitting.
# - The F-statistic of 168.5 with a p-value of < 2.2e-16 indicates that the overall model is statistically significant.
#
# **Usefulness of the Model**:
# 1. The model provides a reliable way to predict Loyalty Points based on the features, especially 'Spending Score' 
#    and 'Remuneration'. 
# 2. The positive correlation between Spending Score and Loyalty Points indicates that customers who spend more 
#    are likely to accumulate more points, which can be useful for marketing strategies targeting high-spending customers.
# 3. The model also shows that 'Remuneration' is a significant predictor of Loyalty Points, particularly for higher income 
#    groups, which could inform the business on segmenting customers based on their income levels.
#
# **Model Evaluation**:
# The model is effective in predicting Loyalty Points and has a high goodness of fit, making it useful for targeting 
# customers based on their spending and income behavior. However, additional features, such as customer engagement, 
# purchase frequency, or satisfaction, could improve the model's accuracy. The business should focus on customers with 
# higher Spending Scores and Remuneration, as they are likely to have the highest Loyalty Points.
#
# **Improvement of the Loyalty Program**:
# Based on the findings, the business could improve the loyalty program by introducing tiered benefits for customers 
# with higher Spending Scores and Remuneration. This would incentivise customers to spend more and reward those with 
# higher incomes more significantly.

################################################################################################################################################################

# 6. Predict Loyalty Points for New Scenarios

# Load necessary libraries
library(caret)
library(randomForest)

# Load the data
training_data <- read.csv("cleaned_turtle_reviews.csv", stringsAsFactors = FALSE)

# Drop text columns (Review and Summary) as they're not directly used
training_data <- training_data[, !(colnames(training_data) %in% c("Review", "Summary"))]

# Set target variable and predictors
target <- "Loyalty.Points"
predictors <- setdiff(colnames(training_data), target)

# Split the data into training and testing sets
set.seed(123)
train_index <- createDataPartition(training_data[[target]], p = 0.8, list = FALSE)
train_set <- training_data[train_index, ]
test_set <- training_data[-train_index, ]

# Preprocess the data
preprocess <- preProcess(
  train_set[, predictors],
  method = c("center", "scale"),
  dummyVars = TRUE
)

train_processed <- predict(preprocess, train_set[, predictors])
test_processed <- predict(preprocess, test_set[, predictors])

# Train the Random Forest model
set.seed(123)
rf_model <- randomForest(
  x = train_processed,
  y = train_set[[target]],
  importance = TRUE
)

# Predict on the test set
test_predictions <- predict(rf_model, test_processed)

# New scenarios for prediction
new_data <- data.frame(
  Gender = c("Male", "Female"),
  Age = c(30, 25),
  Remuneration = c(14.50, 12.75),
  Spending.Score = c(60, 85),
  Education = c("graduate", "undergraduate"),
  Product = c(300, 400)  # Example product IDs
)

# Preprocess the new data
new_data_processed <- predict(preprocess, new_data)

# Predict Loyalty Points for new scenarios
new_predictions <- predict(rf_model, new_data_processed)

# View predictions
print(new_predictions)

# Visualise Results
predictions <- c(942.89, 875.69)
scenarios <- c("Scenario 1", "Scenario 2")
barplot(predictions, names.arg = scenarios, main = "Predicted Loyalty Points", 
        col = "blue", ylab = "Loyalty Points", ylim = c(0, 1000))

################################################################################################################################################################

# 7. Conclusion

# Key Findings from the Model:

# Significant Predictors of Loyalty Points:
#
# Spending Score: The most significant predictor, with a coefficient of 34.57.
# As customers' spending increases, so do their loyalty points, indicating a strong positive relationship.
# 
# Remuneration: Shows a significant impact on loyalty points, with higher remuneration levels leading to higher loyalty points.
# This suggests that income or spending power plays a crucial role in accumulating loyalty points.
# 
# Age: While age has an effect on loyalty points, it is less significant compared to spending behavior or remuneration,
# indicating that factors such as spending and income might be more influential in accumulating points.

# Goodness of Fit:
#
# The R-squared value of 0.8499 suggests that 85% of the variance in Loyalty Points is explained by the predictors 
# (Spending Score, Remuneration, and Age), indicating a strong model fit.
# The Adjusted R-squared value of 0.8449 indicates that the model does not suffer from overfitting and is appropriate 
# for predicting loyalty points.
# The F-statistic of 168.5 with a p-value of < 2.2e-16 shows that the model as a whole is statistically significant.

# Visualisation and Interpretation:
#
# The regression line between Spending Score and Loyalty Points shows a clear positive relationship, 
# further confirming that increased spending leads to higher loyalty points.
# The model is reliable for predicting loyalty points, with strong predictive power, especially from Spending Score and Remuneration.

# Model Usefulness:
#
# The Multiple Linear Regression (MLR) model provides valuable insights into how spending and remuneration contribute 
# to loyalty point accumulation. These insights can be used to segment customers and tailor marketing strategies.
# The model demonstrates that customers who spend more (higher Spending Score) and have higher income (Remuneration) 
# are likely to have more loyalty points, suggesting that these segments should be the focus of targeted marketing efforts.
# The business can use the model to predict loyalty points for new customers, such as the scenarios presented for 
# Male (30 years, Remuneration 14.50, Spending Score 60) and Female (25 years, Remuneration 12.75, Spending Score 85), 
# which showed predicted loyalty points of 942.89 and 875.69, respectively.

# Recommendations for the Business:
#
# Focus Marketing Efforts on High Spending and Higher Income Groups:
# Customers with higher spending scores and higher remuneration levels are likely to be the most valuable in terms of loyalty points. 
# Marketing efforts should be directed towards these groups to increase engagement and maximise loyalty.
# 
# Enhance the Loyalty Program Based on Spending and Remuneration:
# The current loyalty program could be improved by introducing tiered rewards, where customers with higher spending and 
# higher remuneration receive more benefits. This would incentivise customers to increase their spending to move into higher loyalty tiers.
# 
# Improve the Model by Adding Additional Features:
# Although the current model is effective, additional features such as purchase frequency, customer engagement, or satisfaction 
# could further enhance the model's predictive power. Including these features may uncover more insights into the factors driving loyalty points.
# 
# Segment Customers Based on Loyalty Point Predictions:
# The predictions from the model can be used to segment customers into groups, such as high potential spenders or loyalty leaders, 
# and develop targeted marketing campaigns or rewards programs for each group.

# Conclusion on the Loyalty Program:
#
# The loyalty program is effective in rewarding customers who spend more, but the program could be improved by introducing 
# more personalised or tiered incentives based on the insights from this analysis. By focusing on the most influential factors 
# (Spending Score and Remuneration), Turtle Games can refine their loyalty program to better align with customer behavior, 
# driving further customer retention and engagement.















