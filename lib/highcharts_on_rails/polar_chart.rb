class HighchartsOnRails::PolarChart < HighchartsOnRails::BaseChart
  add_json(
      {
          chart: {
              polar: true
          },
          title: {
              text: ''
          },
          pane: {
              startAngle: 0,
              endAngle: 360
          },
          xAxis: {
              tickInterval: 1,
              min: 0,
          },
          plotOptions: {
              column: {
                  pointPadding: 0,
                  groupPadding: 0
              }
          },
      }
  )

  def add_series(label, data, options={})
    @_series ||= []
    if @_series.any?
      @_series += [{name: label, data: data, type: 'line'}.merge(options)]
    else
      @_series += [{name: label, data: data, type: 'column'}.merge(options)]
    end
  end
end
