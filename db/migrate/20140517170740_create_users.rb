class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first, limit: 100
      t.string :last, limit: 100
      t.timestamps
    end
  end
end
