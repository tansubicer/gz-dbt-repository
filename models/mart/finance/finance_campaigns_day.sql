select
    f.date_date as date,
    round(f.operational_margin - c.ads_cost, 2) as ads_margin,
    f.average_basket,
    f.operational_margin,
    c.ads_cost,
    c.ads_impression,
    c.ads_clicks,
    f.quantity,
    f.revenue,
    f.purchase_cost,
    f.margin,
    f.shipping_fee,
    f.logcost as log_cost,
    f.ship_cost
from {{ ref('finance_days') }} f
left join {{ ref('int_campaigns_day') }} c
    on f.date_date = c.date_date
order by date desc