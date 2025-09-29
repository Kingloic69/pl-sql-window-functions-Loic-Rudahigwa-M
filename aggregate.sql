/* SUM */

WITH MonthlyTotals AS (
  SELECT TO_CHAR(view_date, 'YYYY-MM') AS month_year,
         SUM(watch_time) AS monthly_watch_time
  FROM view_logs
  GROUP BY TO_CHAR(view_date, 'YYYY-MM')
)
SELECT month_year AS Month,
       monthly_watch_time AS MonthlyWatchTime,
       SUM(monthly_watch_time) OVER (ORDER BY month_year
                                     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
         AS RunningTotal
FROM MonthlyTotals
ORDER BY month_year;


/* Average */


WITH MonthlyTotals AS (
  SELECT TO_CHAR(view_date, 'YYYY-MM') AS month_year,
         SUM(watch_time) AS monthly_watch_time
  FROM view_logs
  GROUP BY TO_CHAR(view_date, 'YYYY-MM')
)
SELECT month_year AS Month,
       monthly_watch_time AS MonthlyWatchTime,
       ROUND(
         AVG(monthly_watch_time) OVER (
           ORDER BY month_year
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
         ), 1
       ) AS MovingAvg3Mo
FROM MonthlyTotals
ORDER BY month_year;
