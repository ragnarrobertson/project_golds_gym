require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/member.rb' )
also_reload( '../models.*' )

get '/members' do
  @members = Member.all()
  erb ( :"members/index")
end

get '/members/new' do
  erb ( :"members/new" )
end

post '/members' do
  @member = Member.new(params)
  @member.save()
  erb ( :"members/create")
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  erb( :"members/show")
end

get "/members/:id/edit" do
  @member = Member.find( params[:id] )
  erb( :"members/edit" )
end

post "/members/:id" do
  Member.new( params ).update
redirect to '/members'
end

post "/members/:id/delete" do
  member = Member.find( params[:id] )
  member.delete()
  redirect to '/members'
end
