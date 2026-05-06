# PayPal-Style Fraud Detection & Risk Intelligence System

## Overview

This project simulates an enterprise fraud analytics and risk intelligence environment inspired by real-world financial services fraud detection workflows.

The objective is to demonstrate how machine learning, SQL analytics, feature engineering, KPI validation, and executive dashboard reporting can be combined to identify suspicious transaction behavior during high-risk transaction periods.

The project focuses on operational fraud monitoring, business intelligence, and executive risk visibility rather than only predictive modeling.

---

# Business Scenario

The project simulates elevated fraud activity occurring during a high-volume holiday transaction period on December 24, 2025.

During periods of increased digital payment activity, financial institutions face elevated exposure to:

- Chargebacks
- Revenue leakage
- Refund losses
- Fraud escalation
- Customer distrust
- Operational strain
- Regulatory exposure

The system demonstrates how fraud analytics teams can identify suspicious activity, validate executive KPIs, and support operational response workflows.

---

# Core Business Objective

Primary objective:

Protect profitability through early fraud detection, KPI integrity validation, and rapid operational response.

The project demonstrates how analytics systems support:

- Fraud operations monitoring
- Executive risk visibility
- Investigation prioritization
- Financial loss prevention
- Operational escalation
- Enterprise reporting

---

# Key Analytical Discovery

One of the most important findings during dashboard development involved KPI validation.

Initial dashboard metrics incorrectly displayed machine learning prediction outputs instead of confirmed fraud labels.

Initial incorrect values:
- Fraud Transactions: 108
- Fraud Rate: 72%

After validation and reconciliation against source fraud labels, the correct metrics were identified:

Validated KPI Results:
- Total Transactions: 150
- Confirmed Fraud Transactions: 19
- Confirmed Non-Fraud Transactions: 131
- Actual Fraud Rate: 12.67%

This validation process transformed the project from a standard dashboard exercise into a fraud analytics governance and KPI integrity case study.

---

# Technical Stack

- Python
- Pandas
- SQL
- Jupyter Notebook
- Azure Machine Learning
- Tableau
- GitHub

---

# Project Architecture

The fraud analytics workflow includes:

1. Data ingestion
2. Data cleaning and preprocessing
3. Feature engineering
4. SQL fraud pattern analysis
5. Machine learning model training
6. KPI validation
7. Executive dashboard reporting
8. Operational fraud response simulation

---

# Feature Engineering

The project includes engineered fraud intelligence features such as:

- Nighttime transaction indicators
- Large transaction flags
- Device usage frequency
- Merchant transaction concentration
- Customer transaction frequency
- High-risk geographic indicators

These features simulate patterns commonly monitored in enterprise fraud analytics environments.

---

# SQL Fraud Analytics

SQL analysis was used to identify:

- High-risk merchants
- Geographic fraud concentration
- Device anomalies
- Time-of-day fraud patterns
- Customer transaction spikes

The SQL workflow demonstrates how fraud operations teams investigate suspicious activity and prioritize investigations.

---

# Machine Learning Workflow

A baseline Logistic Regression model was used to classify potentially fraudulent transactions.

Model evaluation included:
- Recall
- Precision
- F1 Score
- ROC-AUC

Special emphasis was placed on recall because undetected fraud creates direct financial risk exposure.

---

# Tableau Executive Dashboard

The Tableau dashboard was designed to provide executive-level visibility into:

- Fraud exposure
- KPI integrity
- Operational monitoring
- Risk escalation
- Fraud distribution trends

Dashboard components include:
- KPI summary tiles
- Fraud vs non-fraud comparisons
- Executive commentary
- Risk visibility reporting

---

# Operational Fraud Response Simulation

The project simulates operational fraud response workflows including:

- Fraud spike alerts
- Geo-risk alerts
- Manual review escalation
- Device anomaly detection
- Executive risk bulletins
- Compliance monitoring support

---

# Organizational Impact

## Executive Leadership
- Fraud exposure visibility
- Strategic risk monitoring
- Operational oversight

## Finance Department
- Chargeback exposure monitoring
- Revenue protection
- Financial loss visibility

## Fraud Operations
- Investigation prioritization
- Escalation workflows
- Transaction monitoring

## Data Science & Analytics
- Model evaluation
- KPI validation
- Fraud trend analysis

## Compliance & Legal
- Risk governance support
- Audit readiness
- Regulatory awareness

---

# Repository Structure

```bash
PayPal-Capital-One-Fraud-Detection-Prevention-Case-Study/

│── data/
│── dashboard/
│── docs/
│── images/
│── models/
│── notebooks/
│── sql/
│── src/
│── README.md
│── generate_features.py
