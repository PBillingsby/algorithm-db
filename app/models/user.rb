class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :algorithms, class_name: "::Algorithm"
  has_many :articles
  has_many :examples
  attr_writer :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username, :case_sensitive => false

  scope :user_query, ->(query) {joins(query.downcase.to_sym)}
  
end
