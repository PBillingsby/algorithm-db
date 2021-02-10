class ArticlesController < ApplicationController
  def new
    algorithm = Algorithm.find(params[:algorithm_id])
    @article = algorithm.articles.build
  end

  def create
    byebug
  end
end
