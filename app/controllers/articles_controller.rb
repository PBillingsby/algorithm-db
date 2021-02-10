class ArticlesController < ApplicationController
  def new
    @algorithm = Algorithm.find(params[:algorithm_id])
    @article = @algorithm.articles.build
  end

  def create
    byebug
  end

  def show
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end
end
