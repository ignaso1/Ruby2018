class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :manageable, polymorphic: true

      t.string :email
      t.string :name
      t.string :last_name
      t.string :position
      t.float  :salary
      t.date   :birthday

      t.timestamps
    end
  end
end
