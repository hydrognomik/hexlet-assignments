# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  attr_accessor :uri

  extend Forwardable
  include Comparable

  def initialize(string)
    @uri = URI(string)
  end

  def_delegators :@uri, :scheme, :host, :port

  def query_params
    ary = Hash[URI.decode_www_form(uri.query || '')]
    ary.transform_keys(&:to_sym)
  end

  def query_param(key, val = nil)
    query_params[key] || val
  end

  def <=>(other)
    0 if scheme == other.scheme &&
    host == other.host && 
    port == other.port &&
    query_params == other.query_params
  end
end 
# END
