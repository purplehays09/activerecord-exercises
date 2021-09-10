class Questionnaire < ApplicationRecord
  validates :title, presence: true
  
  has_many :questions
  has_many :responses, through: :questions
end
