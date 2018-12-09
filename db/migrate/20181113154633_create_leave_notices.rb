class CreateLeaveNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_notices do |t|
      t.references :resource, index: true
      t.string :reason
      t.date   :start
      t.date   :finish

      t.timestamps
    end
  end
end
