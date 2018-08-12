require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("models/gymclass.rb")
# require_relative("models/house.rb")
also_reload("models/*")

get '/gym' do
  @gymclasses = GymClass.all()
  erb(:index)
end
