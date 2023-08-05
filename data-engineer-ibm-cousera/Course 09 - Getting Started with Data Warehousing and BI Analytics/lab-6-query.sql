--  Write a query using grouping sets
select year,category, sum(billedamount) as totalbilledamount
from "FactBilling"
left join "DimCustomer"
on "FactBilling".customerid = "DimCustomer".customerid
left join "DimMonth"
on "FactBilling".monthid="DimMonth".monthid
group by grouping sets(year,category);

-- year | category | totalbilledamount
-- ------+----------+-------------------
--  2015 |          |         119808719
--  2011 |          |         119427469
--  2014 |          |         119239283
--  2010 |          |         119484658
--  2017 |          |         119526654
--  2019 |          |         120820495
--  2016 |          |         120433289
--  2012 |          |         120761543
--  2018 |          |         119595980
--  2009 |          |         120263327
--  2013 |          |         120859328
--       | C        |         647445529
--       | I        |         672775216

-- Write a query using rollup
select year,category, sum(billedamount) as totalbilledamount
from "FactBilling"
left join "DimCustomer"
on "FactBilling".customerid = "DimCustomer".customerid
left join "DimMonth"
on "FactBilling".monthid="DimMonth".monthid
group by rollup(year,category)
order by year, category;

-- year | category | totalbilledamount
-- ------+----------+-------------------
--  2009 | C        |          59048255
--  2009 | I        |          61215072
--  2009 |          |         120263327
--  2010 | C        |          58725739
--  2010 | I        |          60758919
--  2010 |          |         119484658
--  2011 | C        |          58559675
--  2011 | I        |          60867794
--  2011 |          |         119427469
--  2012 | C        |          58981336
--  2012 | I        |          61780207
--  2012 |          |         120761543
--  2013 | C        |          59450681
--  2013 | I        |          61408647
--  2013 |          |         120859328
--  2014 | C        |          58375062
--  2014 | I        |          60864221
--  2014 |          |         119239283
--  2015 | C        |          58860727
--  2015 | I        |          60947992
--  2015 |          |         119808719
--  2016 | C        |          58969379
--  2016 | I        |          61463910
--  2016 |          |         120433289
--  2017 | C        |          58408457
--  2017 | I        |          61118197
--  2017 |          |         119526654
--  2018 | C        |          58629460
--  2018 | I        |          60966520
--  2018 |          |         119595980
--  2019 | C        |          59436758
--  2019 | I        |          61383737
--  2019 |          |         120820495
--       |          |        1320220745
-- (34 rows)

-- Write a query using cube
select year,category, sum(billedamount) as totalbilledamount
from "FactBilling"
left join "DimCustomer"
on "FactBilling".customerid = "DimCustomer".customerid
left join "DimMonth"
on "FactBilling".monthid="DimMonth".monthid
group by cube(year,category)
order by year, category;

-- year | category | totalbilledamount
-- ------+----------+-------------------
--  2009 | C        |          59048255
--  2009 | I        |          61215072
--  2009 |          |         120263327
--  2010 | C        |          58725739
--  2010 | I        |          60758919
--  2010 |          |         119484658
--  2011 | C        |          58559675
--  2011 | I        |          60867794
--  2011 |          |         119427469
--  2012 | C        |          58981336
--  2012 | I        |          61780207
--  2012 |          |         120761543
--  2013 | C        |          59450681
--  2013 | I        |          61408647
--  2013 |          |         120859328
--  2014 | C        |          58375062
--  2014 | I        |          60864221
--  2014 |          |         119239283
--  2015 | C        |          58860727
--  2015 | I        |          60947992
--  2015 |          |         119808719
--  2016 | C        |          58969379
--  2016 | I        |          61463910
--  2016 |          |         120433289
--  2017 | C        |          58408457
--  2017 | I        |          61118197
--  2017 |          |         119526654
--  2018 | C        |          58629460
--  2018 | I        |          60966520
--  2018 |          |         119595980
--  2019 | C        |          59436758
--  2019 | I        |          61383737
--  2019 |          |         120820495
--       | C        |         647445529
--       | I        |         672775216
--       |          |        1320220745
-- (36 rows)

-- Create a Materialized Query Table(MQT)
-- Step 1: Create the MQT
CREATE MATERIALIZED VIEW countrystats (country, year, totalbilledamount) AS
(select country, year, sum(billedamount)
from "FactBilling"
left join "DimCustomer"
on "FactBilling".customerid = "DimCustomer".customerid
left join "DimMonth"
on "FactBilling".monthid="DimMonth".monthid
group by country,year);

-- Step 2: Populate/refresh data into the MQT.
REFRESH MATERIALIZED VIEW countrystats;

select * from countrystats;

