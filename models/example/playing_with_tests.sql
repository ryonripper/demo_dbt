select 
    c_custkey,
    c_mktsegment,
    {{ rename_segments('c_mktsegment') }} mkt_segment_adjusted
from {{ source('sample', 'customer') }}
