## Overview
This dbt project processes and transforms dating app data using Snowflake. Raw data from the **DATALAKE** schema is cleaned and structured into **DWH** tables and views for analytics within aggregated KPIs tables stored in **AGG**.

## Data Flow
- **Source Data (DATALAKE)**: Raw data from app events, users, cities, genders, and currency rates.
- **Transformed Data (DWH)**: Dimension and fact tables and vies optimized for analysis.
- **Aggregations (AGG)**: Aggregated KPIs tables.

## Tables

### **Source Tables (DATALAKE)**
- **APP_EVENTS**: User actions, payments, and match interactions.
- **CITIES**: City names and IDs.
- **CUSTOMERS**: User profiles with demographics and preferences.
- **GENDERS**: Gender classifications.
- **USD_CONVERSION_RATE**: Currency exchange rates.

### **Data Warehouse Tables And Views (DWH)**
#### **Dimension Tables**
- **DWH_DIM_CITIES**: Cleaned city data.
- **DWH_DIM_GENDERS**: Cleaned genders data.
- **DWH_DIM_CUSTOMERS**: Structured customer data.
- **DWH_DIM_CUSTOMERS_SNAPSHOT**: Captures historical changes in customer profiles, allowing analysis of user attribute changes over time.

#### **Fact Tables**
- **DWH_FACT_ACTIVITY**: User activity logs.
- **DWH_FACT_MATCHES**: Successful matches.
- **DWH_FACT_REVENUE**: Transactions, payments, and currency conversions.

#### **Aggregations**
- **DWH_AGG_DAILY_KPIS**: Daily metrics (DAU, MAU, ARPU, churn rate).
- **DWH_AGG_MATCHES_KPIS**: Engagement stats (swipes, likes, matches, messages, rates).

## Methods & Techniques Used

- **SEED**: Used for initializing and managing static datasets (csv).
- **Materializations**: Implemented various dbt materializations (table, view, ephemeral, incremental, snaphot).
- **Macros**: Created macros for calculated columns and reusable logic.
- **Tests**: Applied data quality tests for validation.
- **Jinja**: Used for querying sources and models, macros, and tests.
- **Analysis**: Conducted data analysis for hed-hoc needs.
- **Documentation**: Maintained comprehensive dbt documentation.

## Please note:

* Please find the attached data flow diagram in the 'models' folder.
* Please find the source tables ddl and data scripts in the models 'source_sql_scripts' folder.







