class CreateServiceCosts < ActiveRecord::Migration
  def change
    create_table :service_costs do |t|
      t.string :name, limit: 100
      t.integer :cost
      t.timestamps
    end

    add_index :service_costs, :name
  end
end
