require File.dirname(__FILE__) + '/../spec_helper'

describe Availability do
  before(:each) do
    @valid_attributes = {
      :text => 'In stock'
    }
  end
  
  it "should create a new instance given valid attributes" do
    Availability.create!(@valid_attributes)
  end
  
  it { should validate_presence_of( :text ) }
  
  # Not sure why this won't work...bombs with "Can't find first Availability"
  # it { should validate_uniqueness_of( :text ) }
  
  it "should only accept unique Availability messages" do
    Availability.create!(@valid_attributes)
    Availability.new.should validate_uniqueness_of( :text )
  end

  it "should not allow deletion if used by products" do
    availability1 = Availability.create!( :text => 'In stock' )
    availability2 = Availability.create!( :text => 'Out of stock' )
    product = Product.create!(
      :name => 'Product',
      :price => 9.99 
    )
    product.availability_id_in_stock = availability1.id
    product.availability_id_out_of_stock = availability2.id
    
     
  end
end