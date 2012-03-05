class User < ActiveRecord::Base
  devise :cas_authenticatable

  attr_accessible :username

  validates_presence_of :username
  validates_uniqueness_of :username

end
