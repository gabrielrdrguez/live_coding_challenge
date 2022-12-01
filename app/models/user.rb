class User < ApplicationRecord
  has_many :question_answers
end
