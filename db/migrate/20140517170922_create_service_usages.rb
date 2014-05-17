class CreateServiceUsages < ActiveRecord::Migration
  def change
    create_table :service_usages do |t|
      t.integer :usage_count, default: 1
      t.integer :service_cost_id
      t.integer :usage_profile_id
      t.timestamps
    end

    add_index :service_usages, :service_cost_id
    add_index :service_usages, :usage_profile_id
  end
end
