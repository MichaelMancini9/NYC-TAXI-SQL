SELECT COUNT(*) AS total_trips
FROM trips;

-- ====================================
-- JOIN TRIPS WITH ZONE DATA
-- ====================================

SELECT t.pickup_hour,
z.Zone,
z.Borough,
COUNT(*) AS total_trips
FROM trips t
LEFT JOIN zones z 
    ON t.PUlocationID = z.LocationID
GROUP BY t.pickup_hour, z.Zone, z.Borough
ORDER BY total_trips DESC
LIMIT 20;

-- ====================================
-- TRIPS BY HOUR
-- ====================================

SELECT 
    pickup_hour, 
    COUNT(*) AS trips
FROM trips
GROUP BY pickup_hour
ORDER BY pickup_hour DESC;

-- hour 18 (6:00) is the busiest, and times around that which makes sense since it is commute time

-- ====================================
-- TRIPS BY DAY
-- ====================================

SELECT 
    pickup_day,
    COUNT(*) AS trips
FROM trips
GROUP BY pickup_day
ORDER BY CASE pickup_day
    WHEN 'Monday' THEN 1
    WHEN 'Tuesday' THEN 2
    WHEN 'Wednesday' THEN 3
    WHEN 'Thurday' THEN 4
    WHEN 'Friday' THEN 5
    WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7
END;

-- ====================================
-- AVERAGE FARE BY BOROUGH
-- ====================================

SELECT 
    z.Borough,
    AVG(t.fare_amount) AS avg_fare
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.LocationID
WHERE z.Borough NOT IN ('Unknown', 'EWR')
GROUP BY z.BOROUGH
ORDER BY avg_fare DESC;

-- ====================================
-- AVERAGE TRIP DISTANCE, FARE, DURATION  BY BOROUGH
-- ====================================

SELECT
    z.Borough,
    AVG(t.fare_amount) AS avg_fare,
    AVG(t.trip_distance) AS avg_distance,
    AVG(t.trip_duration) AS avg_duration
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.locationID
GROUP BY z.Borough
ORDER BY avg_fare DESC;

-- ====================================
-- FARE VS DISTANCE
-- ====================================

SELECT
    fare_amount,
    trip_distance,
    trip_duration_min
FROM trips

-- ====================================
-- AVERAGE FARE PER MILE
-- ====================================

SELECT
    z.Borough,
    AVG(t.fare_amount / t.trip_distance) AS fare_per_mile
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.locationID
GROUP BY z.Borough
ORDER BY fare_per_mile;

-- ====================================
-- TRIPS BY BOROUGH
-- ====================================

SELECT
    z.Borough,
    COUNT(*) AS trips
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.LocationID
GROUP BY z.Borough
ORDER BY trips DESC;

-- Manhattan has a very high amount of trips compaired to other boroughs

-- ====================================
-- DISTANCE VS DURATION TRAFFIC
-- ====================================

SELECT 
    z.Borough,
    AVG(t.trip_distance/t.trip_duration_min) as avg_distance_per_min
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.locationID
GROUP BY z.Borough
ORDER BY avg_distance_per_min DESC;


-- ====================================
-- REVENUE BY BOROUGH
-- ====================================

SELECT
    z.Borough,
    SUM(t.total_amount) AS revenue
FROM trips t 
LEFT JOIN zones z
ON t.PUlocationID = z.LocationID
GROUP BY z.BOROUGH
ORDER BY revenue DESC;


SELECT
    z.Borough,
    AVG(t.total_amount) AS revenue
FROM trips t 
LEFT JOIN zones z
ON t.PUlocationID = z.LocationID
GROUP BY z.BOROUGH
ORDER BY revenue DESC;

-- But it looks like manhattan has the lowest average

-- ====================================
-- TOP PICKUP ZONES
-- ====================================

SELECT
    z.Zone,
    COUNT(*) AS trips
FROM trips t
LEFT JOIN zones z
ON PUlocationID = LocationID
GROUP BY z.Zone
ORDER BY trips DESC
LIMIT 10;

-- ====================================
-- TOP TIMES AND DAYS
-- ====================================

SELECT 
    t.pickup_day,
    t.pickup_hour ,
    COUNT(*) AS trips
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.locationID
GROUP BY t.pickup_hour, t.pickup_day
ORDER BY trips DESC
LIMIT 10;

-- ====================================
-- REVENUE BY HOUR
-- ====================================

SELECT  
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_revenue_per_trip
FROM trips
GROUP BY pickup_hour
ORDER BY total_revenue
LIMIT 20;

-- ====================================
-- AVG TRIP DISTANCE BY HOUR
-- ====================================

SELECT
    AVG(trip_distance) AS avg_trip_dist,
    AVG(trip_duration_min) AS avg_trip_duration,
    pickup_hour
FROM trips
GROUP BY pickup_hour
ORDER BY avg_trip_dist;

-- ====================================
-- MOST USED ROUTES
-- ====================================

SELECT
    pu.Zone AS pickup_zone,
    do.Zone AS dropoff_zone,
    COUNT(*) AS trips
FROM trips t
LEFT JOIN zones pu
    ON t.PULocationID = pu.LocationID
LEFT JOIN zones do
    ON t.DOLocationID = do.LocationID
GROUP BY pickup_zone, dropoff_zone
ORDER BY trips DESC
LIMIT 10;

-- ====================================
-- AVG FARE BY BOROUGH
-- ====================================

SELECT
   z.Borough,
   AVG(t.fare_amount) AS avg_fare,
   AVG(t.trip_distance) AS avg_dist,
   AVG(t.trip_duration_min) AS avg_duration
FROM trips t
LEFT JOIN zones z
ON t.PUlocationID = z.locationID
GROUP BY z.Borough
ORDER BY avg_fare DESC; 

