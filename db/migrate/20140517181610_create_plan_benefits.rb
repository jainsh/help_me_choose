class CreatePlanBenefits < ActiveRecord::Migration
  def change
    create_table :plan_benefits do |t|
      t.string :name, Limit: 150
      t.integer :coinsurance, default: 0
      t.integer :copay, default: 0
      t.integer :plan_id
      t.integer :service_cost_id
      t.timestamps
    end

    add_index :plan_benefits, :plan_id
    add_index :plan_benefits, :service_cost_id
  end
end
