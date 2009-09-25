module AvailabilitiesHelper
  
  def variant_availability( variant )
    variant.in_stock? ? variant.availability_message_in_stock : variant.availability_message_out_of_stock
  end
  
end
