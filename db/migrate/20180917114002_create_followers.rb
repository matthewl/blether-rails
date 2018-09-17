class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :account, foreign_key: true
      t.integer :follower_id, foreign_key: { to_table: :accounts }, index: { name: 'index_followers_on_follower_id'}
    end
  end
end
