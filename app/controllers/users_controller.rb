class UsersController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    byebug
  end
end
