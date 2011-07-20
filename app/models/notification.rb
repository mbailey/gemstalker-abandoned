class Notification < ActiveRecord::Base

  belongs_to :user
  has_many :alerts

  validates_presence_of :user

end
