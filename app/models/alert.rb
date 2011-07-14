class Alert < ActiveRecord::Base

  belongs_to :user
  belongs_to :release

  validates_uniqueness_of :user_id, 
    :scope => :release_id,
    :message => "user alert already exists for to this release"

  after_save do
    release.disable_old_alerts
  end

  def enable
    update_attributes :disabled => false
  end

  def disable
    update_attributes :disabled => true
  end

  def user_email
    user.email
  end

  def rubygem_name
    release.rubygem.name
  rescue
    nil
  end
  
  def rubygem_version
    release.version
  rescue
    nil
  end
  
  def release_date
    release.release_date.to_date
  rescue
    nil
  end
end
