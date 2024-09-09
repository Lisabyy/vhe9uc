-- Wordld Database
SELECT name FROM country WHERE continent = 'South America';
SELECT population FROM country WHERE name = 'Germany';
SELECT name FROM city where countrycode = 'JPN';
SELECT name, population FROM country WHERE continent = 'Africa' ORDER BY population DESC LIMIT 3;
SELECT name, lifeexpectancy FROM country WHERE 1000000 < population < 5000000;
SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- Chinook Database
SELECT AlbumId, Title FROM Album WHERE ArtistId = (SELECT ArtistId FROM Artist WHERE Artist = 'AC/DC');
SELECT FirstName, LastName, Email FROM Customer WHERE country = 'Brazil';
SELECT Name FROM Playlist;
SELECT COUNT(Track.TrackId) AS TrackCount FROM Track WHERE GenreID = 1;
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName = 'Edwards');
SELECT Invoice.CustomerId, SUM(Invoice.Total) AS TotalSales
FROM Invoice
GROUP BY Invoice.CustomerId
ORDER BY TotalSales DESC;

-- New Database: Table 1
CREATE TABLE FY25_Q2_Sales(
    Brand VARCHAR(10),
    Sales_segment VARCHAR(10),
    Sales VARCHAR(10));
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('Anth', 'Retail', '549.6');
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('FP', 'Retail', '294.3');
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('UO', 'Retail', '298.6');
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('MV', 'Retail', '7');
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('FP', 'Wholesale', '60.7');
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('UO', 'Wholesale', '4.1');
INSERT INTO FY25_Q2_Sales (Brand, Sales_segment, Sales) VALUES ('Nuuly', ' ', '90.7');

-- New Database: Table 2
CREATE TABLE FY24_25_Q2_Store(
    Brand VARCHAR(10),
    Global_store_count VARCHAR(10),
    Time VARCHAR(10));
 INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('Anth', '237', 'FY24 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('FP', '196', 'FY24 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('UO', '264', 'FY24 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('MV', '11', 'FY24 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('Anth', '239', 'FY25 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('FP', '205', 'FY25 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('UO', '263', 'FY25 Q2');
INSERT INTO FY24_25_Q2_Store (Brand, Global_store_count, Time) VALUES ('MV', '9', 'FY25 Q2');

-- New Database: Table 3
CREATE TABLE Ins_Followers(
    Brand VARCHAR(10),
    Ins_Followers VARCHAR(10));
INSERT INTO Ins_Followers (Brand, Ins_Followers) VALUES ('Anth', '4.6');
INSERT INTO Ins_Followers (Brand, Ins_Followers) VALUES ('FP', '4.5');
INSERT INTO Ins_Followers (Brand, Ins_Followers) VALUES ('UO', '9');
INSERT INTO Ins_Followers (Brand, Ins_Followers) VALUES ('MV', ' ');
INSERT INTO Ins_Followers (Brand, Ins_Followers) VALUES ('Nuuly', '0.26');

ALTER TABLE FY25_Q2_Sales
ADD PRIMARY KEY (Sales);
ALTER TABLE FY24_25_Q2_Store
ADD PRIMARY KEY (Global_store_count);
ALTER TABLE Ins_Followers
ADD PRIMARY KEY (Brand);

-- New Database: Queries
SELECT brand FROM Ins_Followers WHERE Ins_Followers > 1;
SELECT SUM(Sales) as total_sales FROM FY25_Q2_Sales;
SELECT brand, global_store_count from FY24_25_Q2_Store WHERE time = 'FY25 Q2';