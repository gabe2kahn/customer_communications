view: trueaccord_texts {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."TRUEACCORD_TEXTS" ;;

  dimension_group: file_creation_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."FILE_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: file_id {
    type: string
    sql: ${TABLE}."FILE_ID" ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id} || ${text_date} ;;
  }

  dimension: template_id {
    type: string
    sql: ${TABLE}."TEMPLATE_ID" ;;
  }
  dimension: template_name {
    type: string
    sql: ${TABLE}."TEMPLATE_NAME" ;;
  }
  dimension_group: text {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."TEXT_DATE" ;;
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
