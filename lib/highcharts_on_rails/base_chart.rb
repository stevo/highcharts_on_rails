class HighchartsOnRails::BaseChart
  attr_reader :container
  class_attribute :json_hash, :functions_array

  def initialize(&block)
    block.call(self)
  end

  def self.add_json(_json_hash)
    self.json_hash ||= {}
    self.json_hash = json_hash.deep_merge(_json_hash)
  end

  def self.add_function(_function_string)
    self.functions_array ||= []
    self.functions_array += [_function_string]
  end

  # Defaults
  add_json({exporting: {enabled: false}, credits: {enabled: false}})

  def to_json
    [dump_json, dump_function].compact.join(',')
  end

  def add_json(_json_hash)
    @_json_customizations ||= []
    @_json_customizations << _json_hash
  end

  def add_function(_function_string)
    @_functions ||= []
    @_functions << _function_string
  end

  def add_series(label, data, options={})
    raise NotImplementedError, "The look of series differ between charts, therefore this needs to be implemented in subclass"
  end


  #==================================
  #========== JSON Helpers ==========
  #==================================

  def set_container(name)
    @container = name
    add_json({chart: {renderTo: name}})
  end

  def colors(colors_array)
    _colors_array = preprocess_gradients(colors_array)

    add_json(colors: _colors_array)
  end

  def text_color(color)
    add_json(title: {style: {color: color}})
  end

  def title(text)
    add_json({title: {text: text}})
  end

  def subtitle(text)
    add_json({subtitle: {text: text}})
  end

  def height(pixels)
    add_json({chart: {height: pixels}})
  end

  def width(pixels)
    add_json({chart: {width: pixels}})
  end

  def categories(categories)
    add_json({xAxis: {categories: categories}})
  end


  private

  def preprocess_gradients(colors_array)
    colors_array.map do |color_definition|
      if color_definition =~ />#/
        color_from, color_to = color_definition.split('>')
        gradient(color_from, color_to)
      else
        color_definition
      end
    end
  end

  def gradient(start, stop)
    {
        linearGradient: {x1: 0, y1: 0, x2: 1, y2: 0},
        stops: [[0, start], [1, stop]]
    }
  end

  def dump_json
    final_json_hash.to_json.gsub(/"function[^"]+"/) { |m| m.gsub('"', '') }
  end

  def dump_function
    "function (chart) { #{(Array.wrap(self.class.functions_array) + Array.wrap(@_functions)).compact.join("\n")} }"
  end

  def final_json_hash
    add_json({series: @_series})

    result = self.class.json_hash.deep_dup
    @_json_customizations.each do |_json_hash|
      result = result.deep_merge(_json_hash)
    end
    result
  end
end