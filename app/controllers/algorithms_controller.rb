class AlgorithmsController < ApplicationController
  def new
    @algorithm = Algorithm.new
  end
  def create
    algorithm = Algorithm.create(algorithms_params)
    redirect_to '/'
  end
  def index
    @algorithms = Algorithm.all
    redirect_to '/index'
  end

  def show
  end

  def algorithms_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps)
  end
end
