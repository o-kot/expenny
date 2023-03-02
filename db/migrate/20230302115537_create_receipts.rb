class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.date :date, null: false
      t.integer :shop_id, null: false
      t.string :comment, null: true

      t.timestamps
    end
  end
end
