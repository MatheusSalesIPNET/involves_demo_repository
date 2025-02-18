view: products {
  sql_table_name: `demo_involves.products`
    ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_category_name {
    type: string
    sql: ${TABLE}.product_category_name ;;
  }

  dimension: product_description_lenght {
    type: number
    sql: ${TABLE}.product_description_lenght ;;
  }

  dimension: product_height_cm {
    type: number
    sql: ${TABLE}.product_height_cm ;;
  }

  dimension: product_length_cm {
    type: number
    sql: ${TABLE}.product_length_cm ;;
  }

  dimension: product_name_lenght {
    type: number
    sql: ${TABLE}.product_name_lenght ;;
  }

  dimension: product_photos_qty {
    type: number
    sql: ${TABLE}.product_photos_qty ;;
  }

  dimension: product_weight_g {
    type: number
    sql: ${TABLE}.product_weight_g ;;
  }

  dimension: product_width_cm {
    type: number
    sql: ${TABLE}.product_width_cm ;;
  }

  measure: count {
    type: count
    drill_fields: [product_id, product_category_name, order_items.count]
  }
}
