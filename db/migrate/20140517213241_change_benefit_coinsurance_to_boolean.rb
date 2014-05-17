class ChangeBenefitCoinsuranceToBoolean < ActiveRecord::Migration
  def change
    change_column :plan_benefits, :coinsurance, :boolean, default: false
  end
end
