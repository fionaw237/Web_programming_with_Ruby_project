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
  spaces = GymClass.find(params[:gymclass_id]).capacity()
  @session = Session.new(params)
  @session.spaces = spaces
  @session.year = params[:date][0..3]
  @session.month = params[:date][5..6]
  @session.day = params[:date][8..9]
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

#add member to session
post '/gym/:id/add_member' do
  #@session = Session.find(params[:id])
  @member = Member.find(params[:new_member_id])
  @session = Session.find(params[:edited_session_id])
  @member.book_class(@session)
  @session.update()
  erb(:"sessions/members")
  # redirect '/gym/:edited_session_id/members'
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
  p params[:date]
  @session = Session.new(params)
  @session.year = params[:date][0..3]
  @session.month = params[:date][5..6]
  @session.day = params[:date][8..9]
  @session.update()
  erb(:"sessions/show")
end
