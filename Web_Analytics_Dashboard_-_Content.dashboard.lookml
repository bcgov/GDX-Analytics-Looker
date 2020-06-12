- dashboard: web_analytics_dashboard__content
  title: Web Analytics Dashboard - Content
  layout: newspaper
  refresh: 30 minutes
  elements:
  - name: Top Downloaded Files
    title: Top Downloaded Files
    model: snowplow_web_block
    explore: clicks
    type: table
    fields: [clicks.target_url, clicks.download_click_count]
    filters:
      clicks.click_type: download
    sorts: [clicks.download_click_count desc]
    limit: 20
    total: true
    dynamic_fields: [{table_calculation: of_downloads, label: "% of Downloads", expression: "${clicks.download_click_count}/${clicks.download_click_count:total}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Vancouver
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      clicks.download_click_count: Download Count
      clicks.target_url: Downloaded File
      clicks.session_count: Sessions
    table_theme: editable
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    enable_conditional_formatting: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    y_axes: []
    listen:
      Date Range: clicks.click_time_date
      Site: clicks.page_urlhost
      City: clicks.geo_city_and_region
      Internal Gov Traffic: clicks.is_government
      Is Mobile: clicks.device_is_mobile
      URL: clicks.page_display_url
      Title: clicks.page_title
      Section: clicks.page_section
    row: 30
    col: 12
    width: 12
    height: 12
  - name: Top Landing Page
    title: Top Landing Page
    model: snowplow_web_block
    explore: page_views
    type: table
    fields: [page_views.landing_page_count, page_views.page_title, page_views.page_display_url]
    sorts: [page_views.landing_page_count desc]
    limit: 15
    total: true
    dynamic_fields: [{table_calculation: of_landing_page_views, label: "% of Landing\
          \ Page Views", expression: "${page_views.landing_page_count}/${page_views.landing_page_count:total}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      page_views.landing_page_count: Landing Page View Count
      page_views.page_display_url: URL
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    series_types: {}
    listen:
      Date Range: page_views.page_view_start_date
      Site: page_views.page_urlhost
      City: page_views.geo_city_and_region
      Internal Gov Traffic: page_views.is_government
      Is Mobile: page_views.device_is_mobile
      URL: page_views.page_display_url
      Title: page_views.page_title
      Section: page_views.page_section
    row: 0
    col: 0
    width: 12
    height: 10
  - name: Top Offsite Links
    title: Top Offsite Links
    model: snowplow_web_block
    explore: clicks
    type: table
    fields: [clicks.click_count, clicks.target_url]
    filters:
      clicks.click_type: link^_click
      clicks.offsite_click: 'Yes'
    sorts: [clicks.click_count desc]
    limit: 20
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_offsite_clicks, label: "% of Offsite Clicks",
        expression: "${clicks.click_count}/${clicks.click_count:total}", value_format: !!null '',
        value_format_name: percent_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Vancouver
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      clicks.target_url: Offsite Links
      clicks.click_count: Offsite Click Count
      clicks.target_url_nopar: Offsite Link
      clicks.session_count: Session Count
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    y_axes: []
    listen:
      Date Range: clicks.click_time_date
      Site: clicks.page_urlhost
      City: clicks.geo_city_and_region
      Internal Gov Traffic: clicks.is_government
      Is Mobile: clicks.device_is_mobile
      URL: clicks.page_display_url
      Title: clicks.page_title
      Section: clicks.page_section
    row: 35
    col: 0
    width: 12
    height: 8
  - name: Top Site Search Terms
    title: Top Site Search Terms
    model: snowplow_web_block
    explore: searches
    type: table
    fields: [searches.search_terms, searches.search_count]
    filters:
      searches.search_terms: "-EMPTY"
    sorts: [searches.search_count desc]
    limit: 20
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_searches, label: "% of Searches", expression: "${searches.search_count}/${searches.search_count:total}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Vancouver
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      searches.terms: Search Term
      searches.search_terms: Search Term
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    subtotals_at_bottom: false
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Date Range: searches.search_time_date
      Site: searches.page_urlhost
      City: searches.geo_city_and_region
      Internal Gov Traffic: searches.is_government
      Is Mobile: searches.device_is_mobile
      URL: searches.page_display_url
      Title: searches.page_title
      Section: searches.page_section
    row: 25
    col: 0
    width: 12
    height: 10
  - name: Page Views by Traffic Channel
    title: Page Views by Traffic Channel
    model: snowplow_web_block
    explore: page_views
    type: looker_column
    fields: [page_views.page_view_start_date, page_views.referrer_medium, page_views.page_view_count]
    pivots: [page_views.referrer_medium]
    fill_fields: [page_views.page_view_start_date]
    sorts: [page_views.page_view_start_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Vancouver
    stacking: normal
    colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
      "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
    show_value_labels: false
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    listen:
      Date Range: page_views.page_view_start_date
      Site: page_views.page_urlhost
      City: page_views.geo_city_and_region
      Internal Gov Traffic: page_views.is_government
      Is Mobile: page_views.device_is_mobile
      URL: page_views.page_display_url
      Title: page_views.page_title
      Section: page_views.page_section
    row: 0
    col: 12
    width: 12
    height: 10
  - name: Top Pages
    title: Top Pages
    model: snowplow_web_block
    explore: page_views
    type: table
    fields: [page_views.page_title, page_views.page_view_count, page_views.page_display_url]
    sorts: [page_views.page_view_count desc]
    limit: 20
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_page_views, label: "% of Page Views",
        expression: "${page_views.page_view_count}/${page_views.page_view_count:total}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      page_views.page_display_url: URL
      page_views.page_title: Title
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    series_types: {}
    y_axes: []
    listen:
      Date Range: page_views.page_view_start_date
      Site: page_views.page_urlhost
      City: page_views.geo_city_and_region
      Internal Gov Traffic: page_views.is_government
      Is Mobile: page_views.device_is_mobile
      URL: page_views.page_display_url
      Title: page_views.page_title
      Section: page_views.page_section
    row: 10
    col: 0
    width: 12
    height: 15
  - name: Top Referrer URL Hosts
    title: Top Referrer URL Hosts
    model: snowplow_web_block
    explore: page_views
    type: table
    fields: [page_views.session_count, page_views.referrer_urlhost]
    sorts: [page_views.session_count desc]
    limit: 20
    total: true
    dynamic_fields: [{table_calculation: of_referrals, label: "% of Referrals", expression: "${page_views.session_count}\
          \ / sum(${page_views.session_count})", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Vancouver
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      page_views.session_count: Referral Count
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: page_views.session_count,
            name: Session Count, axisId: page_views.session_count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{id: of_all_referrals,
            name: "% of all referrals", axisId: of_all_referrals}], showLabels: true,
        showValues: true, maxValue: 1, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen:
      Date Range: page_views.page_view_start_date
      Site: page_views.page_urlhost
      City: page_views.geo_city_and_region
      Internal Gov Traffic: page_views.is_government
      Is Mobile: page_views.device_is_mobile
      URL: page_views.page_display_url
      Title: page_views.page_title
      Section: page_views.page_section
    row: 10
    col: 12
    width: 12
    height: 10
  - name: Top Referral URLs
    title: Top Referral URLs
    model: snowplow_web_block
    explore: page_views
    type: table
    fields: [page_views.page_referrer, page_views.page_view_count]
    sorts: [page_views.page_view_count desc]
    limit: 20
    total: true
    dynamic_fields: [{table_calculation: of_all_page_views, label: "% of all Page\
          \ Views", expression: "${page_views.page_view_count}/${page_views.page_view_count:total}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Vancouver
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      page_views.page_view_count: Page Views
      page_views.page_referrer: Referral URL
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    y_axes: []
    listen:
      Date Range: page_views.page_view_start_date
      Site: page_views.page_urlhost
      City: page_views.geo_city_and_region
      Internal Gov Traffic: page_views.is_government
      Is Mobile: page_views.device_is_mobile
      URL: page_views.page_display_url
      Title: page_views.page_title
      Section: page_views.page_section
    row: 20
    col: 12
    width: 12
    height: 10
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 7 days ago for 7 days
    allow_multiple_values: true
    required: true
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.page_view_start_date
  - name: Site
    title: Site
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.page_urlhost
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.geo_city_and_region
  - name: Internal Gov Traffic
    title: Internal Gov Traffic
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.is_government
  - name: Is Mobile
    title: Is Mobile
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.device_is_mobile
  - name: URL
    title: URL
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.page_display_url
  - name: Title
    title: Title
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.page_title
  - name: Section
    title: Section
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: snowplow_web_block
    explore: page_views
    listens_to_filters: []
    field: page_views.page_section