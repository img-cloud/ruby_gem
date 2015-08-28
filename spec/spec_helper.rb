$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'img_cloud'
require 'rexml/parsers/ultralightparser'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end

# Represents an HTML tag
class TestTag
  attr_accessor :name, :attributes, :children, :text, :html_string
  # Creates a new +TestTag+ from a given +element+ string
  def initialize(element)
    @html_string = element
    element = valid_tag(element) unless element.is_a? Array
    case element[0]
    when :start_element
      @name = element[2]
      @attributes = element[3]
      @children = (Array(element[4..-1]) || []).map {|c | TestTag.new c}
    when :text
      @text = element[1]
      @name = "text"
      @attributes = []
      @children = []
    end

  end

  # Parses a given +tag+ in string format
  def valid_tag(tag)
    parser = REXML::Parsers::UltraLightParser.new( tag)
    parser.parse[0]
  end

  # Returns attribute named +symbol_or_string+
  def [](symbol_or_string)
    attributes[symbol_or_string.to_s]
  end

  def method_missing(symbol, *args)
    if (m = /children_by_(\w+)/.match(symbol.to_s)) and !args.empty?
      @children.select{ |c| c[m[1]] == args[0]}
    else
      super
    end
  end

  def ==(other)
    case other
    when String
      @text == other
    else
      other.respond_to?( :text) &&
        other.respond_to?( :name) &&
        other.respond_to?( :attributes) &&
        other.respond_to?( :children) &&
        @text == other.text &&
        @name == other.name &&
        @attributes == other.attributes &&
        @children == other.children
    end
  end
end
