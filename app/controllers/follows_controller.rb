class FollowsController < ApplicationController

  def create
    @rubygem = Rubygem.find_or_create_by_name(params[:rubygem])
    if current_user.errors
      redirect_to rubygem_path(@rubygem.name), 
        :notice => "That's not a valid email address"
    elsif current_user.rubygems.find_by_name(params[:rubygem]) 
      redirect_to rubygem_path(@rubygem.name), 
        :notice => "You were already following #{@rubygem.name}"
    elsif current_user.rubygems << @rubygem 
      redirect_to rubygem_path(@rubygem.name), 
        :notice => "We'll email you about new releases of #{@rubygem.name}"
    else
      redirect_to root_url, 
        :notice => "Failed to subscribe to #{@rubygem.name})"
    end
  end

  def destroy
    rubygem = params[:rubygem]
    if ! current_user.rubygems.find_by_name(rubygem) 
      redirect_to rubygem_path(rubygem), 
        :notice => "You were not following #{rubygem}"
    elsif current_user.rubygems.find_by_name(rubygem).destroy
      redirect_to rubygem_path(rubygem), 
        :notice => "You unfollowed #{rubygem}"
    else
      redirect_to rubygem_path(rubygem), 
        :notice => "You can't seem to stop following #{rubygem}"
    end

  end

end
