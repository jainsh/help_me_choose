class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name, limit: 150
      t.integer :monthly_premium
      t.integer :annual_deductible
      t.integer :max_oop
      t.timestamps
    end
  end
end
