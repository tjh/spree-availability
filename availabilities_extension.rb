class AvailabilitiesExtension < Spree::Extension
  version "1.0"
  description "Choose custom messages to display when a product is in stock or out of stock"
  url "http://timharvey.net"

  def activate
    Variant.class_eval do
      def availability_message_out_of_stock
        Availability.find( self.product.availability_id_out_of_stock ).text
      end
      
      def availability_message_in_stock
        Availability.find( self.product.availability_id_in_stock ).text
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

    Admin::ConfigurationsController.class_eval do
      before_filter :add_availability_link, :only => :index

      def add_availability_link
        @extension_links << {:link => admin_availabilities_path, :link_text => t('tab_availability'), :description => t('tab_availability_desc')}
      end
    end
    
    Spree::BaseController.class_eval do
      helper AvailabilitiesHelper
    end
  end
end
