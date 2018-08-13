require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gym/classes' do
  @gymclasses = GymClass.all()
  erb(:"gymclasses/index")
end

#new
get '/gym/classes/new' do
  erb(:"gymclasses/new")
end

#post
post '/gym/classes' do
  new_class = GymClass.new(params)
  new_class.save()
  redirect "/gym/classes"
end

get '/gym/classes/:id' do
  @gymclass = GymClass.find(params[:id])
  erb(:"gymclasses/show")
end

post '/gym/classes/:id/delete' do
  @gymclass = GymClass.find(params[:id])
  @gymclass.delete()
  redirect "/gym/classes"
end

# Edit
get '/gym/classes/:id/edit' do
  @gymclass = GymClass.find(params[:id])
  erb(:"gymclasses/edit")
end

# Update
post '/gym/classes/:id' do
  @gymclass = GymClass.new(params)
  @gymclass.update()
  erb(:"gymclasses/show")
end
