class User < ActiveRecord::Base
  belongs_to :garden

  has_secure_password
  validates_uniqueness_of :email
end
