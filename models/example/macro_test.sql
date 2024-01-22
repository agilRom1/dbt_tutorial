with category_main as (
    select
        age,
        {{ get_category('age') }} as buyer_profile,
        concat(title, ' ', name) as full_name,
        {{ get_no ('age') }} comp
    from
        dev.stg_users
    where 1=1
)

select * from category_main






