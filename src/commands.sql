CREATE TABLE cars (
                      id SERIAL PRIMARY KEY,
                      brand VARCHAR(50) NOT NULL,
                      model VARCHAR(50) NOT NULL,
                      year_of_issue int NOT NULL,
                      price DECIMAL(8,2) NOT NULL ,
                      color VARCHAR(50) NOT NULL
);


SELECT model, brand, price
FROM cars;

SELECT count(*) FROM cars;

SELECT *
FROM cars WHERE brand='Hyundai';

SELECT *
FROM cars WHERE year_of_issue BETWEEN 2000 AND 2010;

SELECT *
FROM cars WHERE color='Blue' OR color='Red';

SELECT count(*)
FROM cars WHERE brand='Chevrolet';

SELECT avg(year_of_issue) from cars;

SELECT *
FROM cars WHERE brand='Toyota' OR brand='Kia' OR brand='Audi' OR brand='Ford';

SELECT *
FROM cars WHERE brand LIKE '%T%';

SELECT *
FROM cars WHERE brand LIKE '%e';

SELECT *
FROM cars WHERE brand LIKE '_____';

SELECT  SUM(price) AS sum_total FROM cars WHERE brand='Mercedes-Benz';

SELECT *
FROM cars WHERE price=(SELECT MAX(price) FROM cars) OR price=(SELECT MIN(price) FROM cars);

SELECT *
FROM cars WHERE brand!='Toyota';

SELECT *
FROM cars  ORDER BY price DESC LIMIT 10;

SELECT *
FROM cars WHERE year_of_issue NOT BETWEEN 1995 AND 2005;

SELECT color,count(*) FROM cars GROUP BY color ORDER BY count(*) desc  limit 1;

SELECT year_of_issue,count(*) FROM cars GROUP BY year_of_issue ORDER By year_of_issue asc ;

SELECT avg(price) from cars where brand='Ford';

SELECT sum(price) FROM cars WHERE color!='Red';

SELECT brand, count(*) FROM cars GROUP BY brand ORDER BY count(*) asc ;

SELECT * FROM cars  ORDER BY price DESC LIMIT 1;

SELECT avg(price) as average_price FROM cars WHERE year_of_issue>2005 AND color='Maroon';

SELECT count(*) from cars where brand='Toyota' and cars.price>(SELECT avg(price) FROM cars);

SELECT count(*) FROM cars WHERE brand='Toyota';

SELECT brand, price FROM cars where cars.price > 80000 GROUP BY brand, price ;

SELECT brand  FROM cars where cars.color!= 'purple' GROUP BY brand;

SELECT brand, year_of_issue, price from cars where year_of_issue=1990 AND price>30000 group by brand, year_of_issue, price;

select brand, year_of_issue, color from cars where year_of_issue=2000 and color='Turquoise';

select brand from cars where year_of_issue!=1890;

select brand from cars group by brand having sum(price)>500000;

select  model from cars group by model having max(price)>(Select avg(price) from cars);

SELECT model, count(*)  FROM cars where cars.color='Goldenrod' GROUP BY model;
select model from cars where year_of_issue>2000 group by model;
select model from cars group by model having avg(year_of_issue)<=2005;
select model
from cars
group by model
having AVG(price) = (select MAX(avg_price) from (select AVG(price) as avg_price from cars group by model) as avg_prices);

SELECT model
FROM cars
GROUP BY model
HAVING AVG(year_of_issue) = (SELECT MIN(avg_year) FROM (SELECT AVG(year_of_issue) as avg_year FROM cars GROUP BY model) AS year_avg);

select brand from cars group by brand having sum(price)<=1000000;

select brand from cars group by brand having count(*)<=10;

select brand
from cars
group by brand
having COUNT(*) = (select MAX(car_count) from (select COUNT(*) as car_count from cars group by brand) as counts);

select brand
from cars
group by brand
having count(*)=(Select min(car_count) from (select count(*) as car_count from cars group by brand) as counts);

select brand
from cars
group by brand
having max(price)>=70000 and max(year_of_issue)<2010;

SELECT  brand FROM cars WHERE  price > 5000 AND color <> 'Black';

select model from cars group by model having avg(year_of_issue)=max(year_of_issue);

SELECT model
FROM cars
GROUP BY model
HAVING COUNT(*) <= 50;


SELECT brand
FROM cars
GROUP BY brand
HAVING (MAX(price) / MIN(price)) > 5;
