WITH date_spine AS (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('1990-01-01' as date)",
        end_date="cast('2030-12-31' as date)"
    ) }}
)

SELECT
    FORMAT_DATE('%Y%m%d', date_day) AS date_id,
    date_day,
    EXTRACT(YEAR FROM date_day) AS year,
    EXTRACT(QUARTER FROM date_day) AS quarter,
    EXTRACT(MONTH FROM date_day) AS month,
    FORMAT_DATE('%B', date_day) AS month_name,
    EXTRACT(WEEK FROM date_day) AS week_of_year,
    EXTRACT(DAY FROM date_day) AS day_of_month,
    EXTRACT(DAYOFWEEK FROM date_day) AS day_of_week,
    FORMAT_DATE('%A', date_day) AS day_name,
    CASE WHEN EXTRACT(DAYOFWEEK FROM date_day) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend,
    CASE WHEN EXTRACT(MONTH FROM date_day) IN (1, 2, 3) THEN 'Q1'
         WHEN EXTRACT(MONTH FROM date_day) IN (4, 5, 6) THEN 'Q2'
         WHEN EXTRACT(MONTH FROM date_day) IN (7, 8, 9) THEN 'Q3'
         ELSE 'Q4' END AS quarter_name,
    CONCAT('FY', EXTRACT(YEAR FROM date_day)) AS fiscal_year
FROM date_spine