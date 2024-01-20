class CreatePurchasedItemHouseholdMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :purchased_item_household_members do |t|
      t.references :purchased_item, foreign_key: { to_table: :purchased_items }
      t.references :household_member, foreign_key: { to_table: :household_members }
    end
  end
end
