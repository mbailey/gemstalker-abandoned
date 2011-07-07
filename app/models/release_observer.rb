class ReleaseObserver < ActiveRecord::Observer
  def after_create(release)
    release.follows.each do |follow|
      logger.info "Email #{follow.user_email} about release of 
        #{release.rubygem_name}-#{release.version}"
    # code to send notifications
  end
end
