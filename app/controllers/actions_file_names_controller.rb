class ActionsFileNamesController < ApplicationController
  ## GET /actions_file_names
  ## GET /actions_file_names.json
  #def index
  #  @actions_file_names = ActionsFileName.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @actions_file_names }
  #  end
  #end
  #
  ## GET /actions_file_names/1
  ## GET /actions_file_names/1.json
  #def show
  #  @actions_file_name = ActionsFileName.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @actions_file_name }
  #  end
  #end
  #
  ## GET /actions_file_names/new
  ## GET /actions_file_names/new.json
  #def new
  #  @actions_file_name = ActionsFileName.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @actions_file_name }
  #  end
  #end
  #
  ## GET /actions_file_names/1/edit
  #def edit
  #  @actions_file_name = ActionsFileName.find(params[:id])
  #end
  #
  ## POST /actions_file_names
  ## POST /actions_file_names.json
  #def create
  #  @actions_file_name = ActionsFileName.new(params[:actions_file_name])
  #
  #  respond_to do |format|
  #    if @actions_file_name.save
  #      format.html { redirect_to @actions_file_name, notice: 'Actions file name was successfully created.' }
  #      format.json { render json: @actions_file_name, status: :created, location: @actions_file_name }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @actions_file_name.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## PUT /actions_file_names/1
  ## PUT /actions_file_names/1.json
  #def update
  #  @actions_file_name = ActionsFileName.find(params[:id])
  #
  #  respond_to do |format|
  #    if @actions_file_name.update_attributes(params[:actions_file_name])
  #      format.html { redirect_to @actions_file_name, notice: 'Actions file name was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @actions_file_name.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /actions_file_names/1
  ## DELETE /actions_file_names/1.json
  #def destroy
  #  @actions_file_name = ActionsFileName.find(params[:id])
  #  @actions_file_name.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to actions_file_names_url }
  #    format.json { head :no_content }
  #  end
  #end
end
