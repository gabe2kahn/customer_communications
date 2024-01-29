view: late_payment_responses {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."LATE_PAYMENT_RESPONSES" ;;

  dimension: active_level {
    type: number
    sql: ${TABLE}."ACTIVE_LEVEL" ;;
  }

  dimension: current_days_overdue {
    type: number
    sql: ${TABLE}."CURRENT_DAYS_OVERDUE" ;;
  }

  dimension: currently_overdue_ind {
    type: yesno
    sql: ${TABLE}."CURRENTLY_OVERDUE_IND" ;;
  }
  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension_group: received {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RECEIVED_DATE" ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||${received_raw} ;;
  }

  dimension: response_text {
    type: string
    sql: ${TABLE}."RESPONSE_TEXT" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

}
