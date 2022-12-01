FactoryBot.define do
  factory :subject do
    sequence(:name) { |i| "Subject #{i}" }
  end
end
