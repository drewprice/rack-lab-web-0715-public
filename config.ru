require_relative 'config/environment'

map '/about' do
  use Lost
  run Application.new
end

map '/' do
  use ErbMaker
  use RequestMethod
  use ServerPort
  run Application.new
end
