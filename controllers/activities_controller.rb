require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/activity.rb' )
also_reload( '../models.*' )

get '/activities' do
  @activities = Activity.all()
  erb ( :"activities/index")
end

get '/activities/new' do
  erb ( :"activities/new" )
end

get '/activity/:id' do
  @activity = Activity.find(params['id'].to_i)
  erb( :"activities/show")
end
