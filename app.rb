require 'sinatra'
require 'sinatra/activerecord'
set :database, 'sqlite3:homework.sqlite3'
require './models'

#home/display page
get "/" do

  @users = User.all
  @articles = Article.all
  @comments = Comment.all

  erb :index
end

#new input page

get "/new" do
  erb :new
end

#create new methods
post "/create-user" do
  name = params[:name]

  User.create(name: name)

  redirect "/"
end

post "/create-comment" do
  content = params[:content]
  author = params[:author]

  Comment.create(content: content, author: author)

  redirect "/"
end

post "/create-article" do
  title = params[:title]
  author = params[:author]

  Article.create(title: title, author: author)

  redirect "/"
end

#edit pages
get "/show/:id/article/edit" do
  @article = Article.find(params[:id])
  erb :'article/edit'
end

get "/show/:id/comment/edit" do
  @comment = Comment.find(params[:id])
  erb :'comment/edit'
end

get "/show/:id/user/edit" do
  @user = User.find(params[:id])
  erb :'user/edit'
end

#edit methods
post "/update/article/:id" do
  @article = Article.find(params[:id])
  @article.update(title: params[:title], author: params[:author])
  redirect "/"
end

post "/destroy/article/:id" do
  @article = Article.find(params[:id])
  @article.destroy
  redirect "/"
end

post "/update/comment/:id" do
  @comment = Comment.find(params[:id])
  @comment.update(content: params[:content], author: params[:author])
  redirect "/"
end

post "/destroy/comment/:id" do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect "/"
end

post "/update/user/:id" do
  @user = User.find(params[:id])
  @user.update(name: params[:name])
  redirect "/"
end

post "/destroy/user/:id" do
  @user = User.find(params[:id])
  @user.destroy
  redirect "/"
end
