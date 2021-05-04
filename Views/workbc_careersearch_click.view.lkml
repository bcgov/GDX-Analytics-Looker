view: workbc_careersearch_click {
  derived_table: {
    sql: SELECT wp.id AS page_view_id,
          click_type,
          source,
          text,
          noc.noc, noc.description,
          url,
          CASE WHEN click_type = 'email' THEN 1 ELSE 0 end AS email_count,
          CASE WHEN click_type = 'find_jobs' THEN 1 ELSE 0 end AS find_jobs_count,
          CASE WHEN click_type = 'job_profile' THEN 1 ELSE 0 end AS job_profile_count,
          CASE WHEN click_type = 'preview' THEN 1 ELSE 0 end AS preview_count,
          CASE WHEN click_type = 'print' THEN 1 ELSE 0 end AS print_count,
          CASE WHEN click_type = 'sort' THEN 1 ELSE 0 end AS sort_count,
          CASE WHEN click_type = 'tooltip_click' THEN 1 ELSE 0 end AS tooltip_click_count,
          CASE WHEN click_type = 'tooltip_open' THEN 1 ELSE 0 end AS tooltip_open_count,
          CASE WHEN click_type = 'youtube_play' THEN 1 ELSE 0 end AS youtube_play_count,
          CONVERT_TIMEZONE('UTC', 'America/Vancouver', sc.root_tstamp) AS timestamp
        FROM atomic.ca_bc_gov_workbc_career_search_click_1 AS sc
          JOIN atomic.com_snowplowanalytics_snowplow_web_page_1 AS wp
              ON sc.root_id = wp.root_id AND sc.root_tstamp = wp.root_tstamp
          LEFT JOIN microservice.careertoolkit_workbc AS noc -- the "00" trick is temporarily needed until the lookup table gets fixed
              ON sc.click_type IN ('find_jobs','job_profile') AND (noc.noc = sc.text OR sc.text = '0' || noc.noc OR sc.text = '00' || noc.noc OR sc.text = '00' || noc.noc)


          ;;
    distribution_style: all
    persist_for: "2 hours"
  }

  dimension: page_view_id {
    description: "Unique page view ID"
    type: string
    sql: ${TABLE}.page_view_id ;;
  }

  dimension: root_id {
    description: "Unique ID of the event"
    primary_key: yes
    type: string
    sql: ${TABLE}.root_id ;;
  }

  dimension: click_type {}
  dimension: source {}
  dimension: text {}
  dimension: url {}
  dimension: noc {}
  dimension: description {}

  measure: count {
    type: count
  }

  measure: email_count {
    type: sum
    sql: ${TABLE}.email_count;;
  }
  measure: find_jobs_count {
    type: sum
    sql: ${TABLE}.find_jobs_count;;
  }
  measure: job_profile_count {
    type: sum
    sql: ${TABLE}.job_profile_count;;
  }
  measure: preview_count {
    type: sum
    sql: ${TABLE}.preview_count;;
  }
  measure: print_count {
    type: sum
    sql: ${TABLE}.print_count;;
  }
  measure: sort_count {
    type: sum
    sql: ${TABLE}.sort_count;;
  }
  measure: tooltip_click_count {
    type: sum
    sql: ${TABLE}.tooltip_click_count;;
  }
  measure: tooltip_open_count {
    type: sum
    sql: ${TABLE}.tooltip_open_count;;
  }
  measure: youtube_play_count {
    type: sum
    sql: ${TABLE}.youtube_play_count;;
  }
}
