view: trueaccord_voicemails {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."TRUEACCORD_VOICEMAILS" ;;

  dimension: action {
    type: string
    sql: ${TABLE}."ACTION" ;;
  }

  dimension_group: action_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."ACTION_TS" AS TIMESTAMP_NTZ) ;;
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

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id} || ${action_ts_date} ;;
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
}
