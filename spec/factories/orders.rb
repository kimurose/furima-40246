FactoryBot.define do
  factory :order do
    association :item, factory: :item
    association :user, factory: :user
  end
end
