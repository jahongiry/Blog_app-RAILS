class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: true
      t.string :photo
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end
  end
end
