class CreateArticle < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content
t.integer :views, default: 0, null: false
t.boolean :enable, default: true, null: false
t.integer :comment_count, default: 0, null: false
t.references :user

t.timestamps
end
end
end
