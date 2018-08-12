require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
# require_relative('controllers/classes_controller')
require_relative('controllers/members_controller')
require_relative('controllers/sessions_controller')
require_relative("models/session.rb")
require_relative("models/studio.rb")
also_reload("models/*")

get '/gym' do
  @sessions = Session.all()
  erb(:index)
end
