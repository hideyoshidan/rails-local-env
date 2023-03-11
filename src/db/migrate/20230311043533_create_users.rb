class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.timestamps
      t.datetime :discarded_at
    end
    # index
    add_index :users, [:email, :discarded_at]
  end
end
