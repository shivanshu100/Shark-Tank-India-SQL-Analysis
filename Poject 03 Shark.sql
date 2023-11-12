select * from Data

-- Total number of episodes

select max(epno) from Data
select count(distinct epno) from data

-- Total Brands

select count(distinct brand) from data

--Pitches converted

select cast(sum(a.converted_not_converted) as float) Successful ,cast(count(*) as float) Total , round(cast(sum(a.converted_not_converted)as float)/cast(count(*) as float),2) from (
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from data) a

--Total males, females and gender ratios

select sum(male), sum(female), sum(male)/sum(female)from data

--Total amount invested

select sum(amountinvestedlakhs) amount_invested_in_lakhs from data

--Average equilty Taken

select sum(EquityTaken)/count(brand) from data where equitytaken>0
--OR
select AVG(a.equitytaken) from
(select * from data where equitytaken>0) a

-- Highest Deal

select MAX(amountinvestedlakhs) from data

-- Highest equilty taken

select MAX(EquityTaken) from data

-- Brands with atleast one female

select count(*) from  data where female>0
--OR
select sum(a.female_count) startups from (
select female, case when female>0 then 1 else 0 end as female_count from data)a

-- Pitches coverted with atleast one female

select count(*) from data where female>0 and equitytaken>0
--OR

select sum(b.female_count) from(
select case when a.female>0 then 1 else 0 end as female_count from(
(select * from data where deal!='NO Deal'))a)b

-- Average team members

select avg(teammembers)from data

-- Average amount invested per deal

select AVG(a.amountinvestedlakhs) invested from(
select * from data where deal!='No deal') a

-- Average age group of brand

select avgage, count(avgage) cout from data group by avgage order by cout desc

-- Most startup came from city

select location, count(location) x from data group by location order by x desc

-- Most startup came from sector

select sector, count(sector) x from data group by sector order by x desc

--Partners

select partners, count(partners)  number from data where partners!='-' group by partners order by number desc

-- making the matrix


select * from data

select 'Ashnner' as keyy,count(ashneeramountinvested) from data where ashneeramountinvested is not null

select 'Ashnner' as keyy,count(ashneeramountinvested) from data where ashneeramountinvested is not null AND ashneeramountinvested!=0

SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED),AVG(C.ASHNEEREQUITYTAKENP) 
FROM (SELECT * FROM DATA  WHERE ASHNEEREQUITYTAKENP!=0 AND ASHNEEREQUITYTAKENP IS NOT NULL) C


select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_present from data where ashneeramountinvested is not null) a

inner join (
select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals from data 
where ashneeramountinvested is not null AND ashneeramountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED) total_amount_invested,
AVG(C.ASHNEEREQUITYTAKEN) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE ASHNEEREQUITYTAKEN!=0 AND ASHNEEREQUITYTAKEN IS NOT NULL) C) n

on m.keyy=n.keyy

union

select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Namita' as keyy,count(Namitaamountinvested) total_deals_present from data where Namitaamountinvested is not null) a

inner join (
select 'Namita' as keyy,count(Namitaamountinvested) total_deals from data 
where Namitaamountinvested is not null AND Namitaamountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Namita' as keyy,SUM(C.NamitaAMOUNTINVESTED) total_amount_invested,
AVG(C.NamitaEQUITYTAKEN) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE NamitaEQUITYTAKEN!=0 AND NamitaEQUITYTAKEN IS NOT NULL) C) n

on m.keyy=n.keyy

union

select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Anupam' as keyy,count(Anupamamountinvested) total_deals_present from data where Anupamamountinvested is not null) a

inner join (
select 'Anupam' as keyy,count(Anupamamountinvested) total_deals from data 
where Anupamamountinvested is not null AND Anupamamountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Anupam' as keyy,SUM(C.AnupamAMOUNTINVESTED) total_amount_invested,
AVG(C.AnupamEQUITYTAKEN) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE AnupamEQUITYTAKEN!=0 AND AnupamEQUITYTAKEN IS NOT NULL) C) n

on m.keyy=n.keyy

union

select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Vineeta' as keyy,count(Vineetaamountinvested) total_deals_present from data where Vineetaamountinvested is not null) a

inner join (
select 'Vineeta' as keyy,count(Vineetaamountinvested) total_deals from data 
where Vineetaamountinvested is not null AND Vineetaamountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Vineeta' as keyy,SUM(C.VineetaAMOUNTINVESTED) total_amount_invested,
AVG(C.VineetaEQUITYTAKEN) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE VineetaEQUITYTAKEN!=0 AND VineetaEQUITYTAKEN IS NOT NULL) C) n

on m.keyy=n.keyy

union

select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Aman' as keyy,count(Amanamountinvested) total_deals_present from data where Amanamountinvested is not null) a

inner join (
select 'Aman' as keyy,count(Amanamountinvested) total_deals from data 
where Amanamountinvested is not null AND Amanamountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Aman' as keyy,SUM(C.AmanAMOUNTINVESTED) total_amount_invested,
AVG(C.AmanEQUITYTAKEN) avg_equity_taken
FROM (SELECT * FROM DATA  WHERE AmanEQUITYTAKEN!=0 AND AmanEQUITYTAKEN IS NOT NULL) C) n

on m.keyy=n.keyy

-- startup with highest investment in particular domain

select c.* from 
(select brand,sector, amountinvestedlakhs, rank() over (partition by sector order by amountinvestedlakhs desc) rnk
from data)c

where c.rnk=1
