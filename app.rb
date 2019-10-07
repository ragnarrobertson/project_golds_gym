require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative("./controllers/activities_controller")

get '/' do
  erb( :index )
end
