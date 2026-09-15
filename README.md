# Bangalore Ride Analytics: Demand, Cancellations & Trip Insights

A Business Analyst portfolio project analysing Bangalore ride data to understand demand patterns, cancellations, service performance, and trip economics using SQL, Python, Statistics, and Power BI.

---

## Project Overview

This project analyses a Bangalore Rapido ride-services dataset containing 50,000 ride records.

The analysis focuses on understanding:

- Ride demand across services and time periods
- Completion and cancellation patterns
- Service-level performance
- Trip distance and duration
- Fare and fare-per-kilometre behaviour
- Differences between weekday and weekend activity

The objective is to convert ride-level data into clear business insights and identify areas that could be explored further from an operational and marketplace perspective.

> **Note:** This is a student portfolio project created to demonstrate Business Analysis, SQL, Python, Statistics, and Power BI skills. It is not internal company analysis.

---

## Business Questions

The project focuses on the following questions:

1. What is the overall ride completion and cancellation rate?
2. Which service types contribute the most ride volume?
3. How does ride demand vary by hour?
4. How does ride volume differ between weekdays and weekends?
5. Are cancellation rates different across service types?
6. Are there particular hours or time periods with higher cancellation rates?
7. Does cancellation behaviour vary across trip-distance segments?
8. How does average fare vary across time periods?
9. How does fare per kilometre change as trip distance increases?
10. What areas should be investigated further to improve marketplace performance?

---

## Dataset

The project uses the **[Bangalore Rapido Ride Services Dataset](https://www.kaggle.com/datasets/vishaldeoprasad/bangalore-rapido-ride-services-dataset)** sourced from Kaggle.

The dataset contains ride-level information such as:

- Service type
- Date
- Time
- Ride status
- Source
- Destination
- Duration
- Ride ID
- Distance
- Ride charge
- Miscellaneous charge
- Total fare
- Payment method
- Booking datetime

The raw data was cleaned and transformed before being used for analysis.

### Data Availability

The dataset files are kept locally and are not included in the GitHub repository.

The repository contains the analysis code, notebooks, dashboard, and reports.

---

## Key Results

### Overall Ride Performance

| Metric | Result |
|---|---:|
| Total Rides | 50,000 |
| Completed Rides | 44,964 |
| Cancelled Rides | 5,036 |
| Completion Rate | 89.9% |
| Cancellation Rate | 10.1% |

---

### Demand Insights

- **Bike** was the highest-volume service.
- Hourly ride demand remained relatively stable, with observed volume of approximately **2.0K–2.2K rides per hour**.
- **9 AM** recorded the highest hourly ride volume.
- Weekday ride volume was substantially higher than weekend volume.
- July recorded the highest ride volume among the three observed months in the dataset.

---

### Cancellation Insights

- Cancellation rates were broadly similar across service types.
- Cab Economy and Bike were slightly above the overall cancellation rate.
- Cancellation rates remained close to the 10% benchmark across different time periods.
- Cancellation rates across distance buckets showed only modest variation.
- Thursday recorded the highest day-level cancellation rate at **10.36%**, while Sunday recorded the lowest at **9.54%**.

---

### Trip Economics

Analysis of completed rides showed:

| Metric | Result |
|---|---:|
| Average Fare | ₹547.39 |
| Average Distance | 25.50 km |
| Average Duration | 64.37 min |
| Average Fare per KM | ₹43.76 |

One of the main findings was that **fare per kilometre decreases sharply as trip distance increases**.

This suggests that different trip-distance segments have different fare economics and could be explored separately for pricing and marketplace analysis.

---

## Analytical Approach

The project follows an end-to-end Business Analyst workflow:

```text
Raw Ride Data
      ↓
Data Cleaning & Preparation
      ↓
Data Quality Checks
      ↓
SQL Analysis
      ↓
Python Exploratory Analysis
      ↓
Statistical Analysis
      ↓
Power BI Dashboard
      ↓
Business Insights
      ↓
Recommendations & Next Steps
