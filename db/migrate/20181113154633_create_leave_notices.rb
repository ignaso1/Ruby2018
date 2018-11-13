class CreateLeaveNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_notices do |t|

      t.timestamps
    end
  end
end
