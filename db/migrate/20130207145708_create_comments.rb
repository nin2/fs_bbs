class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :board
      t.references :user
      t.text :content

      t.timestamps
    end
    add_index :comments, :board_id
    add_index :comments, :user_id
  end
end
