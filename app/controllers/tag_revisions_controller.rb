class TagRevisionsController < ApplicationController
  # GET /tag_revisions
  # GET /tag_revisions.json
  def index
    @tag_revisions = TagRevision.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tag_revisions }
    end
  end

  # GET /tag_revisions/1
  # GET /tag_revisions/1.json
  def show
    @tag_revision = TagRevision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag_revision }
    end
  end

  # GET /tag_revisions/new
  # GET /tag_revisions/new.json
  def new
    @tag_revision = TagRevision.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag_revision }
    end
  end

  # GET /tag_revisions/1/edit
  def edit
    @tag_revision = TagRevision.find(params[:id])
  end

  # POST /tag_revisions
  # POST /tag_revisions.json
  def create
    @tag_revision = TagRevision.new(params[:tag_revision])

    respond_to do |format|
      if @tag_revision.save
        format.html { redirect_to @tag_revision, notice: 'Tag revision was successfully created.' }
        format.json { render json: @tag_revision, status: :created, location: @tag_revision }
      else
        format.html { render action: "new" }
        format.json { render json: @tag_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tag_revisions/1
  # PUT /tag_revisions/1.json
  def update
    @tag_revision = TagRevision.find(params[:id])

    respond_to do |format|
      if @tag_revision.update_attributes(params[:tag_revision])
        format.html { redirect_to @tag_revision, notice: 'Tag revision was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_revisions/1
  # DELETE /tag_revisions/1.json
  def destroy
    @tag_revision = TagRevision.find(params[:id])
    @tag_revision.destroy

    respond_to do |format|
      format.html { redirect_to tag_revisions_url }
      format.json { head :no_content }
    end
  end
end
