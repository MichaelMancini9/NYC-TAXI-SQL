import pandas as pd
import numpy as np
import os
import sqlite3

# File paths
trip_file_1 = "data/yellow_tripdata_2025-01.parquet"
trip_file_2 = "data/yellow_tripdata_2025-02.parquet"
zone_file = "data/taxi_zone_lookup.csv"
db_file = "database/taxi_analysis.db"

#make db folder
os.makedirs('database',exist_ok=True)

# Load trip data
df1 = pd.read_parquet(trip_file_1)
df2 = pd.read_parquet(trip_file_2)

# Combine months
trips = pd.concat([df1, df2], ignore_index=True)

trips = trips[
    [
        "tpep_pickup_datetime",
        "tpep_dropoff_datetime",
        "PULocationID",
        "DOLocationID",
        "trip_distance",
        "fare_amount",
        "tip_amount",
        "total_amount",
        "passenger_count"
    ]
]

trips = trips.dropna()
trips = trips[(trips['trip_distance'] > .5) & (trips['trip_distance'] < 100)]
trips = trips[trips['fare_amount'] > 1]
trips = trips[trips['total_amount'] > 1]

trips["tpep_pickup_datetime"] = pd.to_datetime(trips["tpep_pickup_datetime"])
trips['pickup_hour'] = trips['tpep_pickup_datetime'].dt.hour
trips['pickup_day'] = trips['tpep_pickup_datetime'].dt.day_name()
trips['pickup_month'] = trips['tpep_pickup_datetime'].dt.month

trips["tpep_dropoff_datetime"] = pd.to_datetime(trips["tpep_dropoff_datetime"])
trips['dropoff_hour'] = trips['tpep_dropoff_datetime'].dt.hour
trips['dropoff_day'] = trips['tpep_dropoff_datetime'].dt.day_name()
trips['dropoff_month'] = trips['tpep_dropoff_datetime'].dt.month

trips["trip_duration_min"] = (
    (trips["tpep_dropoff_datetime"] - trips["tpep_pickup_datetime"])
    .dt.total_seconds() / 60
)

trips = trips[(trips['trip_duration_min'] > .5) & (trips['trip_duration_min'] < 120)]

# Load zones
zones = pd.read_csv(zone_file)

trips = trips.sample(400000, random_state=42)


# Connect to SQLite
conn = sqlite3.connect(db_file)

# Write tables
trips.to_sql("trips", conn, if_exists="replace", index=False)
zones.to_sql("zones", conn, if_exists="replace", index=False)

conn.close()

print("Data loaded into taxi_analysis.db successfully.")


