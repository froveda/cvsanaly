class BadSmellByNfunctionsController < ApplicationController
  before_filter :set_repositories, only: [:bad_smell_by_nfunctions]

  ## Bad Smell by Number of Methods
  def bad_smell_by_nfunctions
  end

  def bad_smell_by_nfunctions_filtered
    limit = params[:filter][:limit]
    @metrics = Metric.includes(:commit, :file)
                 .where(files: { repository_id: repository }, metrics:{ lang: 'java' })
                 .where(["metrics.nfunctions > ?", limit])
                 .group("metrics.file_id")

    if @metrics.any?
      render layout: false
    else
      render text: "No results were found."
    end
  end
end