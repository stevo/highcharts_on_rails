class HighchartsOnRails::BarChart < HighchartsOnRails::BaseChart
  add_json({
               chart: {
                   type: 'bar',
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
                   bar: {
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
               legend: false,
               title: false
           })


  def add_series(label, data, options={})
    @_series ||= []
    @_series.unshift({name: label, data: data})
  end
end
