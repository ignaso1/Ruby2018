class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.boolean :is_logged_in
      t.string :role_type
      t.string :full_name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
