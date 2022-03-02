SELECT SUM(c.POPULATION)
FROM CITY c
JOIN COUNTRY co ON co.CODE = c.COUNTRYCODE
WHERE co.CONTINENT = 'Asia'
