class AddBodyToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :body, :string
  end
end
