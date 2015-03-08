class Garden < ActiveRecord::Base
  validates_uniqueness_of :number, :name
  has_many :users
end
