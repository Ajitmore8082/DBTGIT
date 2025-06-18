{{
    config(
        materialized='incremental'
    )
}}
select * from {{ source('raw_pizza_data', 'CUSTOMERS') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where REGISTRATION_DATE > (select max(REGISTRATION_DATE) from {{ this }}) 
{% endif %}

