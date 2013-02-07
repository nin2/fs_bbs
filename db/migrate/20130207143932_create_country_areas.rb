class CreateCountryAreas < ActiveRecord::Migration
  def change
    create_table :country_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
