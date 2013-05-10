class FileCopiesController < ApplicationController
  ## GET /file_copies
  ## GET /file_copies.json
  #def index
  #  @file_copies = FileCopy.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @file_copies }
  #  end
  #end
  #
  ## GET /file_copies/1
  ## GET /file_copies/1.json
  #def show
  #  @file_copy = FileCopy.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @file_copy }
  #  end
  #end
  #
  ## GET /file_copies/new
  ## GET /file_copies/new.json
  #def new
  #  @file_copy = FileCopy.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @file_copy }
  #  end
  #end
  #
  ## GET /file_copies/1/edit
  #def edit
  #  @file_copy = FileCopy.find(params[:id])
  #end
  #
  ## POST /file_copies
  ## POST /file_copies.json
  #def create
  #  @file_copy = FileCopy.new(params[:file_copy])
  #
  #  respond_to do |format|
  #    if @file_copy.save
  #      format.html { redirect_to @file_copy, notice: 'File copy was successfully created.' }
  #      format.json { render json: @file_copy, status: :created, location: @file_copy }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @file_copy.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## PUT /file_copies/1
  ## PUT /file_copies/1.json
  #def update
  #  @file_copy = FileCopy.find(params[:id])
  #
  #  respond_to do |format|
  #    if @file_copy.update_attributes(params[:file_copy])
  #      format.html { redirect_to @file_copy, notice: 'File copy was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @file_copy.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /file_copies/1
  ## DELETE /file_copies/1.json
  #def destroy
  #  @file_copy = FileCopy.find(params[:id])
  #  @file_copy.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to file_copies_url }
  #    format.json { head :no_content }
  #  end
  #end
end
