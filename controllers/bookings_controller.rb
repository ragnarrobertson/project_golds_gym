require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/booking.rb' )
also_reload( '../models.*' )

get '/bookings' do
  @bookings = Booking.all()
  erb ( :"bookings/index")
end

# get '/bookings/new' do
#   erb ( :"bookings/new" )
# end
#
# post '/bookings' do
#   @booking = Booking.new(params)
#   @booking.save()
#   erb ( :"bookings/create")
# end
#
get '/bookings/:id' do
  @booking = Booking.find(params['id'].to_i)
  erb( :"bookings/show")
end
#
# get "/bookings/:id/edit" do
#   @booking = Booking.find( params[:id] )
#   erb( :"bookings/edit" )
# end
#
# post "/bookings/:id/delete" do
#   booking = Booking.find( params[:id] )
#   booking.delete()
#   redirect to '/bookings'
# end
