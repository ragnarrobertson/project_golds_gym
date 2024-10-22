require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/activity.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models.*' )

get '/activities' do
  @activities = Activity.all()
  erb ( :"activities/index")
end

get '/activities/new' do
  erb ( :"activities/new" )
end

post '/activities' do
  @activity = Activity.new(params)
  @activity.save()
  erb ( :"activities/create")
end

get '/activity/:id' do
  @activity = Activity.find(params['id'].to_i)
  @members = @activity.members()
  erb( :"activities/show")
end

get "/activity/:id/edit" do
  @activity = Activity.find( params[:id] )
  erb( :"activities/edit" )
end

post "/activity/:id" do
  Activity.new( params ).update
redirect to '/activities'
end

post "/activity/:id/delete" do
  activity = Activity.find( params[:id] )
  activity.delete()
  redirect to '/activities'
end
