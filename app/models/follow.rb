class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :rubygem

  validates_uniqueness_of :user_id, 
    :scope => :rubygem_id,
    :message => "already following this rubygem"

  def user_email
    user.email
  end

  def rubygem_name
    rubygem.name
  end
end
