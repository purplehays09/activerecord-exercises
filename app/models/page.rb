class Page < ApplicationRecord
  validates :name, presence: true
  
  # has_many :parts
end