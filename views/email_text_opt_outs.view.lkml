view: email_text_opt_outs {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."EMAIL_TEXT_OPT_OUTS" ;;

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL" ;;
  }
  dimension_group: file_creation_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."FILE_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: file_id {
    type: string
    sql: ${TABLE}."FILE_ID" ;;
  }
  dimension_group: opt_out_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OPT_OUT_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: opt_out_type {
    type: string
    sql: ${TABLE}."OPT_OUT_TYPE" ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }
}
