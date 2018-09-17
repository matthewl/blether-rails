class AddReplyToAttributeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :reply_to_post_id, :integer
  end
end
