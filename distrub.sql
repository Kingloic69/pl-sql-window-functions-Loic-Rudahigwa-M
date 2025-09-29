
SELECT viewer_id,
       total_watch_time,
       NTILE(4) OVER (ORDER BY total_watch_time DESC) AS quartile
FROM (
  SELECT viewer_id, SUM(watch_time) AS total_watch_time
  FROM view_logs
  GROUP BY viewer_id
) vt
ORDER BY quartile, total_watch_time DESC;
