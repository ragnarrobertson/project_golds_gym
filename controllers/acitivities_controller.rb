require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/activity.rb' )
also_reload( '../models.*' )

get '/avtivities' do
  @activity = Activity.all()
  erb ( :"activities/show")
end
