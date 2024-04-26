SELECT c.Name, COUNT(p.ID) AS PROJECT_COUNT
FROM client c
JOIN project p ON c.ID = p.CLIENT_ID
GROUP BY c.ID, c.Name
HAVING COUNT(p.ID) = (
    SELECT COUNT(p2.ID)
    FROM project p2
    GROUP BY p2.CLIENT_ID
    ORDER BY COUNT(p2.ID) DESC
    LIMIT 1
);