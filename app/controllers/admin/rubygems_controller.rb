class Admin::RubygemsController < Admin::Base

  def snoop
    @rubygem = Rubygem.find(params[:id])
    new_releases = @rubygem.snoop
    redirect_to [:admin, @rubygem], notice: "Added #{new_releases.size} new releases for #{@rubygem.name}"
  end

  # GET /rubygems
  # GET /rubygems.json
  def index
    @rubygems = Rubygem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rubygems }
    end
  end

  # GET /rubygems/1
  # GET /rubygems/1.json
  def show
    @rubygem = Rubygem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rubygem }
    end
  end

  # GET /rubygems/new
  # GET /rubygems/new.json
  def new
    @rubygem = Rubygem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rubygem }
    end
  end

  # GET /rubygems/1/edit
  def edit
    @rubygem = Rubygem.find(params[:id])
  end

  # POST /rubygems
  # POST /rubygems.json
  def create
    @rubygem = Rubygem.new(params[:rubygem])

    respond_to do |format|
      if @rubygem.save
        format.html { redirect_to @rubygem, notice: 'Rubygem was successfully created.' }
        format.json { render json: @rubygem, status: :created, location: @rubygem }
      else
        format.html { render action: "new" }
        format.json { render json: @rubygem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rubygems/1
  # PUT /rubygems/1.json
  def update
    @rubygem = Rubygem.find(params[:id])

    respond_to do |format|
      if @rubygem.update_attributes(params[:rubygem])
        format.html { redirect_to @rubygem, notice: 'Rubygem was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @rubygem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rubygems/1
  # DELETE /rubygems/1.json
  def destroy
    @rubygem = Rubygem.find(params[:id])
    @rubygem.destroy

    respond_to do |format|
      format.html { redirect_to rubygems_url }
      format.json { head :ok }
    end
  end
end
