with source as (
    select * from {{ source('grai_bigquery_demo', 'raw_customers') }}
),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed
