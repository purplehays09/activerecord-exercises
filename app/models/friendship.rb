class Friendship < ApplicationRecord
  validates :source, presence: true
  validates :destination, presence: true
  
  has_many :people
  
end