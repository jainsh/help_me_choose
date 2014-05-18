class MakeDefaultUsageZero < ActiveRecord::Migration
  def change
    change_column :service_usages, :usage_count, :integer, :default => 0
  end
end
