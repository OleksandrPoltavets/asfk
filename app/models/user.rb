class User < ActiveRecord::Base
  validates_uniqueness_of :email
  has_secure_password

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :children
end
