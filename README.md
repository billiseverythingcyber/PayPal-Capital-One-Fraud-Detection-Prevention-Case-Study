# PayPal & Capital One Fraud Detection and Prevention – Case Study (Educational)

## 1. Project Overview

This project is an **educational case study** inspired by how companies like **PayPal** and **Capital One** use data science and machine learning to detect and prevent fraud in real time.

The goal is to:
- Simulate a **fraud detection pipeline** using synthetic transaction data.
- Show how **data cleaning, feature engineering, modeling, and analysis** work together.
- Demonstrate how fraud prevention can **reduce financial loss and improve security**.

> ⚠️ **Disclaimer**  
> This repository is for **educational purposes only**.  
> It uses **synthetic data** and public case study information, **not real PayPal or Capital One data**.  
> All trademarks and names are property of their respective owners.

---

## 2. Business Context

Companies like PayPal and Capital One process **millions of transactions per day**.  
Even a tiny percentage of fraud can translate into **millions of dollars in losses**.

Real-world examples (from public case studies):

- PayPal has reported fraud detection accuracy reaching **99.9%**, blocking an estimated **$2B in losses** through proactive fraud prevention.
- Capital One has reported tens of millions of dollars saved annually by using **machine learning models** to detect fraudulent credit card transactions in near real-time.

This project **simulates** the workflow behind such systems using a simplified dataset and baseline model.

---

## 3. Dataset

### 3.1 Synthetic Transactions Dataset

File: `data/synthetic_fraud_transactions.csv`

Example schema:

| Column           | Type      | Description                                           |
|------------------|-----------|-------------------------------------------------------|
| transaction_id   | string    | Unique ID per transaction                            |
| customer_id      | string    | Unique customer identifier                           |
| transaction_amt  | float     | Dollar amount of the transaction                     |
| timestamp        | datetime  | When the transaction occurred                        |
| location         | string    | Region or city                                       |
| device_id        | string    | Device fingerprint / identifier                      |
| merchant_id      | string    | Merchant identifier                                  |
| channel          | string    | 'online' or 'in_store'                               |
| is_international | int (0/1) | Whether the transaction is cross-border              |
| is_high_risk_merchant | int (0/1) | Known high-risk merchant flag                  |
| label            | int (0/1) | 1 = fraud, 0 = legitimate                            |

The dataset is **synthetic** – generated programmatically for training and demo purposes.

---

## 4. Data Required (Conceptual)

If this were a real production system, we would need at minimum:

- **Transaction-level data**
  - `transaction_id`, `transaction_amt`, `timestamp`
- **Customer data**
  - `customer_id`, risk profile, historical activity
- **Device data**
  - `device_id`, IP, device reuse, abnormal patterns
- **Merchant data**
  - `merchant_id`, category, historical chargeback rate
- **Geo & channel data**
  - `location`, `is_international`, `channel`
- **Fraud labels**
  - `label` indicating whether a past transaction was fraud (1) or not (0)

This project uses a simplified version of these fields inside one synthetic CSV.

---

## 5. Approach / Pipeline

High-level fraud detection pipeline:

1. **Ingest Data** – Load raw transaction data from CSV or a database.
2. **Clean & Preprocess** – Handle missing values, outliers, bad timestamps.
3. **Feature Engineering** – Create new fields that better represent fraud risk.
4. **Model Training** – Train a baseline ML model (e.g., Logistic Regression / Random Forest).
5. **Evaluation** – Use **Precision, Recall, F1-score, ROC-AUC** to measure performance.
6. **Insights & Visualization** – Look at fraud patterns, high-risk segments.
7. **Reporting** – Summarize business impact and potential risk reduction.

---

## 6. Feature Engineering (Examples)

Some example engineered features (simplified in the code):

- `is_large_amount` – 1 if transaction_amt > 500
- `is_night` – 1 if transaction happens during 00:00–05:00
- `is_international` – 1 if outside customer’s usual country
- `high_risk_merchant` – 1 if merchant in a known high-risk category

---

## 7. Modeling

In `notebooks/fraud_detection_baseline.py`, we:

1. Load `synthetic_fraud_transactions.csv`.
2. Split into train/test sets.
3. Use `scikit-learn` to train a baseline classifier.
4. Evaluate with:
   - Confusion matrix  
   - Classification report  
   - ROC-AUC score  

The goal is **not** to create a perfect model, but to demonstrate a **realistic fraud detection workflow**.

