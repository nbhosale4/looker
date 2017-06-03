- dashboard: Users Dashboard
  layout: newspaper
  elements:
  - name: "# of Customers Assigned to User"
    label: "# of Customers Assigned to User"
    model: kustomer
    explore: conversation_assigned_users
    type: looker_bar
    fields:
    - customers.count
    - conversation_assigned_users.user_id
    - users.name
    sorts:
    - customers.count desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_fields:
    - conversation_assigned_users.user_id
    listen: {}
    row: 2
    col: 0
    width: 12
    height: 8
  - name: Users Dashboard
    type: text
    title_text: Users Dashboard
    subtitle_text: User Stats for Your Kustomer Site
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Users - High Level Chart
    label: Users - High Level Chart
    model: kustomer
    explore: conversation_assigned_users
    type: table
    fields:
    - conversations.average_time_to_first_response
    - users.name
    - conversations.avg_conversation_message_count
    - conversations.count
    - conversations.outbound_message_count_average
    filters:
      conversations.created_time: 4 weeks
    sorts:
    - conversations.average_time_to_first_response desc
    limit: 500
    column_limit: 50
    listen: {}
    row: 2
    col: 12
    width: 12
    height: 8
  - name: Team Avg Minutes to First Completion for Done Conversations
    label: Team Avg Minutes to First Completion for Done Conversations
    model: kustomer
    explore: conversation_assigned_teams
    type: looker_line
    fields:
    - conversations.modified_week
    - teams.name
    - conversations.count
    - conversations.time_to_first_completion_m
    pivots:
    - teams.name
    fill_fields:
    - conversations.modified_week
    filters:
      conversations.modified_time: 6 weeks
    sorts:
    - conversations.modified_week desc
    - teams.name
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: avg_minutes_to_first_completion
      label: Avg Minutes to First Completion
      expression: floor(${conversations.time_to_first_completion_m}/${conversations.count})
      value_format:
      value_format_name:
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - conversations.time_to_first_completion_m
    - conversations.count
    hidden_series: []
    x_axis_label: Avg Minutes to 1st completion for Done Conversations
    listen: {}
    row: 10
    col: 0
    width: 24
    height: 8
  - name: Avg Time to First Completion (Minutes) by User
    label: Avg Time to First Completion (Minutes) by User
    model: kustomer
    explore: conversation_assigned_users
    type: looker_line
    fields:
    - conversations.time_to_first_completion_m
    - conversations.count
    - conversations.modified_week
    - users.name
    pivots:
    - users.name
    fill_fields:
    - conversations.modified_week
    filters:
      conversations.modified_time: 6 weeks
    sorts:
    - conversations.time_to_first_completion_m desc 0
    - conversations.modified_week
    - users.name
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: avg_minutes_to_first_completion
      label: Avg Minutes to First Completion
      expression: floor(${conversations.time_to_first_completion_m}/${conversations.count})
      value_format:
      value_format_name:
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_fields:
    - conversations.count
    - conversations.time_to_first_completion_m
    hidden_series:
    - "∅"
    x_axis_label: Avg Minutes til Conversation 1st Marked Done
    listen: {}
    row:
    col:
    width:
    height:
