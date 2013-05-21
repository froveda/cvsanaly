class MetricsEvosController < ApplicationController
  # GET /metrics_evos
  # GET /metrics_evos.json
  def index
    @metrics_evos = MetricsEvo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metrics_evos }
    end
  end

  # GET /metrics_evos/1
  # GET /metrics_evos/1.json
  def show
    @metrics_evo = MetricsEvo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @metrics_evo }
    end
  end

  # GET /metrics_evos/new
  # GET /metrics_evos/new.json
  def new
    @metrics_evo = MetricsEvo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @metrics_evo }
    end
  end

  # GET /metrics_evos/1/edit
  def edit
    @metrics_evo = MetricsEvo.find(params[:id])
  end

  # POST /metrics_evos
  # POST /metrics_evos.json
  def create
    @metrics_evo = MetricsEvo.new(params[:metrics_evo])

    respond_to do |format|
      if @metrics_evo.save
        format.html { redirect_to @metrics_evo, notice: 'Metrics evo was successfully created.' }
        format.json { render json: @metrics_evo, status: :created, location: @metrics_evo }
      else
        format.html { render action: "new" }
        format.json { render json: @metrics_evo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /metrics_evos/1
  # PUT /metrics_evos/1.json
  def update
    @metrics_evo = MetricsEvo.find(params[:id])

    respond_to do |format|
      if @metrics_evo.update_attributes(params[:metrics_evo])
        format.html { redirect_to @metrics_evo, notice: 'Metrics evo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @metrics_evo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics_evos/1
  # DELETE /metrics_evos/1.json
  def destroy
    @metrics_evo = MetricsEvo.find(params[:id])
    @metrics_evo.destroy

    respond_to do |format|
      format.html { redirect_to metrics_evos_url }
      format.json { head :no_content }
    end
  end
end
