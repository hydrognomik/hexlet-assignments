# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    if request.path.start_with?('/admin')
      [403, {}, ['403 Forbidden']]
    else
      [status, headers, body]
    end
  end
end
