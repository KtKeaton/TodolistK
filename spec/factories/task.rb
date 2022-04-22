FactoryBot.define do
  factory :task do
    association :user
    name {'task test'}
    note {'this is task test'}
    status {'0'}
    due_date {}
  end
end
