class RubygemsController < ApplicationController

  def show
    @rubygem = Rubygem.find_or_create_by_name params[:name]
    if ! @rubygem.errors.empty?
      redirect_to gem_page_path(:name=>'rails'), :notice => @rubygem.errors.full_messages.first
    end
  end

end
