class Group < ActiveRecord::Base
  validates_uniqueness_of :number, :name

  has_many :memberships
  has_many :users, through: :memberships
  has_many :children
end
