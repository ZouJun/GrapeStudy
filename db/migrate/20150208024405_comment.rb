class Comment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, limit: 6000, null: false
      t.boolean :enable, default: true, null: false
      t.integer :layer, default: 1, null: false
      t.string :name
      t.string :ip
      t.references :article

      t.timestamps
    end
  end
end
