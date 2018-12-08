class CreatePotentialResources < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_resources do |t|
      t.references :human_resource_manager, index: true
      
      t.timestamps
    end
  end
end
