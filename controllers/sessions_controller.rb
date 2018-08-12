require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/session.rb' )
also_reload( '../models/*' )

get '/gym/:id' do
  @session = Session.find(params[:id])
  erb(:"sessions/show")
end
