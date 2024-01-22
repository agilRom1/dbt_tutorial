{% snapshot email_chk %}

{{
config( 
    target_schema='snapshots',
    strategy='check',
    unique_key='user_id',
    check_cols=['email']
)
}}

select * from dev.users_scd2

{% endsnapshot %}