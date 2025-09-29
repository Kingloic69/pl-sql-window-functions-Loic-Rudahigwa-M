
WITH MonthlyTotals AS (
  SELECT TO_CHAR(view_date, 'YYYY-MM') AS month_year,
         SUM(watch_time) AS monthly_watch_time
  FROM view_logs
  GROUP BY TO_CHAR(view_date, 'YYYY-MM')
)
SELECT month_year AS Month,
       monthly_watch_time AS MonthlyWatchTime,
       (monthly_watch_time - LAG(monthly_watch_time) OVER (ORDER BY month_year))
         AS ChangeFromPrevMonth
FROM MonthlyTotals
ORDER BY month_year;
