PayPal & Capital One Fraud Detection and Prevention — Case Study (Educational + Portfolio Project)

Executive Summary:
This project simulates a real-world fraud detection engagement involving PayPal and Capital One.
The goal: build an end-to-end analytics pipeline capable of detecting suspicious transactions using historical logs, feature engineering, SQL-driven analysis, and baseline machine learning techniques.

You will find:
A clean dataset (fraud_data.csv)
A feature-engineered dataset (fraud_data_with_features.csv)
SQL analysis for pattern discovery
A baseline fraud-detection model
A technical + business interpretation of results
A reproducible pipeline that mirrors real fraud analytics workflow

This project demonstrates practical skills in data engineering, data analysis, SQL, machine learning, and risk analytics.


1. Case Study Scenario (Storyline)

PayPal’s transaction monitoring system and Capital One’s card-issuing fraud unit jointly flagged a spike in unusual activity across several customer accounts.

A joint analytics team was assigned to:
Review anonymized historical transaction data
Identify patterns associated with fraudulent behavior
Engineer new features to strengthen fraud detection
Build a lightweight model that can detect high-risk activity
Produce insights to inform fraud analysts and risk managers
This repository represents the exact workflow the analytics team executed.


2. Project Structure

PayPal-Capital-One-Fraud-Detection-Prevention-Case-Study/
│
├── data/
│   ├── fraud_data.csv
│   └── fraud_data_with_features.csv
│
├── notebooks/
│   └── fraud_detection_baseline.py
│
├── sql/
│   └── fraud_analysis.sql
│
├── images/
│   └── pipeline_diagram.txt
│
├── generate_features.py
└── README.md


3. Dataset Overview

Source: Synthetic dataset created for educational fraud analytics.
Columns
Column	Description
transaction_id	Unique ID for the transaction
customer_id	ID representing a customer
transaction_amount	Dollar amount of transaction
timestamp	When the transaction occurred
location	Reported location for the transaction
device_id	Device identifier
merchant_id	Merchant receiving the transaction
label	Fraud label (1 = fraud, 0 = legitimate)


4. Feature Engineering

Feature creation was performed using generate_features.py.
New features include:
Time-based Features
transaction_hour: Extracted from timestamp
is_night: Transactions between 10 PM – 6 AM
Amount-based Features
is_large_amount: Flags amounts above $5,000
Location & Merchant Features
high_risk_location: Locations with higher fraud rates (NY, CA, TX, FL)
merchant_txn_count: How frequently a merchant appears
User & Device Behavior
device_usage_count: Device repetition can indicate takeover
customer_txn_count: Sudden spikes in usage signal risk
These replicate common patterns used in real fraud analytics systems.

5. SQL-Based Fraud Pattern Analysis

The file sql/fraud_analysis.sql contains SQL queries used for:
Identifying high-risk merchants
Locating fraud hotspots by location
Ranking devices associated with multiple fraud cases
Time-of-day risk patterns
Customer-level anomaly detection
Fraud units often run these exact SQL analyses to generate leads for investigation.

6. Baseline Machine Learning Model
   
Located in: notebooks/fraud_detection_baseline.py
The baseline model includes:
Data loading
Train-test split
Logistic Regression (or other lightweight baseline)
Evaluation metrics:
Precision
Recall
F1 Score
ROC-AUC
Why Recall Matters Most
Fraud detection requires catching as many fraudulent events as possible, even at the cost of a few false positives.
Banks prefer:
Miss less fraud
Even if they review a few extra cases


8. Pipeline Summary
   
A simplified version of the fraud analytics pipeline:
Data Ingestion
Cleaning & Preprocessing
Feature Engineering
SQL Pattern Mining
Model Training & Evaluation
Business Insights & Recommendations


8. Key Business Insights
   
The fraud analytics team concludes:
High-risk locations and nighttime transactions have elevated fraud rates
A small number of devices contribute to a disproportionate amount of fraud
Certain merchants may be targeted by bad actors
Larger transactions combined with unusual device behavior strongly correlate with fraud
These insights help PayPal/Capital One:
Prioritize investigations
Strengthen risk scoring rules
Improve customer authentication
Enhance anomaly detection models

9. How to Run the Project Locally

Generate features
python3 generate_features.py

Run the baseline model
Inside notebooks/:
python3 fraud_detection_baseline.py

Run SQL analysis
Use any SQL engine and execute:
sql/fraud_analysis.sql

10. Future Improvements
    
Add Gradient Boosting / Random Forest models
Build real-time scoring simulation
Add graph-based fraud detection
Build a dashboard (Streamlit / Power BI)
Add SHAP model explainability
Introduce geolocation distance tracking
Develop an alerting system

11. Disclaimer
    
This project uses synthetic educational data and does not reflect real customer or merchant records.


                ┌──────────────────────────┐
                │ 1. Data Ingestion        │
                │ fraud_data.csv           │
                └─────────────┬────────────┘
                              │
                              ▼
                ┌──────────────────────────┐
                │ 2. Data Cleaning         │
                │ - Parse timestamps       │
                │ - Handle missing values  │
                │ - Normalize fields       │
                └─────────────┬────────────┘
                              │
                              ▼
                ┌──────────────────────────┐
                │ 3. Feature Engineering   │
                │ - Time-of-day features   │
                │ - Behavior features      │
                │ - Location risk flags    │
                │ - Device frequency       │
                │ - Merchant frequency     │
                └─────────────┬────────────┘
                              │
                              ▼
                ┌──────────────────────────┐
                │ 4. SQL Pattern Mining    │
                │ - Fraud hotspots         │
                │ - Device anomalies       │
                │ - Merchant spikes        │
                │ - Hourly risk curves     │
                └─────────────┬────────────┘
                              │
                              ▼
                ┌──────────────────────────┐
                │ 5. Model Training        │
                │ - Logistic Regression    │
                │ - Precision/Recall       │
                │ - ROC-AUC                │
                └─────────────┬────────────┘
                              │
                              ▼
                ┌──────────────────────────┐
                │ 6. Model Evaluation      │
                │ - Feature importance     │
                │ - Threshold tuning       │
                │ - Business impact        │
                └─────────────┬────────────┘
                              │
                              ▼
                ┌──────────────────────────┐
                │ 7. Business Insights     │
                │ - Fraud patterns         │
                │ - Risk rules suggestions │
                │ - Alerts/Actions         │
                └──────────────────────────┘


SQL-Driven Fraud Insights (Summary)

1. High-Risk Merchants

SQL analysis shows several merchants consistently associated with fraudulent activity.
These merchants demonstrated:
Higher fraud rates than network average
Larger transaction spikes before fraud events
Multiple frauds tied to the same device or location
Impact: These merchants should receive higher risk scoring and periodic review.

