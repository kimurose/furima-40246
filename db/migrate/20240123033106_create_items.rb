class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text    :product_name      , null: false
      t.text    :explanation       , null: false
      t.string  :category_id       , null: false
      t.string  :condition_id      , null: false
      t.string  :delivery_cost_id  , null: false
      t.string  :prefecture_id     , null: false
      t.string  :shipping_day_id   , null: false
      t.integer :price             , null: false
      t.integer :user_id           , null: false
      t.timestamps
    end
  end
end
