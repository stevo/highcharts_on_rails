module HighchartsOnRails
  module ApplicationHelper
    def highchart(_chart)

      if Rails.env.development?
        puts "--------------------------------------"
        puts "highChart(#{_chart.to_json})"
      end

      content_tag(:div, '', :id => _chart.container) + javascript_tag(<<JAVASCRIPT
    try {
    window.#{_chart.container}_chart = highChart(#{_chart.to_json});
    } catch(err) {
    console.log(err);
    }
JAVASCRIPT
      )
    end
  end
end
