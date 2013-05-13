class HighchartsOnRails::PieChart < HighchartsOnRails::BaseChart
  add_json({
               title: {
                   style: {
                       color: '#726E6C',
                       fontWeight: 'bold'
                   },
                   text: "",
                   floating: true
               },
               xAxis: {
                   categories: nil
               },
               chart: {
                   type: "pie",
                   borderWidth: false,
                   borderColor: false,
               },
               plotOptions: {
                   pie: {
                       size: "80%",
                       dataLabels: {
                           enabled: false
                       }
                   },
                   series: {
                       shadow: false
                   }
               },
               tooltip: {
                   formatter: "function () {return this.point.name + ':</b> <b>' + this.y + '</b>';}"
               }
           })


  def add_series(label, data, options={})
    labels = Array.wrap(label)
    @_series ||= []
    @_series.unshift({name: '', data: construct_series_data(data, labels)})
  end

  #We need this fancy hash for pie charts :/
  def construct_series_data(data, labels)
    colors = Array.new(data.size) { get_color }

    if (lsize = labels.size) < data.size
      labels = labels.fill(nil, lsize, data.size-lsize)
    end

    [data, labels, colors].transpose.map do |y, name, color|
      {'color' => color, 'y' => y, 'name' => name}
    end
  end

  #============== Helpers ===============

  def with_labels!
    add_json({plotOptions: {pie: {size: "90%", dataLabels: {enabled: true,
                                                            formatter: "function() { return '<b>'+ this.point.name +'</b>: '+ Math.round(this.percentage) +' %'; }",
                                                            distance: 5,
                                                            softConnector: false}}}})
  end


  def colors(_colors)
    @colors = _colors
  end

  private

  def get_colors
    @colors ||= %w(#FF0000 #FFFFFF)
  end

  def get_color
    color = get_colors.first
    @colors.rotate!
    color
  end
end