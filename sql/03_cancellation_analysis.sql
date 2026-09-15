-- 1. Overall cancellation

SELECT
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides;

-- 2. Cancellation by service type

SELECT
    service_type_clean,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY service_type_clean
ORDER BY cancellation_rate DESC;

-- 3. Cancellation by time period

SELECT
    time_period,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY time_period
ORDER BY cancellation_rate DESC;

-- 4. Cancellation by hour

SELECT
    hour,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY hour
ORDER BY cancellation_rate DESC;

-- 5. Cancellation by day of week

SELECT
    day_of_week,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY day_of_week, day_of_week_num
ORDER BY cancellation_rate DESC;

-- 6. Cancellation by weekday and weekend

SELECT
    CASE
        WHEN is_weekend = TRUE THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY is_weekend
ORDER BY cancellation_rate DESC;

-- 7. Cancellation by distance bucket

SELECT
    distance_bucket,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY distance_bucket
ORDER BY cancellation_rate DESC;

-- 8. Cancellation by duration bucket

SELECT
    duration_bucket,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY duration_bucket
ORDER BY cancellation_rate DESC;

-- 9. Cancellation by service type and time period

SELECT
    service_type_clean,
    time_period,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY service_type_clean, time_period
HAVING COUNT(*) >= 20
ORDER BY cancellation_rate DESC;

-- 10. Cancellation by distance and time period

SELECT
    distance_bucket,
    time_period,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY distance_bucket, time_period
HAVING COUNT(*) >= 20
ORDER BY cancellation_rate DESC;

-- 11. Cancellation by service type and distance

SELECT
    service_type_clean,
    distance_bucket,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        (100.0 * SUM(CASE WHEN is_cancelled = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0))::numeric,
        2
    ) AS cancellation_rate
FROM rides
GROUP BY service_type_clean, distance_bucket
HAVING COUNT(*) >= 20
ORDER BY cancellation_rate DESC;