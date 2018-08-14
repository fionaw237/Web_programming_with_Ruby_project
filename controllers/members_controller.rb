require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/member.rb' )
also_reload( '../models/*' )

get '/gym/members' do
  @members = Member.all()
  erb(:"members/index")
end

#new
get '/gym/members/new' do
  erb(:"members/new")
end

#create
post '/gym/members' do
  @member = Member.new(params)
  @member.image = "/images/" + params[:image]
  @member.save()
  redirect "/gym/members"
end

get '/gym/members/:id' do
  @member = Member.find(params[:id])
  erb(:"members/show")
end

get '/gym/members/:id' do
  @member = Member.find(params[:id])
  erb(:"members/show")
end

post '/gym/members/:id/delete' do
  @member= Member.find(params[:id])
  @member.delete()
  redirect "/gym/members"
end

# Edit
get '/gym/members/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

# Update
post '/gym/members/:id' do
  @member = Member.new(params)
  @member.update()
  erb(:"members/show")
end
