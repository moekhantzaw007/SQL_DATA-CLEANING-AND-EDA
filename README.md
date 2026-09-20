# SQL Data Cleaning Project – Layoffs Dataset

## Project Overview
This project cleans a real-world global layoffs dataset using MySQL, turning messy, 
duplicated, and inconsistently formatted raw data into a clean, analysis-ready table.

## What I Did
- Removed duplicate records using a `ROW_NUMBER()` window function partitioned across 
  all key fields
- Standardized inconsistent text values (e.g., unified "Crypto%" variants into "CRYPTO", 
  trimmed trailing periods from country names)
- Converted date values stored as text into proper MySQL `DATE` format
- Backfilled missing `industry` values using a self-join on company name, where another 
  row for the same company had the value populated
- Removed rows with no usable layoff data (both `total_laid_off` and 
  `percentage_laid_off` null)
- Dropped the helper column used for deduplication once cleaning was complete

## Skills Used
SQL, Data Cleaning, Removing Duplicates, CTEs, Window Functions, Data Standardization

## Tools Used
MySQL, MySQL Workbench, GitHub

## Files
- `data_cleaning.sql`

## Dataset
Layoffs dataset from Alex The Analyst

## Author
Moe Khant Zaw
Aspiring Data Analyst
