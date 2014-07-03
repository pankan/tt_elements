class AddArrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :arr, :array
  end
end
