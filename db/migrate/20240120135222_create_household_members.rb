class CreateHouseholdMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :household_members do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
