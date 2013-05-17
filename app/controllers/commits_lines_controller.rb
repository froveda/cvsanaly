class CommitsLinesController < ApplicationController
  # GET /commits_lines
  # GET /commits_lines.json
  def index
    @commits_lines = CommitsLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @commits_lines }
    end
  end

  # GET /commits_lines/1
  # GET /commits_lines/1.json
  def show
    @commits_line = CommitsLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @commits_line }
    end
  end

  # GET /commits_lines/new
  # GET /commits_lines/new.json
  def new
    @commits_line = CommitsLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @commits_line }
    end
  end

  # GET /commits_lines/1/edit
  def edit
    @commits_line = CommitsLine.find(params[:id])
  end

  # POST /commits_lines
  # POST /commits_lines.json
  def create
    @commits_line = CommitsLine.new(params[:commits_line])

    respond_to do |format|
      if @commits_line.save
        format.html { redirect_to @commits_line, notice: 'Commits line was successfully created.' }
        format.json { render json: @commits_line, status: :created, location: @commits_line }
      else
        format.html { render action: "new" }
        format.json { render json: @commits_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /commits_lines/1
  # PUT /commits_lines/1.json
  def update
    @commits_line = CommitsLine.find(params[:id])

    respond_to do |format|
      if @commits_line.update_attributes(params[:commits_line])
        format.html { redirect_to @commits_line, notice: 'Commits line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commits_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commits_lines/1
  # DELETE /commits_lines/1.json
  def destroy
    @commits_line = CommitsLine.find(params[:id])
    @commits_line.destroy

    respond_to do |format|
      format.html { redirect_to commits_lines_url }
      format.json { head :no_content }
    end
  end
end
