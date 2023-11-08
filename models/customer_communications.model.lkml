connection: "snowflake_product"

include: "/views/*.view"

datagroup: customer_communications_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: customer_communications_default_datagroup

label: "Arro Customer Communications Monitoring"

explore: late_payment_responses {
}

explore: email_text_opt_outs {
}

explore: trueaccord_emails {
  join: trueaccord_texts {
    type: full_outer
    sql_on: ${trueaccord_emails.user_id} = ${trueaccord_texts.user_id} ;;
    relationship: many_to_many
  }
}
