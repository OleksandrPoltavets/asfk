class Group < ActiveRecord::Base
  validates_uniqueness_of :number, :name

  belongs_to :garden
  has_many :memberships
  has_many :users, through: :memberships
end
