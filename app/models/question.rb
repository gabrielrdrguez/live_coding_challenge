class Question < ApplicationRecord
  belongs_to :subject
  has_many :question_answers
end
