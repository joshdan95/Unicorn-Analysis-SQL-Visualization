
/*KPI
total funding, investors, total valuation, total companies,
Avg funding ,Avg valuation
Top 10 unicorns with Largest valuation
countries with the Largest valuation
Unicorn distribution by countries
investors with total funding and valuation and number of companies
investors with total companies invested 
Total number of unicorns under each industry 
industries with total valuation and funding
On average how long does it take a company to become a unicorn? */


--Total Valuation
select sum(valuation) from
(select company, valuation
from Sheet1$
group by Company, valuation
)x

--Avg Valuation
select avg(valuation) from
(select company, valuation
from Sheet1$
group by Company, valuation
)x

--total funding
select sum(Funding) from
(select company, Funding
from Sheet1$
group by Company, Funding
)x

--Avg funding
select avg(Funding) from
(select company, Funding
from Sheet1$
group by Company, Funding
)x

--total investors
select count(distinct[Select Investors])
from Sheet1$

-- total companies
select count(distinct company)
from Sheet1$

--top 10 unicorns with Largest valuation
select  company, valuation
from Sheet1$
group by Company, valuation
order by valuation desc

--countries with Largest valuation
select  country, sum(valuation) as Valuation, count(Company) as Company  from
(select  Country, valuation, Company
from Sheet1$
group by Country, valuation, Company
)x
group by Country

--Unicorn distribution by countries
select  Country, count(distinct company) as company
from Sheet1$
group by Country

--investors with total funding and valution and number of companies
select  [Select Investors], count(Company) as Company,sum(valuation) as Valuation from
(select  [Select Investors], valuation, Company
from Sheet1$
group by [Select Investors], valuation,Company
)x
group by [Select Investors]
order by Valuation desc

--investors with total companies invested 
select  [Select Investors], count(distinct company) as company
from Sheet1$
group by [Select Investors]
order by company desc


 --Total number of companies under each industry 
select  industry, count(distinct company) as company
from Sheet1$
group by Industry

--industries with total valuation and funding
select  Industry, sum(valuation) as Valuation, sum(funding) as Funding from
(select  Industry, valuation, Funding 
from Sheet1$
group by Industry, valuation, Funding
)x
group by Industry;


--On average how long does it take a company to become a unicorn?
select avg(year([Date joined]) - [Year Founded])
from
Sheet1$


