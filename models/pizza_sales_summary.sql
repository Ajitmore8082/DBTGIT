{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.first_name,
    c.last_name,
    i.pizza_id,
    p.pizza_name,
    p.category,
    p.size,
    i.quantity,
    i.unit_price,
    i.quantity * i.unit_price AS total_price
FROM {{ ref('Stg_orders') }} o
JOIN {{ ref('Stg_customers') }} c ON o.customer_id = c.customer_id
JOIN {{ ref('Stg_order_items') }} i ON o.order_id = i.order_id
JOIN {{ ref('Stg_pizzas') }} p ON i.pizza_id = p.pizza_id
