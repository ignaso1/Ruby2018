class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references 'project_manager', index: true
      t.string :name
      t.integer :resource_reqs
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
