--NUMBER OF ATHELETES FROM EACH COUNTRY--
SELECT Country, COUNT(*) AS TotalAtheletes
FROM atheletes
GROUP BY Country
ORDER BY TotalAtheletes DESC;

--PERCENTAGE OF MALE AND FEMALE IN EACH DISCIPLINE--
SELECT
    Discipline,
    ROUND(SUM(Male) * 100.0 / (SUM(Male) + SUM(Female)), 2) AS MalePercentage,
    ROUND(SUM(Female) * 100.0 / (SUM(Male) + SUM(Female)), 2) AS FemalePercentage
FROM
    entriesgender
GROUP BY
    Discipline;

--total number of medals won by each country
SELECT Team_Country, SUM(Total) AS TotalMedals
FROM Medals
GROUP BY Team_Country;

--basic filtering -- 
select * from atheletes
where Country = 'India';

--Basic sorting --
SELECT * FROM medals
ORDER BY Rank;

-- basic subqueries --
SELECT PersonName, Country
FROM atheletes
WHERE Country IN (SELECT Team_Country FROM medals WHERE Gold > 0);

-- basic grouping --
SELECT Team_Country, AVG(Total) AS AvgMedals
FROM Medals
GROUP BY Team_Country;
