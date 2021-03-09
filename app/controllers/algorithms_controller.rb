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
  end

  def update
    algorithm = Algorithm.find(params[:id])
    byebug
    algorithm.examples.create(params[:example])
    redirect_to algorithm_path(algorithm), :flash => { :message => "Example added", :class => 'alert-success' }
  end

  def destroy
    algorithm = Algorithm.find(params[:id])
    algorithm.delete
    redirect_to algorithms_path, :flash => { :message => "#{algorithm.name} removed", :class => 'alert-danger' }
  end

  def algorithms_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps, examples_attributes: [:example, :language])
  end
end
