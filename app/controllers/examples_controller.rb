class ExamplesController < ApplicationController
  def new
    
  end
  def create
    byebug
  end
  def index
  end

  def show
  end

  def exampless_params
    params.require(:example).permit(:language, :example)
  end
end
