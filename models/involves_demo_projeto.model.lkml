connection: "involves_demo_connection"

# include all the views
include: "/views/**/*.view"

datagroup: involves_demo_projeto_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: involves_demo_projeto_default_datagroup

explore: order_items {
  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: sellers {
    type: left_outer
    sql_on: ${order_items.seller_id} = ${sellers.seller_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }

  join: order_payment {
    type: left_outer
    sql_on: ${orders.order_id} = ${order_payment.order_id} ;;
    relationship: many_to_one
  }
}

explore: sellers {}

explore: customers {}

explore: products {}

explore: order_reviews {
  join: orders {
    type: left_outer
    sql_on: ${order_reviews.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: order_payment {
  join: orders {
    type: left_outer
    sql_on: ${order_payment.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}
