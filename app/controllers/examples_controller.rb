class ExamplesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    byebug
  end

  def destroy
    example = Example.find(params[:id])
    flash[:message] = "#{example.algorithm.name} Deleted"
    example.delete
    byebug
  end
end
