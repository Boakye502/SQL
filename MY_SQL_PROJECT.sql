CREATE DATABASE TEST;
USE TEST;

SELECT * FROM Forest_Area;

SELECT * FROM Land_Area;

SELECT * FROM Region;

--QUESTION 1 WHAT ARE THE TOTAL NUMBER OF COUNTRIES INVOLVED IN DEFORESTATION

SELECT COUNT(DISTINCT country_name) AS TOTAL_COUNTRIES_INVOLVED
FROM Forest_Area;

--QUESTION 2 SHOW THE INCOME GROUPS OF COUNTRIES HAVING AREA RANGING 75,000 TO 150,000 Sqm

SELECT income_group
from Land_Area AS LA
INNER JOIN Region AS R ON LA.country_name = R.country_name
WHERE LA.total_area_sq_mi * 2.59 BETWEEN 75000 AND 150000;

---QUESTION 3

SELECT AVG(la.total_area_sq_mi) as avg_area_upperIncome
from Land_Area la
inner join region as r on la.country_code = r.country_code
where r.income_group = 'upper middle income';

--Average area for other income groups

SELECT AVG(la.total_area_sq_mi) as avg_area_other_upperIncome
from Land_Area la
inner join region as r on la.country_code = r.country_code
where r.income_group <> 'upper middle income';


--QUESTION 4
SELECT SUM(forest_area_sqkm) AS total_forest_area_high_income
from Forest_Area AS fa
inner join Region AS r ON fa.country_code =r.country_code
where r.income_group = 'high income';

--Total forest area for other income groups

SELECT SUM(forest_area_sqkm) AS total_forest_area_high_income
from Forest_Area AS fa
inner join Region AS r ON fa.country_code =r.country_code
where r.income_group <> 'high income';


--Question 5. show countries from each region having heighest total forest area

SELECT Region,
max(forest_area_sqkm) as highest_forest_area
from Forest_Area fa
join region r on fa.country_name = r.country_name
group by region;
