FactoryBot.define do
  factory :item do
    association :user, factory: :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'comment.png'), 'image/png') }
    product_name     { '商品名' }
    explanation      { '商品の説明' }
    category_id      { 2 }
    condition_id     { 2 }
    delivery_cost_id { 2 }
    prefecture_id    { 2 }
    shipping_day_id  { 2 }
    price            { 2000 }
  end
end
