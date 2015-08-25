class ServerPort
  attr_reader :port

  def initialize(application)
    @application = application
  end

  def call(env)
    status, headers, response = @application.call(env)

    response.body << env['SERVER_PORT']

    Rack::Response.new(response.body, status, headers)
  end
end