---

## 8. SQL Analysis (Business-Focused Queries)

In `sql/fraud_analysis.sql`, we include example queries such as:

```sql
SELECT location,
       COUNT(*) AS total_tx,
       SUM(label) AS fraud_tx,
       1.0 * SUM(label) / COUNT(*) AS fraud_rate
FROM transactions
GROUP BY location
ORDER BY fraud_rate DESC;


SELECT EXTRACT(HOUR FROM timestamp) AS hour,
       COUNT(*) AS total_tx,
       SUM(label) AS fraud_tx
FROM transactions
GROUP BY EXTRACT(HOUR FROM timestamp)
ORDER BY hour;


9. Key Insights (Example)
From this simulated dataset and modeling process, we can learn:
Fraud is more likely in international transactions, especially above a certain amount.
Certain merchants and devices show disproportionately high fraud rates.
Transactions occurring at night have a higher fraud probability.
Models must balance between:
Catching fraud (Recall) and
Avoiding false positives on legitimate customers (Precision).
10. How to Run This Project
Clone the repo or download it as ZIP.
Make sure data/synthetic_fraud_transactions.csv exists.
Run notebooks/fraud_detection_baseline.py in Python.
(Optional) Load the CSV into a database and run sql/fraud_analysis.sql.
11. What I Learned
How fraud detection fits into real business workflows.
How to go from raw transaction data → engineered features → ML model → business insights.
How SQL, Python, and analytics work together to support risk teams and decision makers.
The trade-offs between catching more fraud and avoiding blocking good customers.
12. Legal / Educational Notice
This project uses synthetic data only.
It does not contain or attempt to reconstruct real PayPal or Capital One data.
All references to PayPal and Capital One are for case study and educational illustration only.
All trademarks and names are property of their respective owners.

---

## 13. Repository Files & Navigation

Below is a quick guide to all the important files in this project:

### 📁 **Data**
- [`data/fraud_data.csv`](data/fraud_data.csv) – Synthetic transaction-level fraud dataset  
- [`data/fraud_data_with_features.csv`](data/fraud_data_with_features.csv) – Dataset after Python feature engineering  

### 🐍 **Python Scripts**
- [`notebooks/fraud_detection_baseline.py`](notebooks/fraud_detection_baseline.py) – Loads data, engineers features, analyzes patterns

### 🧮 **SQL Analysis**
- [`sql/fraud_analysis.sql`](sql/fraud_analysis.sql) – Business intelligence queries for fraud analysis

### 🖼 **Pipeline Diagram**
- [`images/pipeline_diagram.txt`](images/pipeline_diagram.txt) – End-to-end fraud detection workflow diagram

---

## 14. Skills Demonstrated in This Project

This project highlights skills expected from a Data Analyst, Fraud Analyst, or Data Scientist:

- **Python**: Data loading, feature engineering, dataset exports  
- **Pandas**: Creating new fraud detection features  
- **SQL**: Fraud rate calculations, segmentation, grouping, filtering  
- **Feature Engineering**: is_large_amount, is_night, device_reuse_count, risk indicators  
- **Data Understanding**: How fraud behaves across locations, times, and devices  
- **Reporting & Documentation**: Clear pipeline explanation and dataset structure  

These are the exact abilities hiring managers look for in junior candidates.

---

## 15. Future Improvements

Below are enhancements that can be added later:

- 🔹 Add a machine learning model (Logistic Regression, Random Forest)
- 🔹 Add ROC curve and confusion matrix visualizations
- 🔹 Integrate the dataset into a real SQL database (PostgreSQL / SQLite)
- 🔹 Create a Tableau dashboard showing fraud trends
- 🔹 Add API-style real-time fraud scoring simulation
- 🔹 Deploy a Streamlit dashboard for interactive fraud detection

These improvements will evolve this into a full advanced analytics project.

---

## 16. Business Impact Summary

This project demonstrates how companies like PayPal & Capital One can:

- Reduce fraud losses  
- Identify risky patterns (midnight transactions, reused devices, high-risk merchants)  
- Improve fraud detection with engineered features  
- Build automated pipelines for real-time decision-making  

The methodology shown here reflects real-world fraud analytics workflows used in fintech, banking, credit card companies, and payment processors.

---

## 17. Contact

If you'd like to see additional enhancements, dashboards, or model training:
**GitHub:** https://github.com/billiseverythingcyber  



