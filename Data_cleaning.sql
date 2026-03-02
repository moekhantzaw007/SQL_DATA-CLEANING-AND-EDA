-- layoffs-data-cleaning-project


-- creating table and input raw data
SELECT * 
FROM world_layoffs.layoffs;

CREATE TABLE world_layoffs.layoffs_staging 
LIKE world_layoffs.layoffs;

INSERT layoffs_staging 
SELECT * FROM world_layoffs.layoffs;


-- removing duplicates
SELECT *
FROM layoffs_staging;

SELECT *,
ROW_NUMBER() OVER(
  PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`,
               stage, country, funds_raised_millions
) AS row_num
FROM world_layoffs.layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`,
				 stage, country, funds_raised_millions ) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM world_layoffs.layoffs_staging
WHERE company = 'Oda'


