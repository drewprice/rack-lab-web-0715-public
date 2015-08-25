class Lost
  def initialize(application)
    @application = application
  end

  def call(env)
    status, headers, response = @application.call(env)

    template = File.read('app/views/lost.html.erb').strip
    response.body << ERB.new(template).result(binding)

    Rack::Response.new(response.body, status, headers)
  end
end
