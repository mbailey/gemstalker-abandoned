class Alert < ActiveRecord::Base

  belongs_to :user
  belongs_to :release
  belongs_to :notification

  validates_uniqueness_of :user_id, 
    :scope => :release_id,
    :message => "user alert already exists for to this release"

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
