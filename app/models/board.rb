class Board < ActiveRecord::Base
  belongs_to :country
  attr_accessible :title
end
