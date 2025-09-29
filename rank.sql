
WITH RegionalTotals AS (
  SELECT v.region,
         s.title AS show_title,
         SUM(l.watch_time) AS total_watch_time
  FROM view_logs l
  JOIN viewers v ON l.viewer_id = v.viewer_id
  JOIN shows s ON l.show_id = s.show_id
  GROUP BY v.region, s.title
)
SELECT region, show_title, total_watch_time,
       RANK() OVER (PARTITION BY region
                    ORDER BY total_watch_time DESC) AS rnk
FROM RegionalTotals
WHERE RANK() OVER (PARTITION BY region ORDER BY total_watch_time DESC) <= 5
ORDER BY region, rnk;
