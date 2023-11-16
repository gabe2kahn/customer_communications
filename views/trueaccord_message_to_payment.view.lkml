view: trueaccord_message_to_payment {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."TRUEACCORD_MESSAGE_TO_PAYMENT" ;;

  dimension_group: communication {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."COMMUNICATION_DATE" ;;
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
  measure: count {
    type: count
    drill_fields: [template_name]
  }
}
