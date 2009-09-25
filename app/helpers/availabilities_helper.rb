module AvailabilitiesHelper
  
  def variant_availability( variant )
    p variant.product.inspect
    variant.in_stock? ? variant.product.availability_message_in_stock : variant.product.availability_message_out_of_stock
  end
  
end
