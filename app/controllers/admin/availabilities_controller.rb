class Admin::AvailabilitiesController < Admin::BaseController
  resource_controller

  helper 'spree/base'

  new_action.response do |format|
    format.html {render :action => :new, :layout => false}
  end
  update.response do |format|
    format.html { redirect_to admin_availabilities_path }
  end
  create.response do |format|
    format.html { redirect_to admin_availabilities_path }
  end
end