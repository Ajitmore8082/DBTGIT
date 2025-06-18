{% snapshot Cust_snap %}
    {{
        config(
            target_schema='DBT_AMORE',
            target_database='EDW_DEV_DB',
            unique_key='CUSTOMER_ID',
            strategy='check',
            check_cols=['CUSTOMER_ID'],
            invalidate_hard_deletes=False
            
        )
    }}

    select * from {{ source('raw_pizza_data', 'CUSTOMERS') }}
 {% endsnapshot %}