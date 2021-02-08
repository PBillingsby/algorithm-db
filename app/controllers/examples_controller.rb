class ExamplesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    example = Example.find_by(id: params[:id])
    if example.delete
      redirect_to :back, :flash => { :message => "#{example.algorithm.name} Deleted", :class => 'alert-danger' }
    else
      render :show, :flash => { :message => "Something went wrong, try again", :class => 'alert-danger' }
    end
  end
end
