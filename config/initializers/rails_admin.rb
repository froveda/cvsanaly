RailsAdmin.config do |config|

  config.authorize_with do |controller|
    unless current_user && current_user.admin?
      redirect_to main_app.root_path, error: "Access Denied"
    end
  end

  config.main_app_name = ['Cvsanaly', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.excluded_models = ["ActionFile","ActionsFileName"]

  config.actions do
    dashboard                     # mandatory
                                  # collection actions
    index                         # mandatory
    export
                                  # member actions
    show
  end
end
