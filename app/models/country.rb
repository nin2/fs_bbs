class Country < ActiveRecord::Base
  belongs_to :country_area
  attr_accessible :name, :country_area_id
  mount_uploader :flag_image, ImageUploader
end

