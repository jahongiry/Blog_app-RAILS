class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://cdn1.iconfinder.com/data/icons/random-115/24/person-512.png'
      t.text :bio, default: ''
      t.integer :posts_counter,default: 0

      t.timestamps
    end
  end
end