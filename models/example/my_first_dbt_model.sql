/*
 Welcome to your first dbt model!
 Did you know that you can also configure models directly within SQL files?
 This will override configurations stated in dbt_project.yml
 
 Try changing "table" to "view" below
 */
{ { config(materialized = 'table') } } with source_data as (
    SELECT
        c.c_custkey as customer,
        c.c_name as customer_name,
        c.c_nationkey as nation,
        SUM(o.o_totalprice) as total_order_price
    FROM
        SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
        LEFT JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o ON c.c_custkey = o.o_custkey
    GROUP BY
        c.c_custkey,
        c.c_name,
        c.c_nationkey
)
select
    *
from
    source_data
    /*
     Uncomment the line below to remove records with null `id` values
     */
    -- where id is not null