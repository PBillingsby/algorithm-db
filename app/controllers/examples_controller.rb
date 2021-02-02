class ExamplesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def destroy
    Example.find(params[:id]).delete
  end

  def exampless_params
    params.require(:example).permit(:language, :example)
  end
end
