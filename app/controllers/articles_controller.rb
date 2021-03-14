class ArticlesController < ApplicationController
  def new
    @algorithm = Algorithm.find(params[:algorithm_id])
    @article = @algorithm.articles.build
  end

  def create
    # Revisit to add algorithm to article params
    article = Article.create(article_params)
    redirect_to article_path(article), :flash => { :message => "Example added", :class => 'alert-success' }
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    if params[:article]
      @articles = Article.where(algorithm: Algorithm.find_by(name: params[:algorithm]))
      redirect_to articles_path, articles: @articles
    else
      @articles = Article.all
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.delete
    redirect_to algorithm_path(article.algorithm.id), :flash => { :message => "Article removed", :class => 'alert-danger' }
  end

  def article_params
    params.require(:article).permit(:algorithm_id, :title, :article_content)
  end
end
