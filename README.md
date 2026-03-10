
# Credit Card Fraud Detection & Transaction Risk Analysis

## Project Overview
This project analyzes credit card transaction data to identify fraud patterns and build machine learning models capable of detecting fraudulent transactions. The analysis combines **SQL-based exploratory analysis** with **Python-based machine learning models** to uncover fraud behavior and evaluate fraud detection algorithms.

The goal of this project is to understand fraud characteristics such as **transaction amount patterns, temporal trends, and suspicious transaction behavior**, and to develop models that can accurately identify fraudulent transactions.

---

## Business Problem
Financial institutions process millions of transactions daily while fraudulent transactions represent only a small fraction of the total volume. Detecting fraud is challenging because:

- Fraud cases are extremely rare
- False positives create operational costs
- Fraud patterns evolve over time

This project explores **fraud detection using data analytics and machine learning models** to improve fraud detection performance while minimizing false alerts.

---

## Dataset
Dataset used:  
https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud

The dataset contains **284,807 credit card transactions** made by European cardholders over two days.

### Dataset Characteristics

| Metric | Value |
|------|------|
Total Transactions | 284,807 |
Fraud Transactions | 473 |
Fraud Rate | **0.17%** |

Because fraud represents only **0.17% of all transactions**, the dataset is **highly imbalanced**, making fraud detection a challenging classification problem.

### Features

- **Time** – Seconds elapsed between transactions
- **Amount** – Transaction amount
- **V1–V28** – PCA-transformed anonymized features
- **Class** – Target variable (0 = normal transaction, 1 = fraud)

---

## Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Scikit-learn
  - Matplotlib / Seaborn

- **Machine Learning Models**
  - Logistic Regression
  - Decision Tree
  - Random Forest

- **Sampling Techniques**
  - Under-sampling
  - SMOTE (Synthetic Minority Oversampling)

- **SQL (Snowflake)**

---

# Exploratory Data Analysis (SQL)

SQL queries were used to explore fraud patterns within the transaction dataset.

### 1. Fraud Distribution

Fraud represents **0.17% of all transactions**, highlighting extreme class imbalance.

**Implication**

Traditional classification models may struggle to detect fraud unless special techniques such as **oversampling or anomaly detection** are used.

---

### 2. Fraud by Transaction Amount Range

| Amount Range | Fraud Count |
|--------------|-------------|
0–50 | **292 fraud cases** |
100–500 | **91 fraud cases** |

**Insight**

Most fraudulent transactions occur at **lower transaction values**, suggesting fraudsters may intentionally perform smaller transactions to avoid triggering detection systems.

---

### 3. Fraud Trend Over Time

Fraud transactions are **not evenly distributed across time**.

Highest fraud activity observed during hours:

- 11
- 26
- 2
- 12

**Insight**

Fraud activity shows **temporal clustering**, indicating that time-based behavioral patterns may improve fraud detection systems.

---

### 4. Transaction Amount Comparison

| Metric | Fraud | Normal |
|------|------|------|
Average Transaction | 124 | 88 |
Maximum Transaction | 25,691 | 2,125 |

**Insight**

Fraudulent transactions tend to have **higher average transaction values and extreme outliers**, suggesting attackers may escalate transaction value once card validity is confirmed.

---

### 5. Fraud Rate by Amount

Some transaction amounts exhibit **disproportionately high fraud rates**, potentially indicating:

- automated fraud attempts
- repeated transaction patterns
- scripted fraud behavior

---

### 6. Top Suspicious Transactions

Large fraudulent transactions appear among the highest transaction values.

**Insight**

Fraudsters may attempt **large transactions after validating stolen credit card information**.

---

# Machine Learning Model Evaluation (Python)

Three machine learning models were evaluated:

- Logistic Regression
- Decision Tree
- Random Forest

Models were tested under three data balancing scenarios:

1. Original imbalanced dataset
2. Under-sampled dataset
3. SMOTE oversampled dataset

### Evaluation Metrics

- Accuracy
- Precision
- Recall
- F1 Score
- ROC-AUC

---

# Model Performance Summary

Random Forest consistently delivered the strongest performance across all experiments.

| Model | Performance |
|------|-------------|
Logistic Regression | Moderate performance |
Decision Tree | Balanced but lower precision |
Random Forest | **Best overall performance** |

Random Forest achieved the best balance between **precision and recall**, making it the most effective model for fraud detection in this dataset.

---

# Final Model

The final model selected was:

**Random Forest trained with SMOTE oversampling**

This configuration improved fraud detection recall while maintaining strong precision.

---

# Key Findings

- Fraudulent transactions represent **only 0.17% of total transactions**, making fraud detection a highly imbalanced classification problem.
- Fraud activity is concentrated in **lower transaction amounts**, particularly below \$50.
- Fraud transactions exhibit **time-based clustering**, suggesting behavioral patterns.
- Fraud transactions have **higher average values and extreme outliers** compared to normal transactions.
- Random Forest models provided the **best fraud detection performance**.
- SMOTE oversampling improved fraud recall while maintaining strong model precision.
  
---

# Dataset Source

Kaggle Dataset  
https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud

---

# Author

Pramita Mondal  
Data Analytics & Machine Learning Portfolio Project

---

