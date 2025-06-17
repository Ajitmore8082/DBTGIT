
select CUSTOMER_ID,concat(FIRST_NAME ||' '|| LAST_NAME) NAME, email,
    phone,
    registration_date
from {{ source('raw_pizza_data', 'CUSTOMERS') }}