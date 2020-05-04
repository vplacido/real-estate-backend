class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.integer :zipcode
      t.string :password_digest
      t.string :session_token

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end
