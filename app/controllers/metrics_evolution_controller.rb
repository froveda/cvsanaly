class MetricsEvolutionController < ApplicationController
  before_filter :set_repositories, only: [:metrics_evolution]
  before_filter :set_branches, only: [:metrics_evolution, :metrics_evolution_filtered]
  before_filter :set_dates, only: [:metrics_evolution]
  before_filter :set_metrics_types, only: [:metrics_evolution]

  ## Metrics Evolution by Branch in time
  def metrics_evolution
    @from += 1.month
  end

  def metrics_evolution_filtered
    @metrics_evo = MetricsEvo
                     .where(date: (from .. to), branch_id: @branches.map(&:id))
                     .order("date asc")

    @type = params[:filter][:type]
    if @metrics_evo.any?
      render :layout => false
    else
      render :text => "No results were found."
    end
  end
end