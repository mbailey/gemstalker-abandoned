class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not an email") unless
    value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  end
end

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  has_many :follows
  has_many :rubygems, :through => :follows

  validates_presence_of :password, :on => :create
  validates :email, :presence => true, :email => true

  # We're not asking new users to supply a password
  before_validation(:on => :create) do 
    self.password = self.password_confirmation = 'foobar'
  end

end
