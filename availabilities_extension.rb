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

    Admin::ConfigurationsController.class_eval do
      before_filter :add_availability_link, :only => :index

      def add_availability_link
        @extension_links << {:link => admin_availabilities_path, :link_text => t('tab_availability'), :description => t('tab_availability_desc')}
      end
    end

    Product.class_eval do
      def availability_message_out_of_stock
        Availability.find( self.availability_id_out_of_stock ).text
      end
      
      def availability_message_in_stock
        Availability.find( self.availability_id_in_stock ).text
      end
    end

    Admin::BaseController.class_eval do
      
      before_filter :add_product_availability_tab

      def add_product_availability_tab
        @product_admin_tabs << {:name => t("tab_product_availability"), :url => "admin_product_view_availability_url"}
      end


      # Removed the following and decided to leave it in the "Configuration" tab
      # instead of its own tab.
      # 
      # before_filter :add_availability_tab
      # 
      # def add_availability_tab
      #   # Seems broken, not sure what happened, used to work
      #   add_extension_admin_tab [ :availabilities, { :label => "tab_availability" } ]
      # end
      
    end

    # make your helper avaliable in all views
    Spree::BaseController.class_eval do
      helper AvailabilitiesHelper
    end
  end
end
