class HighchartsOnRails::GaugeChart < HighchartsOnRails::BaseChart
  add_json(
      {
          chart: {type: 'solidgauge'},
          title: nil,
          tooltip: {enabled: false},
          credits: {enabled: false},
          pane: {
              center: ['50%', '85%'],
              size: '140%',
              startAngle: -90,
              endAngle: 90,
              background: {
                  backgroundColor: '#EEE',
                  innerRadius: '60%',
                  outerRadius: '100%',
                  shape: 'arc'
              }
          },
          plotOptions: {
              solidgauge: {
                  dataLabels: {
                      y: 5,
                      borderWidth: 0,
                      useHTML: true
                  }
              }
          },
          yAxis: {
              lineWidth: 0,
              minorTickInterval: nil,
              tickPixelInterval: 400,
              tickWidth: 0,
              title: {y: -70},
              labels: {y: 16},
          },
      }
  )

  def add_series(label, data, options={})
    @_series ||= []
    @_series += [{name: label, data: data}.merge(options)]
  end
end
