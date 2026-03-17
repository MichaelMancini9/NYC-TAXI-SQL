# NYC Taxi Data Analysis (SQL + Python)

Using Python and SQL, I did end-to-end exploratory data analysis of NYC taxi trips, focusing on the demand, the variables which affect pricing, and the efficiency of travel.

## Overview
This project is aimed at analyzing the NYC taxi trips data to evaluate and analyze the patterns of demand, pricing, and travel using SQL and Python through the course of time and across the different boroughs of NYC.

The analysis aims to answer the following main questions:
- At what times is the demand for taxis the greatest?
- How do trips differ across the boroughs?
- What are the main influences on taxi fares?
- What is the relationship between traffic and trip efficiency in different locations?

---

## Tools & Technologies
- **SQL (SQLite)** – data querying and aggregation  
- **Python (Pandas)** – data manipulation  
- **Matplotlib / Seaborn** – data visualization  

---

## Notebook

- [View on GitHub](notebooks/taxi_demand_and_pricing_analysis.ipynb)
- [View Rendered (nbviewer)](https://nbviewer.org/github/MichaelMancini9/NYC-TAXI-SQL/blob/main/notebooks/taxi_demand_and_pricing_analysis.ipynb)

---

## Key Insights

### Demand Patterns
- Taxi demand is highest at 5-6PM and follows a daily cycle
- Demand increases later in the week, peaking on Thursdays and Fridays

---

### Borough Differences
- Manhattan accounts for the majority of taxi trips
- In Queens, trips are longer, and therefore the average fare is higher
- In Manhattan, the trips are shorter, but more frequent

---

### What Drives Fare?
- Fare is **strongly correlated with distance** 
- The trip duration plays a weaker role in predicting fare
- This shows that fare pricing mechanisms are more distance-based than time-based

---

### Efficiency & Traffic
- Manhattan and Brooklyn have the highest **minutes per mile**, indicating slower travel speeds
- Queens and Staten Island show more efficient travel (lower time per mile)
- Manhattan has the highest **fare per mile**, likely due to short, congested trips

---

## Example Visualizations
- Trips by hour and day of week  
- Average fare by borough  
- Fare vs distance and duration  
- Fare per mile and minutes per mile by borough  

---

## Project Structure
```
NYC-TAXI-SQL/
│
├── data_raw/              # Raw data files (not included)
│   ├── taxi_zone_lookup.csv
│   └── (trip data files)
│
├── database/              # SQLite database
│   └── taxi_analysis.db
│
├── notebooks/             # Analysis notebooks
│   └── taxi_demand_and_pricing_analysis.ipynb
│
├── queries/               # SQL queries
│   └── analysis.sql
│
├── scripts/               # Data loading scripts
│   └── load_data.py
│
└── README.md
```
---

## Data

Due to file size limits, raw data is not included in this repository.

You can download the dataset from:
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

After downloading, place the files in the `data/` folder and run:
python scripts/load_data.py

## Key Takeaways

This project demonstrates:

- Writing efficient SQL queries for real-world datasets
- Translating business questions into data analysis
- Using visualization to uncover and communicate insights
- Connecting multiple analyses into a coherent narrative

## Future Improvements

- Add interactive dashboard (Streamlit or Tableau)
- Incorporate machine learning for fare prediction
- Analyze pickup/dropoff zone relationships
- Include time-series forecasting of demand