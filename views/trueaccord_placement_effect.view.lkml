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
  dimension: overdue_after_14_d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_14D" ;;
  }
  dimension: overdue_after_1_d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_1D" ;;
  }
  dimension: overdue_after_28_d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_28D" ;;
  }
  dimension: overdue_after_3_d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_3D" ;;
  }
  dimension: overdue_after_7_d {
    type: string
    sql: ${TABLE}."OVERDUE_AFTER_7D" ;;
  }
  dimension: payments_initiated_14_d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_14D" ;;
  }
  dimension: payments_initiated_1_d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_1D" ;;
  }
  dimension: payments_initiated_28_d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_28D" ;;
  }
  dimension: payments_initiated_3_d {
    type: number
    sql: ${TABLE}."PAYMENTS_INITIATED_3D" ;;
  }
  dimension: payments_initiated_7_d {
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
  measure: count {
    type: count
  }
}
