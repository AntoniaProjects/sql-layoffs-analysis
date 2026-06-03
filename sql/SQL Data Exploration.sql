-- Exploratory Data Analysis (EDA)

-- Review the cleaned dataset and inspect key metrics
SELECT*
FROM layoffs_staging2;
    
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Companies with 100% Workforce Layoffs
SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off =1
ORDER BY funds_raised_millions DESC;

-- Companies with the Highest Total Layoffs
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Determine the time period covered by the dataset
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Compare total layoffs across industries
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;   

SELECT*
FROM layoffs_staging2; 

-- Evaluate layoffs by country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;   

-- Analyze how layoffs evolved over time
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;  

-- Compare layoffs across funding and growth stages
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;   

-- Monthly Layoff Trends
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- Rolling Cumulative Layoffs (over time)
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

-- Company Layoffs by Year 
SELECT company, YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR (`date`)
ORDER BY 3 DESC;

-- Top 5 Companies by Layoffs per Year
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR (`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR (`date`)
), Company_Year_Rank AS
(SELECT*, 
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT*
FROM Company_Year_Rank
WHERE Ranking <= 5
;

