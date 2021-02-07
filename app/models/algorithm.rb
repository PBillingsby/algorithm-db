class Algorithm < ApplicationRecord
  has_many :examples, dependent: :nullify
  accepts_nested_attributes_for :examples
  LANGUAGES = [["--", ""],"Ruby", "JavaScript" ]
  RUNTIME =  = ["O(log n)", "O(1)", "O(n)", "O(n log n)", "O(n^2)", "O(2^n)", "O(n!)"]
end
