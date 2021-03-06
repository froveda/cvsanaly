class BadSmellBySlocController < ApplicationController
  before_filter :set_repositories, only: [:bad_smell_by_sloc]

  ## Bad Smell by SLOC
  def bad_smell_by_sloc
  end

  def bad_smell_by_sloc_filtered
    limit = params[:filter][:limit] rescue nil

    if limit.nil? || repository.nil?
      render text: "No results were found."
      return
    end

    @metrics = Metric.includes(:file)
                 .where(files: { repository_id: repository }, metrics:{ lang: 'java' })
                 .where(["metrics.sloc > ?", limit])
                 .group("metrics.file_id")

    if @metrics.any?
      render layout: false
    else
      render text: "No results were found."
    end
  end
end