class UsersController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    
  end

  def index
    @algorithms = current_user.algorithms.all
  end
end
