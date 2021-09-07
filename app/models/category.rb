class Category < ApplicationRecord
  validates  :name, presence: true
  
  has_many :posts, class_name: "post", foreign_key: "post_id"
end