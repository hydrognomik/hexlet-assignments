# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    hash = Digest::SHA256.hexdigest(body)
    [status, headers, ["#{body} #{hash}"]]
  end
end
