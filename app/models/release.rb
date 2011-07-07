class Release < ActiveRecord::Base
  validates_uniqueness_of :version, :scope => :rubygem_name

  belongs_to :rubygem

  after_save :notify_followers

  def notify_followers
    rubygem.follows.each do |follow|
      logger.info "Email #{follow.user_email} about release of #{rubygem_name}-#{version}"
    end
  end

end
