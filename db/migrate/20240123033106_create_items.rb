class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text    :product_name
      t.text    :explanation
      t.string  :category_id
      t.string  :condition_id
      t.string  :delivery_cost_id
      t.string  :prefecture_id
      t.integer :price
      t.integer :user_id
      t.timestamps
    end
  end
end
