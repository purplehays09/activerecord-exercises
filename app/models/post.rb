class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :categories, class_name: "category", foreign_key: "categories_id"  
end