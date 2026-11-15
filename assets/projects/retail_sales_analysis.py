"""
Retail Sales Analysis — portfolio project
Dataset: retail_sales_sample.csv (synthetic practice data)
Run: python retail_sales_analysis.py
"""
import pandas as pd
from pathlib import Path

DATA = Path(__file__).with_name("retail_sales_sample.csv")
df = pd.read_csv(DATA, parse_dates=["Date"])
df["Revenue"] = df["Units"] * df["Unit Price (USD)"]
df["Cost"] = df["Units"] * df["Unit Cost (USD)"]
df["Profit"] = df["Revenue"] - df["Cost"]

print("OVERALL KPIs")
print(f"Revenue: ${df.Revenue.sum():,.2f}")
print(f"Profit: ${df.Profit.sum():,.2f}")
print(f"Units sold: {df.Units.sum():,}")
print(f"Profit margin: {df.Profit.sum()/df.Revenue.sum():.1%}")

print("\nREVENUE BY REGION")
print(df.groupby("Region").Revenue.sum().sort_values(ascending=False))

print("\nMONTHLY PERFORMANCE")
print(df.groupby(df.Date.dt.to_period("M"))[["Revenue", "Profit"]].sum())
