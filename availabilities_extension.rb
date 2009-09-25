# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class AvailabilitiesExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/availability"

  # Please use availability/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes

    Admin::BaseController.class_eval do
      
      before_filter :add_availability_tab, :add_product_availability_tab
      
      def add_availability_tab
        add_extension_admin_tab [ :availabilities, { :label => "tab_availability" } ]
      end
      
      def add_product_availability_tab
        @product_admin_tabs << {:name => "Availability", :url => "admin_product_view_availability_url"}
      end
    
    end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
