class CountryArea < ActiveRecord::Base
  attr_accessible :name
  has_one :country
end

