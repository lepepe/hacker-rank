SELECT c.NAME
FROM CITY c
JOIN COUNTRY co ON c.COUNTRYCODE = co.CODE
WHERE co.CONTINENT = 'Africa';
