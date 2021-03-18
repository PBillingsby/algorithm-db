class Example < ApplicationRecord
  belongs_to :algorithm
  belongs_to :user
  accepts_nested_attributes_for :algorithm
end
