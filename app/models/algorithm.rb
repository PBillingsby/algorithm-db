class Algorithm < ApplicationRecord
  has_many :examples, dependent: :nullify
  accepts_nested_attributes_for :examples
end
