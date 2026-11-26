/*
===============================================================================
Inserting all data from CSV files to asigned tables.
===============================================================================
Use:
	Script will copy all data to already created tables.
Warning:
  - Change all paths to exact data warehouse project directory 
	- Run this script after creating tables from init_tables.sql
===============================================================================
*/

--Cleaning whole table before inserting data to make sure we won't have duplicates
TRUNCATE TABLE bronze.crm_cust_info;
--Copying data to sql table from csv file
COPY bronze.crm_cust_info
-- WARNING! Change this path before running the script!
FROM '/path/to/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

--Cleaning whole table before inserting data to make sure we won't have duplicates
TRUNCATE TABLE bronze.crm_prd_info;
--Copying data to sql table from csv file
COPY bronze.crm_prd_info
-- WARNING! Change this path before running the script!
FROM '/path/to/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

--Cleaning whole table before inserting data to make sure we won't have duplicates
TRUNCATE TABLE bronze.crm_sales_details;
--Copying data to sql table from csv file
COPY bronze.crm_sales_details
-- WARNING! Change this path before running the script!
FROM '/path/to/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

--Cleaning whole table before inserting data to make sure we won't have duplicates
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
--Copying data to sql table from csv file
COPY bronze.erp_px_cat_g1v2
-- WARNING! Change this path before running the script!
FROM '/path/to/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

--Cleaning whole table before inserting data to make sure we won't have duplicates
TRUNCATE TABLE bronze.erp_loc_a101;
--Copying data to sql table from csv file
COPY bronze.erp_loc_a101
-- WARNING! Change this path before running the script!
FROM '/path/to/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

--Cleaning whole table before inserting data to make sure we won't have duplicates
TRUNCATE TABLE bronze.erp_cust_az12;
--Copying data to sql table from csv file
COPY bronze.erp_cust_az12
-- WARNING! Change this path before running the script!
FROM '/path/to/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);
