
class Router
  # include Codebracker
  def self.call(env)
    new(env).response
  end
    
  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path
    when '/' then Rack::Response.new(render('index.html.erb'))
    when '/game' then Rack::Response.new(render('game.html.erb'))
    when '/score' then Rack::Response.new(render('score.html.erb'))
    end
  end

  # def render_erb(file_path)
  #   template = File.read(file_path)
  #   ERB.new(template).result(binding)
  # end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  # get "/" do
  #   "Hello World!"
  # end
end