FactoryBot.define do
  factory :task do
    title {Faker::Book.title}
    description {Faker::Quote.famous_last_words}
    due_date {Faker::Date.forward(days: 20)}
    completed {0}
  end
end
