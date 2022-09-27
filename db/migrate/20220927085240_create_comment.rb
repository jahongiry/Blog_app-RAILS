class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, index: true
      t.references :post, null: false, index: true, foreign_key: true
      t.text :text

      t.timestamps
    end

    say "Created Comments table"

    suppress_messages {add_foreign_key :comments, :users, column: :author_id, primary_key: "id"}
    say "add foreign key!", true

    say_with_time 'Waiting for a while' do
      sleep 2
    end
  end
end