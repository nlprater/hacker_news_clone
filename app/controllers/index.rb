#get methods===============================

get '/' do
  redirect to '/posts'
end

get '/posts' do
  @posts = Post.all

  erb :posts
end

get '/post/new' do
  erb :post_new
end

get '/post/:post_id' do
  @post = Post.find(params[:post_id])

erb :post
end

get '/auth' do
  erb :auth
end

get '/user/:user_id' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  erb :user
end

get '/logout' do
  session.clear
  redirect to '/posts'
end

#post methods ==================================

post '/login' do
  @user = User.find_by_username(params[:user][:username])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to '/posts'
  else
    @error = "Whatchu talkin bout?"
    erb :auth
  end
end

post '/create' do
  @user = User.create(params[:user])

  session[:user_id] = @user.id

  redirect to '/posts'
end

post '/post/new' do
 post = Post.create(params[:post])
 current_user.posts << post
 redirect to "/post/#{post.id}"
end

post '/comment/:post_id' do
  post_id = params[:post_id]
  comment = Comment.create(params[:comment])
  current_user.comments << comment
  Post.find(post_id).comments << comment

  redirect to "/post/#{post_id}"
end
