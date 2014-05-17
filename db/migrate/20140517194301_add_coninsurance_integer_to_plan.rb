class AddConinsuranceIntegerToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :coinsurance, :integer
  end
end
