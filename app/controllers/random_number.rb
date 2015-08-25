class RandomNumber
  def initialize(application)
    @application = application
  end

  def call(env)
    status, headers, response = @application.call(env)

    response.body << rand(1..1000)

    Rack::Response.new(response.body, status, headers)
  end
end
