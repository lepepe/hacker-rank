SELECT s.name
FROM Students s
    JOIN Friends f ON s.id = f.id
    JOIN Packages p1 ON f.id = p1.id
    JOIN packages p2 ON f.friend_id = p2.id
WHERE p1.Salary < p2.Salary
ORDER BY p2.Salary;
