FactoryBot.define do
  factory :question do
    right_answer { %w[A B C D E].sample }

    subject
  end
end
