-- solucao 1

SELECT s.machine_id, ROUND(AVG(e.timestamp-s.timestamp), 3) AS processing_time
FROM Activity s JOIN Activity e ON
    s.machine_id = e.machine_id AND s.process_id = e.process_id AND
    s.activity_type = 'start' AND e.activity_type = 'end'
GROUP BY s.machine_id

-- solucao 2

SELECT machine_id, ROUND((SUM(CASE WHEN activity_type = 'end' THEN timestamp END)-SUM(CASE WHEN activity_type = 'start' THEN timestamp END))/COUNT(DISTINCT process_id), 3) processing_time
FROM Activity
GROUP BY 1