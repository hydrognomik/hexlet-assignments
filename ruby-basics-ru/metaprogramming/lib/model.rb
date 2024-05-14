# frozen_string_literal: true

# BEGIN
module Model
  def initialize(attrs = {})
    @attributes = {}
    attrs.each do |name, val|
      @attributes[name] = transform(self.class.schema[name][:type], val) if self.class.schema.keys.include?(name)
    end
  end

  def self.included base
    base.extend ClassMethods
  end

  def attributes
    @attributes
  end

  def transform(type, value)
    nil if value.nil?

    case type
      when :integer
        value.to_i
      when :string
        value.to_s
      when :datetime
        DateTime.parse value
      when :boolean
        !!value
      else
        value
    end
  end

  module ClassMethods
    def schema
      @schema
    end

    def attribute(name, options = {})
      @schema ||= {}
      @schema[name] = options

      define_method name do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        val = value.nil? ? options[:default] : transform(options[:type], value)
        @attributes[name] = val
      end 
    end
  end
end
# END
