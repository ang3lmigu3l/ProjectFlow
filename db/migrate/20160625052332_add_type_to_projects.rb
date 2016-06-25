class AddTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :code_type, :integer
  end
end
