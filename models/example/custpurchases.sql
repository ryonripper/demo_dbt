SELECT 
    c.c_custkey,
    c.c_name,
    c.c_nationkey,
    SUM(o.o_totalprice) as total_order_price
FROM {{ source('sample1', 'customer') }} c

LEFT JOIN {{ source('sample1', 'orders') }} o

ON c.c_custkey = o.o_custkey

{{ group_by(3) }}