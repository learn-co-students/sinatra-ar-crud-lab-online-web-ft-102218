
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  post '/articles' do
    @article = Article.create(params)
    @article.save
    redirect to("/articles/#{@article.id}")
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.destroy
    erb :index
  end

end
