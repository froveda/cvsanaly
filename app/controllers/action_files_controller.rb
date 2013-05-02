class ActionFilesController < ApplicationController
  # GET /action_files
  # GET /action_files.json
  def index
    @action_files = ActionFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @action_files }
    end
  end

  # GET /action_files/1
  # GET /action_files/1.json
  def show
    @action_file = ActionFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action_file }
    end
  end

  # GET /action_files/new
  # GET /action_files/new.json
  def new
    @action_file = ActionFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_file }
    end
  end

  # GET /action_files/1/edit
  def edit
    @action_file = ActionFile.find(params[:id])
  end

  # POST /action_files
  # POST /action_files.json
  def create
    @action_file = ActionFile.new(params[:action_file])

    respond_to do |format|
      if @action_file.save
        format.html { redirect_to @action_file, notice: 'Action file was successfully created.' }
        format.json { render json: @action_file, status: :created, location: @action_file }
      else
        format.html { render action: "new" }
        format.json { render json: @action_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /action_files/1
  # PUT /action_files/1.json
  def update
    @action_file = ActionFile.find(params[:id])

    respond_to do |format|
      if @action_file.update_attributes(params[:action_file])
        format.html { redirect_to @action_file, notice: 'Action file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @action_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_files/1
  # DELETE /action_files/1.json
  def destroy
    @action_file = ActionFile.find(params[:id])
    @action_file.destroy

    respond_to do |format|
      format.html { redirect_to action_files_url }
      format.json { head :no_content }
    end
  end
end
