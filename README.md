# Bangalore Ride Analytics: Demand, Cancellations & Trip Insights

A Business Analyst portfolio project focused on understanding ride demand, cancellations, service performance, and trip economics using SQL, Python, Statistics, and Power BI.

---

## 📌 Project Overview

This project analyses a Bangalore ride-services dataset to understand how ride activity varies across services, time periods, days, and trip-distance segments.

The analysis focuses on three main areas:

- Ride demand and marketplace activity
- Cancellation patterns and operational performance
- Trip economics and fare behaviour

The goal is to turn raw ride-level data into useful business insights and identify areas that could be explored further.

> **Note:** This project created to demonstrate Business Analysis, SQL, Python, Statistics, and Power BI skills. It is not internal company analysis.

---

## 🎯 Business Questions

The project aims to answer questions such as:

1. What is the overall completion and cancellation rate?
2. Which services contribute the most ride volume?
3. How does ride demand vary by hour and day of the week?
4. Are cancellation rates meaningfully different across services?
5. Are there particular hours or time periods with higher cancellation rates?
6. How does cancellation behaviour vary across trip-distance segments?
7. How does fare per kilometre change with trip distance?
8. How does average fare vary across different time periods?
9. Which areas of the marketplace could be investigated further?

---

## 📊 Dataset

The project uses the **Bangalore Rapido Ride Services Dataset** from Kaggle.

The dataset contains ride-level information including:

- Service type
- Date and time
- Ride status
- Source and destination
- Trip duration
- Distance
- Ride charge
- Miscellaneous charge
- Total fare
- Payment method
- Ride ID

The data was cleaned and transformed before analysis.

---

## 🔍 Key Findings

### Overall Performance

- **50,000** rides were analysed.
- **44,964** rides were completed.
- **5,036** rides were cancelled.
- Overall completion rate was approximately **89.9%**.
- Overall cancellation rate was approximately **10.1%**.

### Demand

- **Bike** was the highest-volume service.
- Hourly demand remained relatively stable, with observed volume of roughly **2.0K–2.2K rides per hour**.
- **9 AM** recorded the highest hourly ride volume.
- Weekday ride volume was substantially higher than weekend volume.
- July recorded the highest ride volume among the three observed months.

### Cancellations

- Cancellation rates were broadly similar across service types.
- **Cab Economy** and **Bike** had cancellation rates slightly above the overall rate.
- Cancellation rates remained close to 10% across different time periods.
- Cancellation rates across distance buckets showed only modest variation.
- Thursday had the highest day-level cancellation rate at **10.36%**, while Sunday had the lowest at **9.54%**.

### Trip Economics

For completed rides:

- Average fare: **₹547.39**
- Average distance: **25.50 km**
- Average duration: **64.37 minutes**
- Average fare per kilometre: **₹43.76**

One of the clearest findings was that **fare per kilometre decreases sharply as trip distance increases**.

This suggests that different trip-distance segments have different fare economics and may deserve separate pricing analysis.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **SQL / PostgreSQL** | Data quality checks, KPI analysis, cancellation analysis and trip analysis |
| **Python** | Exploratory data analysis and statistical analysis |
| **Pandas** | Data manipulation and preparation |
| **Matplotlib** | Data visualization |
| **Power BI** | Interactive dashboard and KPI reporting |
| **Microsoft Word** | Business analysis report |
| **Excel** | Data dictionary |

---

## 📁 Project Structure

```text
Bangalore Ride Analytics: Demand, Cancellations & Trip Insights/
│
├── data/
│   ├── raw/
│   │   └── bangalore_rapido_rides.csv
│   │
│   └── processed/
│       └── cleaned_rides.csv
│
├── sql/
│   ├── 01_data_quality.sql
│   ├── 02_kpi_analysis.sql
│   ├── 03_cancellation_analysis.sql
│   └── 04_time_trip_analysis.sql
│
├── python/
│   ├── 01_analysis.ipynb
│   └── 02_statistical_analysis.ipynb
│
├── powerbi/
│   └── marketplace_dashboard.pbix
│
├── reports/
│   ├── business_analysis.docx
│   ├── business_analysis.pdf
│   └── data_quality_summary.xlsx
│
└── README.md