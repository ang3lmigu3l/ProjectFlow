class RemoveDaofbirthFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :da_of_birth, :datatype
  end
end
