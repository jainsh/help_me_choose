class AddSortOrderToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :sort_order, :integer, :default => 0
  end
end
