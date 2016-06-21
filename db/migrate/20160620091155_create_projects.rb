class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.boolean :completed
      t.date :date_started
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
