{{
    config(
        store_failures=true
    )
}}
with orders as (
    select * from {{ ref('stg_orders') }}
)
select order_id, sum(total_price) order_total
from orders
group by order_id
having(order_total) <= 1000
