class CreatePurchasedItems < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_items do |t|
      t.references :receipt, null: false, foreign_key: { to_table: :receipts }
      t.string :name, null: true
      t.references :type, null: true, foreign_key: { to_table: :types }
      t.references :brand, null: true, foreign_key: { to_table: :brands }
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.decimal :paid_price, null: false
      t.decimal :unit_price, null: true
      t.float :unit_number, null: true
      t.references :unit, null: true, foreign_key: { to_table: :units }
      t.decimal :package_price, null: true
      t.float :package_number, null: true
      t.references :package, null: true, foreign_key: { to_table: :packages }
      t.decimal :package_volume, null: true
      t.text :comment, null: true

      t.timestamps
    end
  end
end