# Sports-Wear-Group

It's one of data science challeneges presented in IBM Data Science Bootcamp.

# Overview
Sports Wear Group is one of the leading retailers industry in the region, with more than 50 branches across the region. It runs multiple lines of business applications, mainly in the sport goods industry. They are in the middle of their digital transformation journey and they want to keep leading the market by satisfying their customers and meeting their expectation.

# Goals and Objectives 
* Classify customer whether buy the offer or not.
* Management team aims to increase company’s sales in general.
* Target/ dependent variable:
 * Label attribute (0 means No, 1 means Yes)
* Predictor/independent variables:
 * Country
 * Sales
 * Category
 * Cost 
 * Gender

# Today’s Situation
* The company has more than 50 branches.
* It runs multiple lines of business applications, mainly sports industry.
* The company cannot keep leading the market due to digital transformation.
* The company wants to satisfy customer expectation and increase the revenue.

# Proposed Solution
* Regression analysis especially the logistic regression.
* Spots correlation between specific customer variables (independent variables) with buying the offer.

# Data preparation & partitioning  
* The dataset consists of 100000 records and 24 variables.
* Removing retailweek column since it doesn't has any info.
* Taking subset the dataset to contain only the dependent variables and independents.
* Normalize dataset as factor.
* Making two way table of factor variable to make sure that we don't have zero values using cross tabulation.
* Divide the dataset into training set 80% and testing 20%.

# Regression Model
* Gender  and Cost variables are removed since its not statistically significant.
* From the model the most significant variables are country especially France and sales.
* A lower AIC value and a better model. Also, we compared between model before removing not significant values and after using the ANOVA test to know which is better to use in prediction.

# Results
* After applying prediction on the target model, we applied confusion matrix to evaluate the model on both training set and testing set.
* The misclassification percentage of model in training set is 14% and on testing set is 13%


