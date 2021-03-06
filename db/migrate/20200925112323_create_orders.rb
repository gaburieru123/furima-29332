class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string  :post_code,        null: false
      t.integer :delivery_area_id, null: false
      t.string  :city,             null: false
      t.string  :house_number,     null: false
      t.string  :building_name
      t.string  :phone_number,     null: false
      t.integer :item_purchase_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
