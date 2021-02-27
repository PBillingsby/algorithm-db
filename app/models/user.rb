class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :algorithms
  has_many :articles, through: :algorithms
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def get_leaderboard_data
    byebug
  end
end
