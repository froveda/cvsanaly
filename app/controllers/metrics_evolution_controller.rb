class MetricsEvolutionController < ApplicationController
  before_filter :set_repositories, :set_dates_metrics_evo, :set_metrics_types, only: [:metrics_evolution]
  before_filter :set_branches

  ## Metrics Evolution by Branch in time
  def metrics_evolution
  end

  def metrics_evolution_filtered
    from = from(true)
    to = to(true)

    if from.nil? || to.nil? || repository.nil?
      render text: "No results were found."
      return
    end

    @metrics_evo = MetricsEvo.select("date, branch_id, sum(loc) as loc, sum(sloc) as sloc, sum(files) as files")
                     .where(
                       date: (from .. to),
                       branch_id: @branches
                     )
                     .group("date, branch_id")
                     .order("date asc")

    @type = params[:filter][:type]
    if @metrics_evo.any?
      render layout: false
    else
      render text: "No results were found."
    end
  end
end