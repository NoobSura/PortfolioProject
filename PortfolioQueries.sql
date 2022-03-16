select * from Portfolio..CovidDeaths
where continent is not null
order by 3,4

--select * from Portfolio..CovidVaccinations
--order by 3,4

-- select data that we going to be using

select location, date, total_cases, new_cases, total_deaths, population
from Portfolio..CovidDeaths
where continent is not null
order by 1,2

-- looking at total cases vs total deaths percentage --
-- chances of death contracting covid in india--
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from Portfolio..CovidDeaths
where location like '%India%'
and continent is not null
order by 1,2

-- looking at total cases vs population--

select location, date, total_cases, population, (total_cases/population)*100 as InfectRatio
from Portfolio..CovidDeaths
where location like '%India%' and continent is not null
order by 1,2

-- looking at countries with highest infection rate--

select location, population, MAX(total_cases) as HighestInfectionRate, MAX((total_cases/population))*100 as PopulationPercentageInfected
from Portfolio..CovidDeaths
where continent is not null
group by population, location
order by PopulationPercentageInfected DESC

--showing countries with highest death count per population--
select location, max(cast(total_deaths as int)) as TotalDeathCount
from Portfolio..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount DESC

--lets break things down by continent--

select location, max(cast(total_deaths as int)) as TotalDeathCount
from Portfolio..CovidDeaths
where continent is null
group by location
order by TotalDeathCount DESC

--show continent with more death count--
select continent, max(cast(total_deaths as int)) as TotalDeathCount
from Portfolio..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount DESC

-- global numbers--

select date, sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from Portfolio..CovidDeaths
where continent is not null
group by date
order by 1,2

-- totalcases, death and death percentage--
select sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from Portfolio..CovidDeaths
where continent is not null
order by 1,2

--total population vs vaccinations --

select DEA.date, DEA.location, DEA.continent, DEA.population, VAC.new_vaccinations, 
SUM(cast(VAC.new_vaccinations as bigint)) over (partition by DEA.location order by DEA.location, DEA.date) as total_vaccination
from Portfolio..CovidDeaths DEA
join Portfolio..CovidVaccinations VAC
	on DEA.location = VAC.location
	and DEA.Date = VAC.date
where DEA.continent is not null
order by 2,3


-- use CTE

with PopsvsVac (Continent, Location, Date, Population, new_vaccinations, total_vaccination)
as
(select DEA.date, DEA.location, DEA.continent, DEA.population, VAC.new_vaccinations, 
SUM(cast(VAC.new_vaccinations as bigint)) over (partition by DEA.location order by DEA.location, DEA.date) as total_vaccination
from Portfolio..CovidDeaths DEA
join Portfolio..CovidVaccinations VAC
	on DEA.location = VAC.location
	and DEA.Date = VAC.date
where DEA.continent is not null)
select * ,(total_vaccinations/Population)*100 from PopsvsVac


--temp table--
drop table if exists #PercentPopulationVaccinated
Create table #PercentPopulationVaccinated
(Continent nvarchar(255), Location nvarchar(255), Date datetime, Population numeric, New_Vaccinations numeric, Total_vaccinations numeric)

insert into #PercentPopulationVaccinated
select DEA.continent, DEA.location, DEA.date, DEA.population, VAC.new_vaccinations, 
SUM(cast(VAC.new_vaccinations as bigint)) over (partition by DEA.location order by DEA.location, DEA.date) as total_vaccination
from Portfolio..CovidDeaths DEA
join Portfolio..CovidVaccinations VAC
	on DEA.location = VAC.location
	and DEA.Date = VAC.date
where DEA.continent is not null
order by 2,3

select * ,(total_vaccinations/Population)*100 as Vaccination_percentage from #PercentPopulationVaccinated


--creating view for storing later for data visualisation--

create view PercentofPopulationVaccinated as 
select DEA.continent, DEA.location, DEA.date, DEA.population, VAC.new_vaccinations, 
SUM(cast(VAC.new_vaccinations as bigint)) over (partition by DEA.location order by DEA.location, DEA.date) as total_vaccination
from Portfolio..CovidDeaths DEA
join Portfolio..CovidVaccinations VAC
	on DEA.location = VAC.location
	and DEA.Date = VAC.date
where DEA.continent is not null
--order by 2,3
