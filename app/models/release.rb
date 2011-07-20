class Release < ActiveRecord::Base

  belongs_to :rubygem

  has_many :alerts, :dependent => :destroy
  has_many :users, :through => :alerts

  after_save :update_alerts

  scope :stable, where(:pre => false)
  scope :pre, where(:pre => true)
  scope :first, order('release_date desc').limit(1)
  scope :last, order('release_date asc').limit(1)

  validates_uniqueness_of :version, :scope => :rubygem_name

  def newest?
    Release.where('release_date > ? and rubygem_id = ?', 
      release_date, rubygem_id).blank?
  end

  def update_alerts
    if newest? && release_date > 1.day.ago
      disable_old_alerts
      create_alerts
    end
  end

  def disable_old_alerts
    rubygem.alerts.where('release_date < ?', release_date).each do |alert|
      alert.destroy
    end
  end

  def create_alerts
    rubygem.follows.each do |follow|
      follow.user.releases << self
      # UserMailer.release_notification(follow, self).deliver
    end
  end

end
