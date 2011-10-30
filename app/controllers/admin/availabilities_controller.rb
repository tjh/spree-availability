class Admin::AvailabilitiesController < Admin::BaseController
  resource_controller

  helper 'spree/base'

  # Removed this to disable AJAX style add since it did not
  # degrade without js and broke my webrat/cucumber features
  #
  # new_action.response do |format|
  #   format.html {render :action => :new, :layout => false}
  # end

  update.response do |format|
    format.html { redirect_to admin_availabilities_path }
  end
  create.response do |format|
    format.html { redirect_to admin_availabilities_path }
  end
end