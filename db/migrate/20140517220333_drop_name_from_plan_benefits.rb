class DropNameFromPlanBenefits < ActiveRecord::Migration
  def change
    remove_column :plan_benefits, :name
  end
end
