class Country < ActiveRecord::Base
  belongs_to :country_area
  attr_accessible :name
end
