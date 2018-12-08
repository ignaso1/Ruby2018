class CreateCeos < ActiveRecord::Migration[5.2]
  def change
    create_table :ceos do |t|
      t.references :company, foreign_key: true
      t.float :salary
      
      t.timestamps
    end
  end
end
