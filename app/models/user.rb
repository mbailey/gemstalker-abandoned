class User < ActiveRecord::Base
  has_many :follows
  has_many :rubygems, :through => :follows
end
