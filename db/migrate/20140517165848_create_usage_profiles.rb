class CreateUsageProfiles < ActiveRecord::Migration
  def change
    create_table :usage_profiles do |t|
      t.string :zipcode, limit: 10
      t.integer :gender
      t.date  :date_of_birth
      t.integer :user_id
      t.timestamps
    end

    add_index :usage_profiles, :user_id
  end
end
