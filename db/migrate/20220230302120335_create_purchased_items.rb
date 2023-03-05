class CreatePurchasedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_items do |t|
      t.references :receipt, null: false, foreign_key: { to_table: :receipts }
      t.string :name, null: false
      t.references :type, null: false, foreign_key: { to_table: :types }
      t.references :brand, null: false, foreign_key: { to_table: :brands }
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.decimal :unit_price, null: false
      t.float :unit_number, null: false
      t.references :unit, null: false, foreign_key: { to_table: :units }

      t.timestamps
    end
  end
end