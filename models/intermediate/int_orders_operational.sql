select
    o.orders_id,
    o.date_date,
    o.revenue,
    o.quantity,
    o.purchase_cost,
    o.margin,
    sh.shipping_fee,
    sh.logcost,
    sh.ship_cost,
    round(o.margin + sh.shipping_fee - sh.logcost - sh.ship_cost, 2) as operational_margin
from {{ ref('int_orders_margin') }} o
left join {{ ref('stg_raw__ship') }} sh
    on o.orders_id = sh.orders_id