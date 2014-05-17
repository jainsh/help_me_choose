class AddCodeToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :code, :string, length: 20
  end
end
