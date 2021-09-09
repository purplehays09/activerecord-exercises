class Person < ApplicationRecord
  validates :name, presence: true  
  
  has_many :friendships, class_name: "friendship", foreign_key: "reference_id"
end