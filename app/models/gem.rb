class Gem < ActiveModel::Base
  attr_accessor :name
  has_many :releases
end
