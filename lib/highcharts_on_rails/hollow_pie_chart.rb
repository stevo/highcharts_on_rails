class HighchartsOnRails::HollowPieChart < HighchartsOnRails::PieChart
  add_json({
               plotOptions: {
                   pie: {
                       size: "80%",
                       innerSize: "60%",
                       dataLabels: {
                           enabled: false
                       }
                   },

               }
           })

  #============== Helpers ===============

  def with_labels!
    super
    add_json({plotOptions: {pie: {size: "60%", innerSize: "40%"}}})
  end

  def centered_percentage_label(color)
    centered_label("Math.round(chart.series[0].data[0].percentage) + '%'", color)
  end

  def centered_count_label(color)
    centered_label("Math.round(chart.series[0].data[0].y)", color)
  end

  def centered_label(formula, color)
    add_function <<END_OF_FORMULA
        var x = chart.chartWidth / 2,
            y = chart.chartHeight / 2;

        // Render the text
        chart.renderer.text(#{formula}, x, y + 5).css({
            color: '#{color}',
            fontSize: '18px',
            fontWeight: 'bold'
        }).attr({
            align: 'center',
            zIndex: 0
        }).add();
END_OF_FORMULA
  end
end
