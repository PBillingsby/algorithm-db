class UsersController < ApplicationController
  before_action :authenticate_user!
  include UsersHelper
  def new
    
  end

  def create
    
  end

  def index
    @algorithms = current_user.algorithms.all
  end
  
  def users_params
    params.permit(:query)
  end
end
