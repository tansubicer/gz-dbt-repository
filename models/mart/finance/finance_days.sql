with daily as (

    select
        date_date,
        count(distinct orders_id) as nb_transactions,
        sum(revenue) as revenue,
        sum(margin) as margin,
        sum(operational_margin) as operational_margin,
        sum(purchase_cost) as purchase_cost,
        sum(shipping_fee) as shipping_fee,
        sum(logcost) as logcost,
        sum(ship_cost) as ship_cost,
        sum(quantity) as quantity
    from {{ ref("int_orders_operational") }}
    group by date_date

)

select
    date_date,
    nb_transactions,
    round(revenue, 2) as revenue,
    round(revenue / nullif(nb_transactions, 0), 2) as average_basket,
    round(margin, 2) as margin,
    round(operational_margin, 2) as operational_margin,
    round(purchase_cost, 2) as purchase_cost,
    round(shipping_fee, 2) as shipping_fee,
    round(logcost, 2) as logcost,
    round(ship_cost, 2) as ship_cost,
    quantity
from daily
order by date_date desc