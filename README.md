# SQL Data Cleaning & EDA Project – Layoffs Dataset

## Project Overview

This project works with a real-world global layoffs dataset using MySQL. It has two parts:

1. **Data cleaning** — turning messy, duplicated, and inconsistently formatted raw data into a clean, analysis-ready table.
2. **Exploratory data analysis (EDA)** — querying the cleaned table to find which companies, industries, countries, and funding stages were hit hardest, and how layoffs trended over time.

## Part 1: Data Cleaning

- Removed duplicate records using a `ROW_NUMBER()` window function partitioned across all key fields
- Standardized inconsistent text values (e.g., unified "Crypto%" variants into "CRYPTO", trimmed trailing periods from country names)
- Converted date values stored as text into proper MySQL `DATE` format
- Backfilled missing `industry` values using a self-join on company name, where another row for the same company had the value populated
- Removed rows with no usable layoff data (both `total_laid_off` and `percentage_laid_off` null)
- Dropped the helper column used for deduplication once cleaning was complete

## Part 2: Exploratory Data Analysis

- Found the maximum single-event layoff count and the maximum layoff percentage in the dataset
- Identified companies that laid off 100% of their workforce (`percentage_laid_off = 1`), ranked both by total employees laid off and by funds raised, to see how much funding those companies had before shutting down
- Aggregated total layoffs by company, industry, country, and funding stage to find which were hit hardest overall
- Found the date range covered by the dataset
- Broke down total layoffs by country and year to spot regional and time-based trends
- Built a month-by-month rolling total of layoffs using a CTE and `SUM() OVER(ORDER BY month)`, to track how layoffs accumulated over time
- Ranked companies by total layoffs within each year using `DENSE_RANK()` partitioned by year, to find the top 5 companies with the most layoffs per year

## Skills Used

SQL, Data Cleaning, Exploratory Data Analysis, Removing Duplicates, CTEs, Window Functions (`ROW_NUMBER`, `SUM() OVER`, `DENSE_RANK`), Data Standardization, Aggregation

## Tools Used

MySQL, MySQL Workbench, GitHub

## Files

| File | Description |
|---|---|
| `data_cleaning.sql` | Cleaning script: deduplication, standardization, type fixes |
| `EDA_MKZ.sql` | Exploratory queries on the cleaned data |

## Dataset

Layoffs dataset from Alex The Analyst

## Author

Moe Khant Zaw
Aspiring Data Analyst
