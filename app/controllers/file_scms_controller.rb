class FileScmsController < ApplicationController
  ## GET /file_scms
  ## GET /file_scms.json
  #def index
  #  @file_scms = FileScm.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @file_scms }
  #  end
  #end
  #
  ## GET /file_scms/1
  ## GET /file_scms/1.json
  #def show
  #  @file_scm = FileScm.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @file_scm }
  #  end
  #end
  #
  ## GET /file_scms/new
  ## GET /file_scms/new.json
  #def new
  #  @file_scm = FileScm.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @file_scm }
  #  end
  #end
  #
  ## GET /file_scms/1/edit
  #def edit
  #  @file_scm = FileScm.find(params[:id])
  #end
  #
  ## POST /file_scms
  ## POST /file_scms.json
  #def create
  #  @file_scm = FileScm.new(params[:file_scm])
  #
  #  respond_to do |format|
  #    if @file_scm.save
  #      format.html { redirect_to @file_scm, notice: 'File scm was successfully created.' }
  #      format.json { render json: @file_scm, status: :created, location: @file_scm }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @file_scm.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## PUT /file_scms/1
  ## PUT /file_scms/1.json
  #def update
  #  @file_scm = FileScm.find(params[:id])
  #
  #  respond_to do |format|
  #    if @file_scm.update_attributes(params[:file_scm])
  #      format.html { redirect_to @file_scm, notice: 'File scm was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @file_scm.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /file_scms/1
  ## DELETE /file_scms/1.json
  #def destroy
  #  @file_scm = FileScm.find(params[:id])
  #  @file_scm.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to file_scms_url }
  #    format.json { head :no_content }
  #  end
  #end
end
