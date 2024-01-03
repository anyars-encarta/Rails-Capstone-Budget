# factories.rb
FactoryBot.define do
  factory :category do
    name { 'Sample category' }
    icon { Category::ICONS.keys.sample }
    association :user
  end

  factory :user do
    name { 'John Doe' }
    sequence(:email) { |n| "john#{n}@example.com" }
    password { 'password' }
    admin { false }
  end

  factory :expense do
    name { 'Sample expense name' }
    amount { 500 }
    association :category
    association :user
  end
end
