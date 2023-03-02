class CreatePurchasedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_items do |t|
      t.integer :receipt_id, null: false
      t.string :name, null: false
      t.integer :type_id, null: false
      t.integer :brand_id, null: true
      t.decimal :unit_price, null: false
      t.float :unit_number, null: false
      t.integer :unit_type_id, null: false

      t.timestamps
    end
  end
end