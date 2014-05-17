class AddOrderToServiceCosts < ActiveRecord::Migration
  def change
    add_column :service_costs, :order, :integer, :default => 0
  end
end
