class CreateCeos < ActiveRecord::Migration[5.2]
  def change
    create_table :ceos do |t|

      t.timestamps
    end
  end
end
