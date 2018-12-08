class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references 'admin', index: true
      t.float  :debt
      t.string :name

      t.timestamps
    end
  end
end
