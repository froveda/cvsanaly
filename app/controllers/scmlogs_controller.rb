class ScmlogsController < ApplicationController
  # GET /scmlogs
  # GET /scmlogs.json
  def index
    @scmlogs = Scmlog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scmlogs }
    end
  end

  # GET /scmlogs/1
  # GET /scmlogs/1.json
  def show
    @scmlog = Scmlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scmlog }
    end
  end

  # GET /scmlogs/new
  # GET /scmlogs/new.json
  def new
    @scmlog = Scmlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scmlog }
    end
  end

  # GET /scmlogs/1/edit
  def edit
    @scmlog = Scmlog.find(params[:id])
  end

  # POST /scmlogs
  # POST /scmlogs.json
  def create
    @scmlog = Scmlog.new(params[:scmlog])

    respond_to do |format|
      if @scmlog.save
        format.html { redirect_to @scmlog, notice: 'Scmlog was successfully created.' }
        format.json { render json: @scmlog, status: :created, location: @scmlog }
      else
        format.html { render action: "new" }
        format.json { render json: @scmlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scmlogs/1
  # PUT /scmlogs/1.json
  def update
    @scmlog = Scmlog.find(params[:id])

    respond_to do |format|
      if @scmlog.update_attributes(params[:scmlog])
        format.html { redirect_to @scmlog, notice: 'Scmlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scmlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scmlogs/1
  # DELETE /scmlogs/1.json
  def destroy
    @scmlog = Scmlog.find(params[:id])
    @scmlog.destroy

    respond_to do |format|
      format.html { redirect_to scmlogs_url }
      format.json { head :no_content }
    end
  end
end
