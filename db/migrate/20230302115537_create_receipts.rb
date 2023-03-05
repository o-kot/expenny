class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.date :date, null: false
      t.references :shop, null: false, foreign_key: { to_table: :shops }
      t.string :comment, null: true

      t.timestamps
    end
  end
end
