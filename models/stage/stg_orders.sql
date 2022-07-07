with source1 as (
    select * from {{ source('src', 'orders') }}
),
changed as (
    select
        -- ids
        o_orderkey as order_id,
        o_custkey as customer_id,
        
        -- descriptions
        o_comment as comment,
        o_clerk as clerk_name,
        -- numbers
        o_totalprice as total_price,
        {{ dol_euro('o_totalprice', 2) }} as total_price_in_euro,
        -- statuses
        o_orderstatus as status_code,
        o_orderpriority as priority_code,
        o_shippriority as ship_priority,
        -- dates
        o_orderdate as order_date
    from source1
)
select * from changed