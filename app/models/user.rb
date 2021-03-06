class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :algorithms, class_name: "::Algorithm"
  has_many :articles, through: :algorithms
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :user_query, ->(query) {joins(query.downcase.to_sym)}

end
