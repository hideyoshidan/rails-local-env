class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references  :user, foreign_key: true
      t.string   :title, null: false
      t.text     :contents, null: false
      t.timestamps
      t.datetime :discarded_at
    end
    # index
    add_index :posts, :discarded_at
  end
end
