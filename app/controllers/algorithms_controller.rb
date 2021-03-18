class AlgorithmsController < ApplicationController
  include ApplicationHelper
  def new
    @algorithm = Algorithm.new
    @algorithm.examples.build
  end

  def create
    algorithm = Algorithm.find_or_create_by(name: algorithm_params[:name], best_case: algorithm_params[:best_case], worst_case: algorithm_params[:worst_case])
    if algorithm
      algorithm.examples.create(algorithm_params[:examples_attributes]["0"])
    end
    flash[:message] = "#{algorithm.name} added"
    redirect_to algorithm_path(algorithm)
  end

  def index
    @algorithms = Algorithm.all
  end

  def show
    @algorithm = Algorithm.find(params[:id])
    @example = @algorithm.examples.build
    @languages = @algorithm.examples.pluck(:language).uniq
    @examples = params["language"].present? ? @algorithm.examples.where(language: params[:language]) : @algorithm.examples.all
    respond_to do |format|
      format.html 
      format.json { render json: @examples }
    end
  end

  def update
    byebug
    algorithm = Article.create(params["algorithm"]["example"])
    redirect_to algorithm_path(algorithm), :flash => { :message => "Example added", :class => 'alert-success' }
  end

  def destroy
    algorithm = Algorithm.find(params[:id])
    algorithm.delete
    redirect_to algorithms_path, :flash => { :message => "#{algorithm.name} removed", :class => 'alert-danger' }
  end

  def algorithm_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps, examples_attributes: [:user_id, :example, :language])
  end
end
