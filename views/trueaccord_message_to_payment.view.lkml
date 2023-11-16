view: trueaccord_message_to_payment {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."TRUEACCORD_MESSAGE_TO_PAYMENT" ;;

  dimension_group: communication {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."COMMUNICATION_DATE" ;;
  }
  dimension: overdue_after_14d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_14D" ;;
  }
  dimension: overdue_after_1d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_1D" ;;
  }
  dimension: overdue_after_28d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_28D" ;;
  }
  dimension: overdue_after_3d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_3D" ;;
  }
  dimension: overdue_after_7d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_7D" ;;
  }
  dimension: payments_initiated_14d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_14D" ;;
  }
  dimension: payments_initiated_1d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_1D" ;;
  }
  dimension: payments_initiated_28d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_28D" ;;
  }
  dimension: payments_initiated_3d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_3D" ;;
  }
  dimension: payments_initiated_7d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_7D" ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||${communication_date} ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}."TEMPLATE_ID" ;;
  }
  dimension: template_name {
    type: string
    sql: ${TABLE}."TEMPLATE_NAME" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: cures_1d {
    type: count_distinct
    sql: CASE WHEN ${overdue_after_1d} = 'false' THEN ${user_id} END ;;
  }

  measure: cures_3d {
    type: count_distinct
    sql: CASE WHEN ${overdue_after_3d} = 'false' THEN ${user_id} END ;;
  }

  measure: cures_7d {
    type: count_distinct
    sql: CASE WHEN ${overdue_after_7d} = 'false' THEN ${user_id} END ;;
  }

  measure: cures_14d {
    type: count_distinct
    sql: CASE WHEN ${overdue_after_14d} = 'false' THEN ${user_id} END ;;
  }

  measure: cures_28d {
    type: count_distinct
    sql: CASE WHEN ${overdue_after_28d} = 'false' THEN ${user_id} END ;;
  }

  measure: cure_rate_1d {
    type: number
    sql: ${cures_1d}/${users} ;;
    value_format_name: percent_1
  }

  measure: cure_rate_3d {
    type: number
    sql: ${cures_3d}/${users} ;;
    value_format_name: percent_1
  }

  measure: cure_rate_7d {
    type: number
    sql: ${cures_7d}/${users} ;;
    value_format_name: percent_1
  }

  measure: cure_rate_14d {
    type: number
    sql: ${cures_14d}/${users} ;;
    value_format_name: percent_1
  }

  measure: cure_rate_28d {
    type: number
    sql: ${cures_28d}/${users} ;;
    value_format_name: percent_1
  }

  measure: sum_payments_initiated_1d {
    type: sum
    sql: ${payments_initiated_1d} ;;
  }

  measure: sum_payments_initiated_3d {
    type: sum
    sql: ${payments_initiated_3d} ;;
  }

  measure: sum_payments_initiated_7d {
    type: sum
    sql: ${payments_initiated_7d} ;;
  }

  measure: sum_payments_initiated_14d {
    type: sum
    sql: ${payments_initiated_14d} ;;
  }

  measure: sum_payments_initiated_28d {
    type: sum
    sql: ${payments_initiated_28d} ;;
  }

  measure: users_with_payments_1d {
    type: count_distinct
    sql: CASE WHEN ${payments_initiated_1d} > 0 THEN ${user_id} END ;;
  }

  measure: users_with_payments_3d {
    type: count_distinct
    sql: CASE WHEN ${payments_initiated_3d} > 0 THEN ${user_id} END ;;
  }

  measure: users_with_payments_7d {
    type: count_distinct
    sql: CASE WHEN ${payments_initiated_7d} > 0 THEN ${user_id} END ;;
  }

  measure: users_with_payments_14d {
    type: count_distinct
    sql: CASE WHEN ${payments_initiated_14d} > 0 THEN ${user_id} END ;;
  }

  measure: users_with_payments_28d {
    type: count_distinct
    sql: CASE WHEN ${payments_initiated_28d} > 0 THEN ${user_id} END ;;
  }

  measure: percent_users_with_payment_1d {
    type: number
    sql: ${users_with_payments_1d} / ${users} ;;
    value_format_name: percent_1
  }

  measure: percent_users_with_payment_3d {
    type: number
    sql: ${users_with_payments_3d} / ${users} ;;
    value_format_name: percent_1
  }

  measure: percent_users_with_payment_7d {
    type: number
    sql: ${users_with_payments_7d} / ${users} ;;
    value_format_name: percent_1
  }

  measure: percent_users_with_payment_14d {
    type: number
    sql: ${users_with_payments_14d} / ${users} ;;
    value_format_name: percent_1
  }

  measure: percent_users_with_payment_28d {
    type: number
    sql: ${users_with_payments_28d} / ${users} ;;
    value_format_name: percent_1
  }
}
