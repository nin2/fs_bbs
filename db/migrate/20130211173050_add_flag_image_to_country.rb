class AddFlagImageToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :flag_image, :string
  end
end
