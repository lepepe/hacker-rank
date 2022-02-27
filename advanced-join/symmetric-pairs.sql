SELECT fa.x, fa.y
FROM Functions fa
    JOIN Functions fb ON fa.x = fb.y AND fa.y = fb.x
GROUP BY fa.x, fa.y
HAVING COUNT(fa.x) > 1 OR fa.x < fa.y
ORDER BY fa.x
