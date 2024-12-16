# **Turtle Games Data Analysis Project**

### **Overview**
This project analyses customer data for Turtle Games, a global retailer of books, board games, toys, and video games. The focus is on identifying key drivers of customer loyalty, segmenting customers, and improving the loyalty program using data-driven insights.

---

## **Objectives**
1. Analyse **Loyalty Points** to understand accumulation behavior.
2. Perform **Customer Segmentation** using K-Means clustering.
3. Conduct **Sentiment Analysis** of product reviews to assess customer satisfaction.
4. Develop a **Multiple Linear Regression** model to predict Loyalty Points and evaluate its reliability.
5. Provide actionable **recommendations** to optimize the loyalty program.

---

## **Tools and Libraries**
### **Python**
- **Data Wrangling**: `pandas`, `numpy`
- **Visualization**: `matplotlib`, `seaborn`
- **Machine Learning**: `sklearn` (K-Means, Linear Regression)
- **Sentiment Analysis**: `TextBlob`

### **R**
- **Data Exploration and Visualization**: `ggplot2`, `dplyr`
- **Statistical Modeling**: `lm` (Linear Regression)

---

## **Project Workflow**
1. **Data Import and Cleaning**
   - Standardised column names.
   - Imputed missing values.
   - Removed irrelevant features.

2. **Exploratory Data Analysis (EDA)**
   - Summary statistics to identify patterns and outliers.
   - Visualizations (scatterplots, histograms, and boxplots).

3. **Customer Segmentation**
   - Applied **K-Means clustering** to group customers into three segments:
     - High Spenders
     - Moderate Spenders
     - Low Spenders

4. **Statistical Modeling**
   - Built a **Multiple Linear Regression** model to predict Loyalty Points.
   - Achieved an **R-squared** of **0.85**, demonstrating strong model accuracy.

5. **Sentiment Analysis**
   - Evaluated customer reviews to extract polarity scores.
   - Identified common positive and negative themes.

6. **Recommendations**
   - Introduced tiered rewards based on spending behavior.
   - Suggested targeted marketing strategies for customer segments.
   - Addressed negative feedback to improve product satisfaction.

---

## **Key Results**
- Spending Score is the strongest predictor of Loyalty Points.
- High-income customers accumulate significantly more points.
- Sentiment analysis revealed **positive themes** around product quality and **negative themes** around utility issues.
