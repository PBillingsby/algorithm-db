class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :algorithms
  has_many :articles, through: :algorithms
  attr_writer :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def login
    @login || self.username || self.email
  end

  def get_leaderboard_data
    {
      algorithms: self.algorithms.count,
      articles: self.articles.count
    }
  end
end
