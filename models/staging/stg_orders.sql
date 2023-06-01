with source as (
    select * from {{ source('grai_bigquery_demo', 'raw_orders') }}
),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select * from renamed
