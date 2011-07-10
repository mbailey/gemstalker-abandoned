class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  has_many :follows
  has_many :rubygems, :through => :follows

  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email

  # We're not asking new users to supply a password
  before_validation(:on => :create) do 
    self.password = self.password_confirmation = 'foobar'
  end

end
