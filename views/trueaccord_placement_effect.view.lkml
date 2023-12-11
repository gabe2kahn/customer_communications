view: trueaccord_placement_effect {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."TRUEACCORD_PLACEMENT_EFFECT" ;;

  dimension: current_amount_due {
    type: number
    sql: ${TABLE}."CURRENT_AMOUNT_DUE" ;;
  }
  dimension: current_balance {
    type: number
    sql: ${TABLE}."CURRENT_BALANCE" ;;
  }
  dimension_group: date_assigned {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_ASSIGNED" ;;
  }
  dimension: days_overdue_at_placement {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE_AT_PLACEMENT" ;;
  }
  dimension_group: delinquency {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DELINQUENCY_DATE" ;;
  }
  dimension: file_id {
    type: string
    sql: ${TABLE}."FILE_ID" ;;
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

  dimension: total_amount_due {
    type: number
    sql: ${TABLE}."TOTAL_AMOUNT_DUE" ;;
  }
  dimension: total_delinquent_amount {
    type: number
    sql: ${TABLE}."TOTAL_DELINQUENT_AMOUNT" ;;
  }
  dimension: true_accord_status {
    type: string
    sql: ${TABLE}."TRUE_ACCORD_STATUS" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
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
