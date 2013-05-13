class HighchartsOnRails::StackedBarChart < HighchartsOnRails::BarChart
  add_json({
               plotOptions: {
                   series: {
                       stacking: 'percent'
                   },
                   bar: {
                       dataLabels: {
                           formatter: "function() { return this.y > 0 ? (Math.round(this.percentage) +'%') : ''; }"
                       }
                   }
               },
               legend: {
                   borderColor: false,
                   backgroundColor: false,
                   verticalAlign: 'top',
                   reversed: true,
                   enabled: true
               }
           })

  def title(text)
    super
    add_json({legend: {y: 20}, chart: {marginTop: 60}})
  end
end