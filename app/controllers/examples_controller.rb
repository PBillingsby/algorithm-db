class ExamplesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def destroy
    example = Example.find_by(id: params[:id])
    if example.delete
      # flash = { :message => "#{example.algorithm.name} Deleted", :class => 'alert-danger' }
      respond_to do |format|
        format.html { redirect_to example.algorithm, :message => "#{example.algorithm.name} Deleted", :class => 'alert-danger' }
        format.json { head :no_content }
     end
    else
      render :show, :flash => { :message => "Something went wrong, try again", :class => 'alert-danger' }
    end
  end

end
