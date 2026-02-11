with order as (
    SELECT * FROM {{ ref('stg_jaffle_shop__orders') }}
),

payment as (
    SELECT * FROM {{ ref('stg_stripe__payments') }}
),

ord_pay as (
    SELECT 
        ord.order_id,
        ord.customer_id,
        pay.amount
    FROM order as ord
    LEFT JOIN payment as pay
    ON ord.order_id = pay.order_id
)

SELECT * FROM ord_pay