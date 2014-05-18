class RemoveDefaultFromServiceUsage < ActiveRecord::Migration
  def change
    change_column :service_usages, :usage_count, :integer, :default => nil
  end
end
