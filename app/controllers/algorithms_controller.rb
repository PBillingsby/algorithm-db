class AlgorithmsController < ApplicationController
  include ApplicationHelper
  def new
    @algorithm = Algorithm.new
    @algorithm.examples.build
    # @runtime = ["O(log n)", "O(1)", "O(n)", "O(n log n)", "O(n^2)", "O(2^n)", "O(n!)"]
    # @languages = [["--", ""],"Ruby", "JavaScript" ]
  end

  def create
    algorithm = Algorithm.create(algorithms_params)
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
    algorithm.examples.create(example: params[:algorithm][:example][:example], language: params[:algorithm][:example][:language])
    redirect_to algorithm_path(algorithm), :flash => { :message => "Example added", :class => 'alert-success' }
  end

  def algorithms_params
    params.require(:algorithm).permit(:name, :best_case, :worst_case, :steps, :example, examples_attributes: [:example, :language])
  end
end
