# 🚕 NYC Taxi Data Analysis (SQL + Python)

End-to-end exploratory data analysis of NYC taxi trips using SQL and Python, focused on demand patterns, pricing drivers, and travel efficiency.

## 📌 Overview
This project analyzes NYC taxi trip data using SQL and Python to uncover patterns in demand, pricing, and travel behavior across time and boroughs.

The analysis focuses on answering key questions such as:
- When is taxi demand highest?
- How do trip patterns vary by borough?
- What factors most strongly influence fare?
- How do traffic and trip efficiency differ across locations?

---

## 🛠️ Tools & Technologies
- **SQL (SQLite)** – data querying and aggregation  
- **Python (Pandas)** – data manipulation  
- **Matplotlib / Seaborn** – data visualization  

---

## 📊 Key Insights

### 🚦 Demand Patterns
- Taxi demand follows a clear daily cycle, with peaks in the late afternoon (5–6 PM)
- Weekly demand increases toward the end of the workweek, peaking on Thursday and Friday

---

### 🏙️ Borough Differences
- Manhattan accounts for the majority of taxi trips
- Queens has longer trips on average, resulting in higher average fares
- Manhattan trips are shorter but more frequent

---

### 💰 What Drives Fare?
- Fare is **strongly correlated with distance**
- Trip duration is more variable and less predictive of fare
- This indicates that pricing is primarily distance-based rather than time-based

---

### ⚡ Efficiency & Traffic
- Manhattan and Brooklyn have the highest **minutes per mile**, indicating slower travel speeds
- Queens and Staten Island show more efficient travel (lower time per mile)
- Manhattan has the highest **fare per mile**, likely due to short, congested trips

---

## 📈 Example Visualizations
- Trips by hour and day of week  
- Average fare by borough  
- Fare vs distance and duration  
- Fare per mile and minutes per mile by borough  

---

## 📂 Project Structure
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

## 📥 Data

Due to file size limits, raw data is not included in this repository.

You can download the dataset from:
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

After downloading, place the files in the `data/` folder and run:

```bash
python scripts/load_data.py


🎯 Key Takeaways

This project demonstrates:

- Writing efficient SQL queries for real-world datasets
- Translating business questions into data analysis
- Using visualization to uncover and communicate insights
- Connecting multiple analyses into a coherent narrative

🔗 Future Improvements

- Add interactive dashboard (Streamlit or Tableau)
- Incorporate machine learning for fare prediction
- Analyze pickup/dropoff zone relationships
- Include time-series forecasting of demand