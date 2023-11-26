Use Portfolio;

/*
Queries used for visualisation Tableau/PowerBI
*/

-- 1. total cases and death rate based on continent (null excluded) 
Select 
	SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, 
	SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Portfolio..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2

-- just a double check based off the data provided
-- numbers are extremely close so we will keep them - The Second includes "International"  Location
/**Select 
	SUM(new_cases) as total_cases, 
	SUM(cast(new_deaths as int)) as total_deaths, 
	SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From Portfolio..CovidDeaths
--Where location like '%states%'
where location = 'World'
Group By date
order by 1,2
**/

-- 2. 
-- taking these out as they are not included in the above queries and want to stay consistent
Select 
	location, 
	SUM(cast(new_deaths as int)) as TotalDeathCount
From Portfolio..CovidDeaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

-- 3.
-- taking these out as they are not included in the above queries and want to stay consistent
Select 
	Location, 
	Population, 
	MAX(total_cases) as HighestInfectionCount,  
	Max((total_cases/population))*100 as PercentPopulationInfected
From Portfolio..CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc

-- 4. 
--taking these out as they are not included in the above queries and want to stay consistent and group by date
Select 
	Location, 
	Population,
	date, 
	MAX(total_cases) as HighestInfectionCount,  
	Max((total_cases/population))*100 as PercentPopulationInfected
From Portfolio..CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc