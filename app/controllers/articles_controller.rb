class ArticlesController < ApplicationController
  def new
    @algorithm = Algorithm.find(params[:algorithm_id])
    @article = @algorithm.articles.build
  end

  def create
    # Revisit to add algorithm to article params
    algorithm = Algorithm.find(params[:algorithm_id])
    article = algorithm.articles.create(articles_params[:article])
    redirect_to article_path(article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    if params[:article]
      @articles = Article.where(algorithm: Algorithm.find_by(name: params[:algorithm]))
    end
  end

  def articles_params
    params.require(:article).permit(article: [:title, :article_content])
  end
end
