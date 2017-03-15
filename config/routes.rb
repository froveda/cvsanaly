Cvsanaly::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :skip => 'invitation'

  match "files_history" => "welcome#files_history"
  match "loc_by_rev" => "welcome#loc_by_rev"
  match "modifications_amount_by_commit" => "welcome#modifications_amount_by_commit"
  match "modifications_amount_by_commit_filtered" => "welcome#modifications_amount_by_commit_filtered"
  match "bad_smell_by_sloc" => "welcome#bad_smell_by_sloc"
  match "bad_smell_by_sloc_filtered" => "welcome#bad_smell_by_sloc_filtered"
  match "bad_smell_by_nfunctions" => "welcome#bad_smell_by_nfunctions"
  match "bad_smell_by_nfunctions_filtered" => "welcome#bad_smell_by_nfunctions_filtered"
  match "metrics_evolution" => "welcome#metrics_evolution"
  match "metrics_evolution_filtered" => "welcome#metrics_evolution_filtered"
  match "commit_lines_graph" => "welcome#commit_lines_graph"
  match "loc_sum_by_date" => "welcome#loc_sum_by_date"
  match "loc_sum_by_date_filtered" => "welcome#loc_sum_by_date_filtered"
  match "change_dates" => "welcome#change_dates"
  match "change_dates_for_metrics_evo" => "welcome#change_dates_for_metrics_evo"

  root :to => "welcome#home"
end
