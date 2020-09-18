class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                null: false
      t.text    :explanation,         null: false
      t.integer :details_categories,  null: false
      t.integer :details_status,      null: false 
      t.integer :delivery_price,      null: false 
      t.integer :delivery_area,       null: false 
      t.integer :delivery_days,       null: false 
      t.integer :price,               null: false 
      t.integer :user_id,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
