class Comment < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  attr_accessible :content, :board_id

  validates :user_id, presence: true
  validates :number, presence: true
  validates :content, :length => { :maximum => 500 }
end
