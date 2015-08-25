class Application
  attr_accessor :server_port, :request_method, :random_number, :erb_maker

  def call(env)
    Rack::Response.new('', 200)
  end
end
