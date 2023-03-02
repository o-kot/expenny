class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.references :chain, null: true, foreign_key: { to_table: :chains }
      t.string :address, null: true

      t.timestamps
    end
  end
end