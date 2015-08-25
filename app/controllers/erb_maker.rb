class ErbMaker
  def initialize(application)
    @application = application
  end

  def call(env)
    status, headers, response = @application.call(env)

    response.body = erb(response.body)

    Rack::Response.new(response.body, status, headers)
  end

  def erb(body)
    template = File.read('app/views/index.html.erb')

    @server_port    = body[1]
    @request_method = body[2]

    ERB.new(template).result(binding)
  end
end
