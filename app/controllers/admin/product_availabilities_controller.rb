class Admin::ProductAvailabilitiesController < Admin::BaseController
  resource_controller

  belongs_to :product

  show.before do
    @availabilities = Availability.all
  end

  def update_availabilities
    product = Product.find_by_permalink(params[:product_id])
    if product.update_attributes(params[:product])
      flash[:notice] = "Product availabilities updated."
    else
      flash[:notice] = "Product availabilities update failed."
    end
    redirect_to admin_product_view_availability_path(product)
  end

end