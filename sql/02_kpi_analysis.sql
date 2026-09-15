-- 1. Overall business KPIs

SELECT
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS completion_rate,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare,
    ROUND(SUM(total_fare)::numeric, 2) AS total_revenue
FROM rides;

-- 2. Performance by service type

SELECT
    service_type_clean,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS completion_rate,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare,
    ROUND(SUM(total_fare)::numeric, 2) AS total_revenue
FROM rides
GROUP BY service_type_clean
ORDER BY total_rides DESC;

-- 3. Revenue by service type

SELECT
    service_type_clean,
    COUNT(*) AS total_rides,
    COUNT(total_fare) AS rides_with_fare,
    ROUND(SUM(total_fare)::numeric, 2) AS total_revenue,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare
FROM rides
GROUP BY service_type_clean
ORDER BY total_revenue DESC;

-- 4. Performance by time period

SELECT
    time_period,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS completion_rate,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY time_period
ORDER BY total_rides DESC;

-- 5. Performance by hour

SELECT
    hour,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY hour
ORDER BY hour;

-- 6. Performance by day of week

SELECT
    day_of_week,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare
FROM rides
GROUP BY day_of_week, day_of_week_num
ORDER BY day_of_week_num;

-- 7. Monthly performance

SELECT
    month,
    month_name,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS completion_rate,
    ROUND(SUM(total_fare)::numeric, 2) AS total_revenue
FROM rides
GROUP BY month, month_name
ORDER BY month;

-- 8. Performance by payment method

SELECT
    payment_method_clean,
    COUNT(*) AS total_rides,
    COUNT(total_fare) AS rides_with_fare,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare,
    ROUND(SUM(total_fare)::numeric, 2) AS total_revenue
FROM rides
GROUP BY payment_method_clean
ORDER BY total_rides DESC;

-- 9. Performance by distance bucket

SELECT
    distance_bucket,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare,
    ROUND(AVG(fare_per_km)::numeric, 2) AS average_fare_per_km,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY distance_bucket
ORDER BY total_rides DESC;

-- 10. Performance by duration bucket

SELECT
    duration_bucket,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY duration_bucket
ORDER BY total_rides DESC;

-- 11. Basic distance, duration and fare performance

SELECT
    ROUND(AVG(distance)::numeric, 2) AS average_distance,
    ROUND(AVG(duration)::numeric, 2) AS average_duration,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare,
    ROUND(AVG(fare_per_km)::numeric, 2) AS average_fare_per_km
FROM rides
WHERE is_completed = 1;