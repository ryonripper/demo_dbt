
{{ config(materialized='incremental', unique_key='t_time') }}

SELECT * 
FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM 
WHERE to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= CURRENT_TIME

{% if is_incremental() %}
    and t_time > (select max(t_time) from {{ this }})
{% endif %}
