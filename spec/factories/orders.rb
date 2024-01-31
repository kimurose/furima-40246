FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    association :item, factory: :item
    association :user, factory: :user
  end
end
