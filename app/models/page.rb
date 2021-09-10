class Page < ApplicationRecord
  validates :title, presence: true
  
  has_many :parts
end