/*
1. Introduction
	Observe the result of running this SQL command to show the name, continent and population of all countries. 
 */
 SELECT 
	name AS Country, 
	continent AS Continent, 
	population AS Population
FROM world
 
 /*
 2. Large Countries
	Show the name for the countries that have a population of at leASt 200 million. 200 million is 200000000, there are eight zeros. 
 */
SELECT name AS Country
	FROM world
WHERE population >= 200000000
ORDER BY population DESC

/*
3. Per capita GDP
	Give the name and the per capita GDP for those countries with a population of at leASt 200 million. 
*/
SELECT name AS Country, GDP/population AS population 
	FROM world
WHERE population >= 200000000
ORDER BY population DESC

/*
4. South America In millions
	Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. 
*/
SELECT name AS Country, population/1000000 AS population 
	FROM world
WHERE continent LIKE 'South America'
ORDER BY population DESC

/*
5. France, Germany, Italy
	Show the name and population for France, Germany, Italy 
*/
SELECT 
	name AS Country, 
	population AS Population
FROM world
	WHERE name IN ('France', 'Germany', 'Italy')
	ORDER BY population DESC

/*
6. United
	Show the countries which have a name that includes the word 'United' 
*/
SELECT name AS Country
	FROM world
WHERE name LIKE '%United%'

/*
7. Two ways to be big
	Two ways to be big: A country is big if it hAS an area of more than 3 million sq km or it hAS a population of more than 250 million.
	Show the countries that are big by area or big by population. Show name, population and area.
*/
SELECT 
	name AS Country, 
	population AS Population, 
	area AS Area 
FROM world
	WHERE area >= 3000000 OR population >= 250000000
	ORDER BY population DESC

/*
8. One or the other (but not both)

Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
- Australia hAS a big area but a small population, it should be included.
- Indonesia hAS a big population but a small area, it should be included.
- China hAS a big population and big area, it should be excluded.
- United Kingdom hAS a small population and a small area, it should be excluded.
*/
SELECT
	name AS Country, 
	population AS Population, 
	area AS Area
FROM world
	WHERE (population >= 250000000 AND area <= 3000000) OR (population <= 250000000 AND area >= 3000000)
	ORDER BY area DESC


/*
9. Rounding
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
*/
SELECT 
	name AS Country, 
	ROUND(population/1000000,2) AS population, 
	ROUND(GDP/1000000000,2) AS GDP 
FROM world
	WHERE continent LIKE 'South America'
	ORDER BY population DESC

/*
10. Trillion dollar economies

Show the name and per-capita GDP for those countries with a GDP of at leASt one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.
*/
SELECT 
	name AS Country, 
	ROUND(gdp/population, -3) AS percapitaGDP
FROM world
 WHERE gdp > 1000000000000
ORDER BY percapitaGDP DESC

/*
11. Name and capital have the same length

Greece hAS capital Athens.
Each of the strings 'Greece', and 'Athens' has 6 characters.

Show the name and capital where the name and the capital have the same number of characters.

HINTS: Use LEFT function
*/
SELECT name, capital
  FROM world
WHERE LENGTH(name) = LENGTH(capital)

/*
12. Matching name and capital

The capital of Sweden is Stockholm. Both words start with the letter 'S'.
Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

HINTS: 
- use the function LEFT to isolate the first character.
- use <> AS the NOT EQUALS operator.
*/
SELECT name, capital
	FROM world
WHERE LEFT(name,1)=LEFT(capital,1) AND name <> capital

/*
13. All the vowels

Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

Find the country that has all the vowels and no spaces in its name.

HINTS:
- use the phrASe name NOT LIKE '%a%' to exclude characters from your results.
*/
SELECT name 
	FROM world
WHERE name LIKE '%A%' AND
       name LIKE '%I%' AND
        name LIKE '%U%' AND
         name LIKE '%E%' AND
          name LIKE '%O%' AND 
           name NOT LIKE '% %'