# HighchartsOnRails

Sexy DSL for using higcharts in RoR

## Installation

Add this line to your application's Gemfile:

    gem 'highcharts_on_rails'

Add this line to your applications application.js file:

    //= require highcharts_on_rails/charts

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install highcharts_on_rails

## Usage

### Describing chart

Example

    @chart = HighchartsOnRails::HollowPieChart.new do |chart|
      chart.title "Browser market share"
      chart.subtitle "Random data for random browsers :P"
      chart.set_container 'nice'
      chart.add_series %w(IE FF Chrome), [1,30,69]
      chart.with_labels!
      chart.add_json({plotOptions: {pie: {size: "80%", innerSize: "50%"}}})
    end

### Rendering chart

This couldn't be any simpler. Example for haml view:

    = highchart(@chart)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Important

As this gem is still in its early stage, please be advised, that default configurations for different charts may be altered in near future.

