class Admin::ProductAvailabilitiesController < Admin::BaseController
  resource_controller

  belongs_to :product
  
  show.before do
    @test_var = 'Testing!'
    @availabilities = Availability.all
  end
  
end
