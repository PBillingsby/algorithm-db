class ExamplesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    example = Example.create(example_params)
    # @algorithm = example.algorithm
    # @languages = @algorithm.examples.pluck(:language).uniq
    # @example = @algorithm.examples.build
    redirect_to algorithm_path(@algorithm), locals: { language: example.language }
    # algorithm_path(example.algorithm, language: example.language), :flash => { :message => "Example Added", :class => 'alert-success' }
  end

  def destroy
    example = Example.find_by(id: params[:id])
    if example.delete
      redirect_to algorithm_path(example.algorithm), :flash => { :message => "#{example.algorithm.name} Deleted", :class => 'alert-danger' }
    else
      render :show, :flash => { :message => "Something went wrong, try again", :class => 'alert-danger' }
    end
  end

  def example_params
    params.require(:example).permit(:example, :language, :algorithm_id, :user_id)
  end
end
