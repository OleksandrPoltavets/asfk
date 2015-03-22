class Group < ActiveRecord::Base
  validates_presence_of :number, :garden_number
  validates_uniqueness_of :number, scope: :garden_number

  has_many :memberships
  has_many :users, through: :memberships
  has_many :children
end
