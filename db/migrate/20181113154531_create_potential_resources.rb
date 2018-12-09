class CreatePotentialResources < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_resources do |t|
      t.references :human_resource_manager, index: true
      t.string :email
      t.string :name
      t.string :last_name
      t.string :position

      t.timestamps
    end
  end
end
