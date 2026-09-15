-- 1. Check total number of records

SELECT COUNT(*) AS total_rides
FROM rides;

-- 2. View some records

SELECT *
FROM rides
LIMIT 10;

-- 3. Check columns and data types

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'rides'
ORDER BY ordinal_position;

-- 4. Check duplicate ride IDs

SELECT
    ride_id,
    COUNT(*) AS count
FROM rides
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- 5. Check ride status

SELECT
    ride_status,
    COUNT(*) AS total_rides
FROM rides
GROUP BY ride_status
ORDER BY total_rides DESC;

-- 6. Check different service types

SELECT
    service_type_clean,
    COUNT(*) AS total_rides
FROM rides
GROUP BY service_type_clean
ORDER BY total_rides DESC;

-- 7. Check payment methods

SELECT
    payment_method_clean,
    COUNT(*) AS total_rides
FROM rides
GROUP BY payment_method_clean
ORDER BY total_rides DESC;

-- 8. Check missing values

SELECT
    COUNT(*) AS total_rows,
    COUNT(ride_id) AS ride_id_available,
    COUNT(booking_datetime) AS booking_datetime_available,
    COUNT(distance) AS distance_available,
    COUNT(duration) AS duration_available,
    COUNT(total_fare) AS fare_available
FROM rides;

-- 9. Check negative distance values

SELECT COUNT(*) AS negative_distance
FROM rides
WHERE distance < 0;

-- 10. Check negative duration values

SELECT COUNT(*) AS negative_duration
FROM rides
WHERE duration < 0;

-- 11. Check negative fare values

SELECT COUNT(*) AS negative_fare
FROM rides
WHERE total_fare < 0;

-- 12. Check date range

SELECT
    MIN(booking_datetime) AS first_booking,
    MAX(booking_datetime) AS last_booking
FROM rides;

-- 13. Check completed rides

SELECT
    is_completed,
    COUNT(*) AS total_rides
FROM rides
GROUP BY is_completed
ORDER BY is_completed;

-- 14. Check cancelled rides

SELECT
    is_cancelled,
    COUNT(*) AS total_rides
FROM rides
GROUP BY is_cancelled
ORDER BY is_cancelled;

-- 15. Check ride status with completed and cancelled flags

SELECT
    ride_status,
    is_completed,
    is_cancelled,
    COUNT(*) AS total_rides
FROM rides
GROUP BY ride_status, is_completed, is_cancelled
ORDER BY total_rides DESC;

-- 16. Check distance

SELECT
    MIN(distance) AS minimum_distance,
    MAX(distance) AS maximum_distance,
    ROUND(AVG(distance)::numeric, 2) AS average_distance
FROM rides;

-- 17. Check fare

SELECT
    MIN(total_fare) AS minimum_fare,
    MAX(total_fare) AS maximum_fare,
    ROUND(AVG(total_fare)::numeric, 2) AS average_fare
FROM rides;

-- 18. Check duration

SELECT
    MIN(duration) AS minimum_duration,
    MAX(duration) AS maximum_duration,
    ROUND(AVG(duration)::numeric, 2) AS average_duration
FROM rides;