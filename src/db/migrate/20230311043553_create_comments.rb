class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references  :user, foreign_key: true, null: false
      t.references  :post, foreign_key: true, null: false
      t.text     :comment, null: false
      t.timestamps
    end
    # index
    add_index :comments, [:id, :user_id, :post_id], unique: true
  end
end



