class AlgorithmsController < ApplicationController
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

  def algorithms_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps, examples_attributes: [:example, :language])
  end
end
