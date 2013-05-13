class HighchartsOnRails::LineChart < HighchartsOnRails::BaseChart
  add_json({
               chart: {
                   type: 'line'
               },
               tooltip: {
                   enabled: false,
                   formatter: "function() { return '<b>'+ this.series.name +'</b><br/>'+ this.x +': '+ this.y; }"
               },
               yAxis: {
                   min: 0,
                   title: {
                       text: ''
                   }
               },
               plotOptions: {
                   line: {
                       dataLabels: {
                           enabled: true
                       },
                       enableMouseTracking: false
                   }
               },
           })


  def add_series(label, data, options={})
    @_series ||= []
    @_series += [{name: label, data: data}]
  end

  def color(color)
    add_json({plotOptions: {series: {color: color}}})
  end
end