-- Soal 2 : Weather Observation Station 18
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-18/problem
-- Tujuan: Agregasi MIN/MAX, manipulasi numerik, format hasil.

WITH station_extreme as (
    SELECT 
        MIN(s.LAT_N) as MIN_LAT,
        MAX(s.LAT_N) as MAX_LAT,
        MIN(s.LONG_W) as MIN_W,
        MAX(s.LONG_W) as MAX_W
    FROM STATION as s
)   
    
SELECT
    ROUND(ABS(MAX_LAT - MIN_LAT) + ABS(MAX_W - MIN_W), 4) as manhattan_distance
FROM
    station_extreme;
