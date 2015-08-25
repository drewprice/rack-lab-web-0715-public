class RequestMethod
  attr_reader :application

  def initialize(application)
    @application = application
  end

  def call(env)
    status, headers, response = @application.call(env)

    response.body << env['REQUEST_METHOD']

    Rack::Response.new(response.body, status, headers)
  end
end
