class Article < ApplicationRecord
  belongs_to :algorithm
  accepts_nested_attributes_for :algorithm

  has_rich_text :content
end