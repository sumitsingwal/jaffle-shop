with orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payments as (

    select * from {{ ref('stg_stripe__payments') }}

),

ord_pay as (

    select
        ord.order_id,
        ord.customer_id,
        pay.amount

    from orders as ord
    left join payments as pay using (order_id)
)

select * from ord_pay