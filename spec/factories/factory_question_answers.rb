FactoryBot.define do
  factory :question_answer do
    answer { 'A' }
    user
    subject
  end
end
