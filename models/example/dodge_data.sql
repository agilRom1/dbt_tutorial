with dodge_data as (
with car_2000 as(
select 
count(1) number_of_sales,
prod.model car_model,
prod.product_id id
from dev.stg_products prod
join dev.stg_purchases pur on prod.product_id = pur.product_id
join dev.stg_users su on su.user_id = pur.user_id
where 1=1
and lower(prod.make) = 'dodge'
and pur.purchased_at >= date('2000-01-01','yyyy-mm-dd') --hc, could be VAR
group by prod.model,prod.product_id
),
sal_rec as(
select 
max(number_of_sales) max_key_val,
min(number_of_sales) min_key_val
from car_2000
)

select 
'since 2000s' time_period, --hc, could be VAR
concat(pr.make,' ',pr.model) dodge_model,
car_2000.number_of_sales number_of_sales,
round(pr.price * car_2000.number_of_sales,2) total_revenue_$
from dev.stg_products pr
join car_2000 on car_2000.id = pr.product_id
join sal_rec on sal_rec.max_key_val = car_2000.number_of_sales or sal_rec.min_key_val = car_2000.number_of_sales
)

select * from dodge_data