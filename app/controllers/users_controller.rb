class UsersController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    byebug
  end

  def index
    @algorithms = current_user.algorithms.all
  end
  def scoreboard
    users_objects = []
    User.all.each do |user|
      users_objects << {"#{user.username}": {algorithms: user.algorithms.count, articles: user.articles.count}}
    end
    render json: users_objects
  end
end
