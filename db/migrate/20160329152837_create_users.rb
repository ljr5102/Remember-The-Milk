class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
    end
    add_index :users, :username, unique: true
    add_index :users, :email_address, unique: true
    add_index :users, :session_token, unique: true
  end
end
