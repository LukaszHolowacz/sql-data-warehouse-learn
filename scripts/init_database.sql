/*
===============================================================================
Creating database and schemas (Medallion Architecture)
===============================================================================
Use:
	Script will create data_warehouse database and necessary schemas inside it.
Warning!! (PostgreSQL):
    PostrgeSQL do not know 'USE' statement known from SQLserver.
    1. First part of this script run on 'postgres' database.
    2. Next open Query Tool on 'data_warehouse' databse and run Part 2.
===============================================================================
*/

--Part 1: Lunch from main 'postgres' database
--Creating database (data_warehouse)
DROP DATABASE IF EXISTS data_warehouse WITH (FORCE);
CREATE DATABASE data_warehouse;

--If you are using PgAdmin or other GUI comment this line and manually select database created in part 1.
\c data_warehouse

--Part 2: Lunch from 'data_warehouse' database
--Creating medallion schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
