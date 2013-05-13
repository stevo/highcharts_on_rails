window.highChart = (config, callback) ->  new Highcharts.Chart(config, callback)

window.radializeColors = (colors) ->
  $.map(colors, (color)  ->
    return { radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 }, stops: [[0, color], [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]] }
  )