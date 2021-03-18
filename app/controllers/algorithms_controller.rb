class AlgorithmsController < ApplicationController
  include ApplicationHelper
  def new
    @algorithm = current_user.algorithms.build
    @algorithm.examples.build
  end

  def create
    algorithm_found = Algorithm.find_by(name: algorithms_params[:name])
    if algorithm_found
      algorithm_found.examples.create(algorithms_params[:examples_attributes]["0"])
      algorithm = algorithm_found
    else
      algorithm = current_user.algorithms.create(algorithms_params)
    end
    flash[:message] = "#{algorithm.name} added"
    redirect_to algorithm_path(algorithm)
  end

  def index
    @algorithms = Algorithm.all
  end

  def show
    @algorithm = Algorithm.find(params[:id])
    @languages = @algorithm.examples.collect {|x| x.language}.uniq
    @examples = params["language"].present? ? @algorithm.examples.where(language: params[:language]) : @algorithm.examples.all
    respond_to do |format|
      format.html 
      format.json { render json: @examples }
     end
  end

  def update
    algorithm = Article.create(params["algorithm"]["example"])
    redirect_to algorithm_path(algorithm), :flash => { :message => "Example added", :class => 'alert-success' }
  end

  def destroy
    algorithm = Algorithm.find(params[:id])
    algorithm.delete
    redirect_to algorithms_path, :flash => { :message => "#{algorithm.name} removed", :class => 'alert-danger' }
  end

  def algorithms_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps, :example, example_attributes: [:example, :language])
  end
end
