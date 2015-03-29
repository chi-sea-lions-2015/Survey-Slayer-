get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/users/new' do

  @user = User.new
  erb :sign_up
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:user_id] = @user.id
    redirect "/surveys"
  else
    # @errors = @user.errors.messages
    erb :sign_up
  end
end
