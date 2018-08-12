require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/session.rb' )
also_reload( '../models/*' )

get '/gym/:id' do
  @session = Session.find(params[:id])
  erb(:"sessions/show")
end

#delete session
post '/gym/:id/delete' do
  @session = Session.find(params[:id])
  @session.delete()
  redirect "/gym"
end

# # Edit session
# get '/gym/:id/edit' do
#   @session = Session.find(params[:id])
#   erb(:"sessions/edit")
# end
#
# # Update session
# post '/gym/:id' do
#   @session = Session.new(params)
#   @session.update()
#   erb(:"sessions/show")
#   #redirect "/gym"
# end
