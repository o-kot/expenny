class CreatePurchasedItemsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_items_tags do |t|
      t.references :purchased_item, null: false, foreign_key: { to_table: :purchased_items }
      t.references :tag, null: false, foreign_key: { to_table: :tags }

      t.timestamps
    end
  end
end