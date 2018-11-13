class CreateHumanResourceManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :human_resource_managers do |t|

      t.timestamps
    end
  end
end
