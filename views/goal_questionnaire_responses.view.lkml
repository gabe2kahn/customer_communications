view: goal_questionnaire_responses {
  sql_table_name: "CUSTOMER_COMMUNICATIONS"."GOAL_QUESTIONNAIRE_RESPONSES" ;;

  dimension: find_a_company_i_can_trust {
    type: yesno
    sql: ${TABLE}."FIND_A_COMPANY_I_CAN_TRUST" ;;
  }

  dimension: get_a_lower_interest_rate {
    type: yesno
    sql: ${TABLE}."GET_A_LOWER_INTEREST_RATE" ;;
  }

  dimension: get_credit_to_pay_for_things {
    type: yesno
    sql: ${TABLE}."GET_CREDIT_TO_PAY_FOR_THINGS" ;;
  }

  dimension: increase_my_credit_score {
    type: yesno
    sql: ${TABLE}."INCREASE_MY_CREDIT_SCORE" ;;
  }

  dimension_group: last_update_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }

  dimension: learn_more_about_my_finances {
    type: yesno
    sql: ${TABLE}."LEARN_MORE_ABOUT_MY_FINANCES" ;;
  }

  dimension_group: received {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RECEIVED_DATE" ;;
  }

  dimension: something_else {
    type: yesno
    sql: ${TABLE}."SOMETHING_ELSE" ;;
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

  measure: customers_with_find_a_company_i_can_trust {
    type: count_distinct
    sql: CASE WHEN ${find_a_company_i_can_trust} =  'Yes' THEN ${user_id} END;;
  }

  measure: percent_customers_with_find_a_company_i_can_trust {
    type: number
    sql: ${customers_with_find_a_company_i_can_trust} / ${users} ;;
    value_format_name: percent_1
  }

  measure: customers_with_get_a_lower_interest_rate {
    type: count_distinct
    sql: CASE WHEN ${get_a_lower_interest_rate} =  'Yes' THEN ${user_id} END;;
  }

  measure: percent_customers_with_get_a_lower_interest_rate {
    type: number
    sql: ${customers_with_get_a_lower_interest_rate} / ${users} ;;
    value_format_name: percent_1
  }

  measure: customers_with_get_credit_to_pay_for_things {
    type: count_distinct
    sql: CASE WHEN ${get_credit_to_pay_for_things} =  'Yes' THEN ${user_id} END;;
  }

  measure: percent_customers_with_get_credit_to_pay_for_things {
    type: number
    sql: ${customers_with_get_credit_to_pay_for_things} / ${users} ;;
    value_format_name: percent_1
  }

  measure: customers_with_increase_my_credit_score {
    type: count_distinct
    sql: CASE WHEN ${increase_my_credit_score} =  'Yes' THEN ${user_id} END;;
  }

  measure: percent_customers_with_increase_my_credit_score {
    type: number
    sql: ${customers_with_increase_my_credit_score} / ${users} ;;
    value_format_name: percent_1
  }

  measure: customers_with_learn_more_about_my_finances {
    type: count_distinct
    sql: CASE WHEN ${learn_more_about_my_finances} =  'Yes' THEN ${user_id} END;;
  }

  measure: percent_customers_with_learn_more_about_my_finances {
    type: number
    sql: ${customers_with_learn_more_about_my_finances} / ${users} ;;
    value_format_name: percent_1
  }

  measure: customers_with_something_else {
    type: count_distinct
    sql: CASE WHEN ${something_else} =  'Yes' THEN ${user_id} END;;
  }

  measure: percent_customers_with_something_else {
    type: number
    sql: ${customers_with_something_else} / ${users} ;;
    value_format_name: percent_1
  }
}
