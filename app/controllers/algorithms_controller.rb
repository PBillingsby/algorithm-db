class AlgorithmsController < ApplicationController
  include ApplicationHelper
  def new
    @algorithm = Algorithm.new
    @algorithm.examples.build
  end
  def create
    algorithm = Algorithm.create(algorithms_params)
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
    algorithm.examples.create(example: params[:algorithm][:example][:example], language: params[:algorithm][:example][:language])
    redirect_to algorithm_path(algorithm)
  end

  def algorithms_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps, :example, examples_attributes: [:example, :language])
  end
end
