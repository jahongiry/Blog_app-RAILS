class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, foreign_key: true
      t.integer :post_id, foreign_key: true
      t.text :text

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id
    add_index :comments, :author_id

    add_foreign_key :comments, :posts, column: :post_id
    add_index :comments, :post_id

  end
end