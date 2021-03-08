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

  def scoreboard
    if !params[:query]
      @users = User.all
    else
      @users = helpers.handle_query(User.user_query(params[:query]), params[:query].downcase) # Sets instance variable for users found by scope method to handle_query helper
      @query = params[:query].downcase.to_sym # Sends query to view for dynamic iterator
    end
  end
  def users_params
    params.permit(:query)
  end
end
