/*
===============================================================================
Inserting all data from CSV files to asigned tables.
===============================================================================
Use:
	Script will create procedure that copies all data to already created tables.
Warning:
	Run this script after creating tables from init_tables.sql
===============================================================================
*/

--Creating procedure to make easier updates in case of changes in files
--Instead of running this script after creating procedure you can just use 'CALL bronze.load_bronze();' statement
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
--Declaring variables
DECLARE
    start_time TIMESTAMP;
	bronze_layer_start_time TIMESTAMP;
BEGIN
	--start timer.
	bronze_layer_start_time := clock_timestamp();
	RAISE NOTICE '=================================';
	RAISE NOTICE 'Loading bronze layer';
	RAISE NOTICE '=================================';
	RAISE NOTICE '';

	RAISE NOTICE '---------------------------------';
	RAISE NOTICE 'Loading CRM tables';
	RAISE NOTICE '---------------------------------';

	--Starting timer to get exact query execution time
	start_time := clock_timestamp();
	RAISE NOTICE '>>Truncating table: bronze.crm_cust_info';
	--Cleaning whole table before inserting data to make sure we won't have duplicates
	TRUNCATE TABLE bronze.crm_cust_info;
	--Copying data to sql table from csv file
	RAISE NOTICE '>>Inserting data into: bronze.crm_cust_info';
	COPY bronze.crm_cust_info
	FROM '/path/to/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER ','
	);
	--Printing execution time
	RAISE NOTICE 'Querying time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - start_time));
	
	--Starting timer to get exact query execution time
	start_time := clock_timestamp();
	RAISE NOTICE '>>Truncating table: bronze.crm_prd_info';
	--Cleaning whole table before inserting data to make sure we won't have duplicates
	TRUNCATE TABLE bronze.crm_prd_info;
	--Copying data to sql table from csv file
	RAISE NOTICE '>>Inserting data into: bronze.crm_prd_info';
	COPY bronze.crm_prd_info
	FROM '/path/to/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER ','
	);
	--Printing execution time
	RAISE NOTICE 'Querying time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - start_time));
	
	--Starting timer to get exact query execution time
	start_time := clock_timestamp();
	RAISE NOTICE '>>Truncating table: bronze.crm_sales_details';
	--Cleaning whole table before inserting data to make sure we won't have duplicates
	TRUNCATE TABLE bronze.crm_sales_details;
	--Copying data to sql table from csv file
	RAISE NOTICE '>>Inserting data into: bronze.crm_sales_details';
	COPY bronze.crm_sales_details
	FROM '/path/to/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER ','
	);
	--Printing execution time
	RAISE NOTICE 'Querying time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - start_time));
	RAISE NOTICE '';

	RAISE NOTICE '---------------------------------';
	RAISE NOTICE 'Loading ERP tables';
	RAISE NOTICE '---------------------------------';

	--Starting timer to get exact query execution time
	start_time := clock_timestamp();
	RAISE NOTICE '>>Truncating table: bronze.erp_px_cat_g1v2';
	--Cleaning whole table before inserting data to make sure we won't have duplicates
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	--Copying data to sql table from csv file
	RAISE NOTICE '>>Inserting data into: bronze.erp_px_cat_g1v2';
	COPY bronze.erp_px_cat_g1v2
	FROM '/path/to/sql-data-warehouse-project/datasets/source_erp/px_cat_g1v2.csv'
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER ','
	);
	--Printing execution time
	RAISE NOTICE 'Querying time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - start_time));
	
	--Starting timer to get exact query execution time
	start_time := clock_timestamp();
	RAISE NOTICE '>>Truncating table: bronze.erp_loc_a101';
	--Cleaning whole table before inserting data to make sure we won't have duplicates
	TRUNCATE TABLE bronze.erp_loc_a101;
	--Copying data to sql table from csv file
	RAISE NOTICE '>>Inserting data into: bronze.erp_loc_a101';
	COPY bronze.erp_loc_a101
	FROM '/path/to/sql-data-warehouse-project/datasets/source_erp/loc_a101.csv'
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER ','
	);
	--Printing execution time
	RAISE NOTICE 'Querying time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - start_time));
	
	--Starting timer to get exact query execution time
	start_time := clock_timestamp();
	RAISE NOTICE '>>Truncating table: bronze.erp_cust_az12';
	--Cleaning whole table before inserting data to make sure we won't have duplicates
	TRUNCATE TABLE bronze.erp_cust_az12;
	--Copying data to sql table from csv file
	RAISE NOTICE '>>Inserting data into: bronze.erp_cust_az12';
	COPY bronze.erp_cust_az12
	FROM '/path/to/sql-data-warehouse-project/datasets/source_erp/cust_az12.csv'
	WITH (
		FORMAT csv,
		HEADER true,
		DELIMITER ','
	);
	--Printing execution time
	RAISE NOTICE 'Querying time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - start_time));
	RAISE NOTICE '';

	--End timer
	RAISE NOTICE 'Whole procedure execution time: %s', EXTRACT(EPOCH FROM (clock_timestamp() - bronze_layer_start_time));

--Errors Management
EXCEPTION
	WHEN OTHERS THEN
		RAISE NOTICE '==========================================';
		RAISE NOTICE 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		RAISE NOTICE 'Error Message: %', SQLERRM;
		RAISE NOTICE 'Error Code (SQLSTATE): %', SQLSTATE;
		RAISE NOTICE '==========================================';
		RAISE; 
END;
$$;

--CALL bronze.load_bronze();
