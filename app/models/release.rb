class Release < ActiveRecord::Base
  validates_uniqueness_of :version, :scope => :rubygem_name

  belongs_to :rubygem

  has_many :alerts
  has_many :users, :through => :alerts

  after_save :update_alerts

  def update_alerts
    disable_old_alerts
    create_alerts
  end

  def disable_old_alerts
    rubygem.alerts.where('release_date < ?', release_date).each do |alert|
      alert.update_attributes :disabled => true
    end
  end

  def create_alerts
    rubygem.follows.each do |follow|
      follow.user.releases << self
      # UserMailer.release_notification(follow, self).deliver
    end
  end

end
