# SQL Layoffs Data Analysis (Data Cleaning & EDA)

## Project Overview

This project analyzes global company layoffs using SQL during the COVID-19 and post-COVID economic period.

The goal was to clean a raw dataset and perform exploratory data analysis (EDA) to identify patterns across industries, countries, companies, and time.

The project demonstrates a full SQL workflow from data cleaning to business insight generation.

## Tools Used

- MySQL  
- SQL (Window Functions, CTEs, Aggregations)  
- MySQL Workbench  

## Data Cleaning

The raw dataset contained inconsistencies, duplicates, and missing values.

The cleaning process included:

- Removing duplicate records using `ROW_NUMBER()` window function  
- Standardizing company and industry names  
- Handling missing and blank values  
- Converting date fields to proper DATE format  
- Creating a structured analysis-ready dataset using staging tables  

## Exploratory Data Analysis (EDA)

The analysis focused on understanding layoff patterns across multiple dimensions:

- Companies with the highest total layoffs  
- Companies with 100% workforce reductions  
- Industries most affected by layoffs  
- Countries with highest layoff volumes  
- Layoff trends over time (yearly and monthly)  
- Rolling cumulative layoffs  
- Top companies per year using ranking functions  

## Key Insights

- The technology sector accounted for a significant share of global layoffs  
- Layoffs peaked during major economic downturn periods (including COVID-related impact)  
- A small number of companies contributed disproportionately to total layoffs  
- Clear time-based patterns show waves of layoffs rather than a constant trend  
- Certain countries experienced significantly higher workforce reductions  

## SQL Concepts Used

- `ROW_NUMBER()` for duplicate removal  
- `DENSE_RANK()` for ranking analysis  
- `PARTITION BY` for grouped window calculations  
- CTEs (Common Table Expressions)  
- Aggregation functions (`SUM`, `MAX`, `COUNT`)  
- Date functions and time-based grouping  
- Data cleaning transformations  

## Author

Created by Antonia Utz
