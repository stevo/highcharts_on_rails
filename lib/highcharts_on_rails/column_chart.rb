class HighchartsOnRails::ColumnChart < HighchartsOnRails::BaseChart
  add_json({
               chart: {
                   type: 'column',
                   marginRight: 50
               },
               tooltip: {
                   formatter: "function () { return this.series.name + ': ' + this.y + ''; }"
               },
               yAxis: {
                   max: 100,
                   title: {
                       text: ''
                   }
               },
               plotOptions: {
                   line: {
                       dataLabels: {
                           enabled: true,
                           formatter: "function () { return this.y + '%'; }",
                           style: {
                               fontWeight: 'bold',
                               fontSize: '10px',
                               color: "#373535"
                           }
                       },
                       enableMouseTracking: false
                   }
               },
               legend: {
                   enabled: false
               },
               title: false
           })


  def add_series(label, data, options={})
    @_series ||= []
    @_series += [{name: label, data: data}]
  end
end
