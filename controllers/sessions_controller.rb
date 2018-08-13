require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/session.rb' )
also_reload( '../models/*' )

#new
get '/gym/new_session' do
  @classes = GymClass.all()
  @studios = Studio.all()
  erb(:"sessions/new")
end

#create
post '/gym' do
  @session = Session.new(params)
  @session.save()
  redirect "/gym"
end

get '/gym/:id' do
  @session = Session.find(params[:id])
  erb(:"sessions/show")
end

#add member to session
get '/gym/:id/add_member' do
  @session = Session.find(params[:id])
  @members = Member.all()
  erb(:"sessions/add_member")
end

get '/gym/:id/members' do
  @session = Session.find(params[:id])
  erb(:"sessions/members")
end

#delete session
post '/gym/:id/delete' do
  @session = Session.find(params[:id])
  @session.delete()
  redirect "/gym"
end

# Edit
get '/gym/:id/edit' do
  @session = Session.find(params[:id])
  erb(:"sessions/edit")
end

# Update
post '/gym/:id' do
  @session = Session.new(params)
  @session.update()
  erb(:"sessions/show")
end
