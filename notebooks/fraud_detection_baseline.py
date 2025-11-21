import pandas as pd

# -------------------------------
# 1. LOAD THE DATA
# -------------------------------
df = pd.read_csv("../data/fraud_data.csv")

print("First 5 rows of the dataset:")
print(df.head())
print("\nDataset shape:", df.shape)


# -------------------------------
# 2. FEATURE ENGINEERING
# -------------------------------

# Add morning/night flags
df["hour"] = pd.to_datetime(df["timestamp"]).dt.hour

df["is_night"] = df["hour"].apply(lambda h: 1 if h < 5 else 0)
df["is_large_amount"] = df["transaction_amount"].apply(lambda x: 1 if x > 500 else 0)

# Track repeated devices (fraudsters reuse devices)
device_counts = df["device_id"].value_counts()
df["device_reuse_count"] = df["device_id"].apply(lambda x: device_counts[x])

# Add this column to analyze later
print("\nAdded engineered features:")
print(df[["transaction_amount", "hour", "is_night", "is_large_amount", "device_reuse_count"]].head())


# -------------------------------
# 3. SIMPLE ANALYSIS
# -------------------------------

# Overall fraud rate
fraud_rate = df["label"].mean()
print("\nOverall fraud rate:", round(fraud_rate * 100, 2), "%")

# Fraud by location
print("\nFraud rate by location:")
print(df.groupby("location")["label"].mean().sort_values(ascending=False))

# Fraud by device reuse count
print("\nFraud rate by devices reused more than once:")
print(df[df["device_reuse_count"] > 1]["label"].mean())


# -------------------------------
# 4. SAVE THE FEATURED DATA
# -------------------------------

df.to_csv("../data/fraud_data_with_features.csv", index=False)
print("\nSaved file: data/fraud_data_with_features.csv")
