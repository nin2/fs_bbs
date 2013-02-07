class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :country
      t.string :title

      t.timestamps
    end
    add_index :boards, :country_id
  end
end
