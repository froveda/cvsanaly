Cvsanaly::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :skip => 'invitation'

  match "loc_sum_by_date" => "loc_sloc_sum_in_time#loc_sum_by_date"
  match "loc_sum_by_date_filtered" => "loc_sloc_sum_in_time#loc_sum_by_date_filtered"

  match "modifications_amount_by_commit" => "modifications_amount_by_commit#modifications_amount_by_commit"
  match "modifications_amount_by_commit_filtered" => "modifications_amount_by_commit#modifications_amount_by_commit_filtered"

  match "metrics_evolution" => "metrics_evolution#metrics_evolution"
  match "metrics_evolution_filtered" => "metrics_evolution#metrics_evolution_filtered"

  match "bad_smell_by_sloc" => "bad_smell_by_sloc#bad_smell_by_sloc"
  match "bad_smell_by_sloc_filtered" => "bad_smell_by_sloc#bad_smell_by_sloc_filtered"

  match "bad_smell_by_nfunctions" => "bad_smell_by_nfunctions#bad_smell_by_nfunctions"
  match "bad_smell_by_nfunctions_filtered" => "bad_smell_by_nfunctions#bad_smell_by_nfunctions_filtered"

  match "change_dates" => "application#change_dates"
  match "change_dates_for_metrics_evo" => "application#change_dates_for_metrics_evo"
  match "change_branches" => "application#change_branches"
  match "change_commiters" => "application#change_commiters"

  root :to => "welcome#home"
end
