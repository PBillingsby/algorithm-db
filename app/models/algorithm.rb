class Algorithm < ApplicationRecord
  has_many :examples
  accepts_nested_attributes_for :examples
end
