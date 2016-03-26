class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null:false
      t.string :name
      t.string :encrypted_password, null:false
      t.string :email
      t.string :salt
      t.integer :gender, default: 0

      t.timestamps
    end
  end
end
