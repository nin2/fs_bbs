class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.references :country_area
      t.string :name

      t.timestamps
    end
    add_index :countries, :country_area_id
  end
end
