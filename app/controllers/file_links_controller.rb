class FileLinksController < ApplicationController
  ## GET /file_links
  ## GET /file_links.json
  #def index
  #  @file_links = FileLink.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @file_links }
  #  end
  #end
  #
  ## GET /file_links/1
  ## GET /file_links/1.json
  #def show
  #  @file_link = FileLink.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @file_link }
  #  end
  #end
  #
  ## GET /file_links/new
  ## GET /file_links/new.json
  #def new
  #  @file_link = FileLink.new
  #
  #  respond_to do |format|
  #    format.html # new.html.erb
  #    format.json { render json: @file_link }
  #  end
  #end
  #
  ## GET /file_links/1/edit
  #def edit
  #  @file_link = FileLink.find(params[:id])
  #end
  #
  ## POST /file_links
  ## POST /file_links.json
  #def create
  #  @file_link = FileLink.new(params[:file_link])
  #
  #  respond_to do |format|
  #    if @file_link.save
  #      format.html { redirect_to @file_link, notice: 'File link was successfully created.' }
  #      format.json { render json: @file_link, status: :created, location: @file_link }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @file_link.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## PUT /file_links/1
  ## PUT /file_links/1.json
  #def update
  #  @file_link = FileLink.find(params[:id])
  #
  #  respond_to do |format|
  #    if @file_link.update_attributes(params[:file_link])
  #      format.html { redirect_to @file_link, notice: 'File link was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @file_link.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
  #
  ## DELETE /file_links/1
  ## DELETE /file_links/1.json
  #def destroy
  #  @file_link = FileLink.find(params[:id])
  #  @file_link.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to file_links_url }
  #    format.json { head :no_content }
  #  end
  #end
end
