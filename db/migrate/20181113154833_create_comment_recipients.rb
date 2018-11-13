class CreateCommentRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_recipients do |t|

      t.timestamps
    end
  end
end
